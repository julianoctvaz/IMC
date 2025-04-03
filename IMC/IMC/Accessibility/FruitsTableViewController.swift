//
//  FruitsTableViewController.swift
//  IMC
//
//  Created by Juliano on 03/04/25.
//


import UIKit

//✅ Sobre nossa classe herdada: Quando vale a pena usar UIViewController em vez dos controllers especializados?
//
//Use UIViewController quando:
//Você precisa mais controle sobre o layout (ex: colocar botões, labels, outras views fora da tabela/coleção).
//Você quer integrar vários componentes na mesma tela, não só uma lista.
//Você prefere construir tudo com ViewCode.

class FruitsTableViewController: UITableViewController {
// o UITableViewController já conforma aos protocolos UITableViewDataSource e UITableViewDelegate!!! Inspeciona ele:
//    open class UITableViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
//    
//    nem precisamos escrever isso:
//    tableView.delegate = self
//    tableView.dataSource = self


    var fruits = ["Banana", "Maçã", "Laranja", "Abacaxi", "Melancia"]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Frutas"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "FruitCell")

        // Para usar self-sizing cells com Auto Layout
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60 // Estimativa para ajudar na performance
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FruitCell", for: indexPath)
        let fruit = fruits[indexPath.row]

        cell.textLabel?.text = fruit
        cell.textLabel?.numberOfLines = 0 // Permite múltiplas linhas para suportar texto dinâmico
        cell.textLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        cell.textLabel?.adjustsFontForContentSizeCategory = true // Suporte a tamanhos dinâmicos (Acessibilidade)

        // Acessibilidade personalizada
        cell.isAccessibilityElement = true
        cell.accessibilityLabel = "Fruta: \(fruit)"
        cell.accessibilityHint = "Deslize para cima ou para baixo para mais opções"

        return cell
    }

    // MARK: - Swipe actions

    override func tableView(_ tableView: UITableView,
                            trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath)
    -> UISwipeActionsConfiguration? {

        let deleteAction = UIContextualAction(style: .destructive,
                                              title: "Excluir") { [weak self] action, view, completion in
            guard let self = self else { return }
            print("🗑️ Excluindo \(self.fruits[indexPath.row])")
            self.fruits.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }

        deleteAction.backgroundColor = .systemRed
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }

    // MARK: - Ajuste manual de altura da célula (método alternativo)

    // Essa abordagem é mais performática mas mais propensa a erros
    // Pode ser usada quando Auto Layout for pesado demais
    // Comente/descomente para testar

//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let text = fruits[indexPath.row]
//        let width = tableView.frame.width - 32
//        let font = UIFont.systemFont(ofSize: 17)
//        let boundingRect = NSString(string: text).boundingRect(
//            with: CGSize(width: width, height: .greatestFiniteMagnitude),
//            options: .usesLineFragmentOrigin,
//            attributes: [.font: font],
//            context: nil
//        )
//        return ceil(boundingRect.height + 16)
//    }

    // Essa questão é común em entrevistas pois testa:
    // - Conhecimento de Auto Layout
    // - Uso correto de fontes dinâmicas
    // - Trade-off entre performance x simplicidade
    // O ideal é usar self-sizing cells sempre que possível e recorrer ao heightForRow apenas se houver problemas de performance.
}

#Preview {
    FruitsTableViewController()
}
