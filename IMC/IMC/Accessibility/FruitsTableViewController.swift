//
//  FruitsTableViewController.swift
//  IMC
//
//  Created by Juliano on 03/04/25.
//


import UIKit

// Sobre nossa classe herdada: Quando vale a pena usar UIViewController em vez dos controllers especializados?
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

        // Para usar self-sizing cells com Auto Layout (mas tem como fazer manual, como ja vimos, ou fazer calculos para esstimar, apesar dessa ultima forma ser mais propenso a erros)!
        tableView.rowHeight = UITableView.automaticDimension //Setando altura automatica
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

        // Acessibilidade personalizada! Aqui tornamos nossa celular acessivel! Poderiamos fazer uma funcao separada como na FruitCollectionViewController.
        
        cell.isAccessibilityElement = true
        cell.accessibilityLabel = "Fruta: \(fruit)"
        cell.accessibilityHint = "Deslize para cima ou para baixo para mais opções"

        return cell
    }

    // MARK: - Swipe actions (já automaticamente acessível via VoiceOver)

    override func tableView(_ tableView: UITableView,
                          trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath)
    -> UISwipeActionsConfiguration? {

        // Cria ação de exclusão com estilo destrutivo! Via Esquerda! Trailing!
        let deleteAction = UIContextualAction(style: .destructive,
                                            title: "Excluir") {
            [weak self] action, view, completion in
            // Veremos no futuro, mas usamos [weak self] para evitar retain cycle (retencao de ciclo na memoria do iOS), já que a closure será armazenada numa variavel, entao
            // O guard let verifica se a view controller ainda existe, isto é, verifica se a tela ainda está aberta quando o usuário clicar, quando a ação for executada:
            guard let self = self else {
                completion(false)
                // Importante chamar completion handler aqui, mas nao é obg! ele é do tipo (Bool) -> Void
                // Se nao puder fazer a acao, para indicar que a ação não foi completada enviamos false
                return
            }
            
            // Implementação da ação de exclusão virá aqui
            // self pode ser usado com SEGURANÇA agora!
            
            print("🗑️ Excluindo \(self.fruits[indexPath.row])")
            self.fruits.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }

        deleteAction.backgroundColor = .systemRed
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
//        finalmente devolvemos aqui a acao configurada
        return configuration
    }
}

#Preview {
    FruitsTableViewController()
}
