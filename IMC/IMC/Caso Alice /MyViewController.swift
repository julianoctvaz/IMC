//
//  MyViewController.swift
//  IMC
//
//  Created by Juliano on 11/04/25.
//

import UIKit

class MyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let items = ["Maçã", "Banana", "Cereja"]
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomCell else {
            return UITableViewCell()
        }
        cell.textLabel?.text = items[indexPath.row]
        cell.delegate = self
        cell.selectionStyle = .none //para nao cinzar o toque na celula
       
        /* cell.actionButton2 = {
            print("Botão tocado na linha \(indexPath.row)")
                  let item = self.items[indexPath.row]
                  // Faça algo com o item
        } */
        
//        Esse exemplo acima do actionbutton2 é caso nao fosse usar closure e precisasse de dados que so a controller tem como o index
        
        return cell
    }
}

extension MyViewController: CustomCellDelegate {
    func didTapButton(in cell: CustomCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let item = items[indexPath.row]
        print("Botão da célula \(indexPath.row) tocado! Item: \(item)")
        //usamos o delegate para recuperar o indice! Nao conseguiriamos tao facilmente dentro da propria celula, poderiamos tambem criar uma variavel (closure) que teria uma funacao que é mandado de dentro da criacao da celula na funcao cellForRowAt, e que teria em si o index, assim ao chamar a closure dentro da acao na celular ela teria esse valor guardado em si.
    }
}

#Preview {
    MyViewController()
}
