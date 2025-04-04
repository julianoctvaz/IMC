//
//  ListandoMentoresViewController+DataSource+Delegate.swift
//  IMC
//
//  Created by Francisco Miranda Soares on 03/04/25.
//

import UIKit

extension ListandoMentoresViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mentores.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ListandoMentoresTableViewCell.cellIdentifier,
            for: indexPath
        ) as? ListandoMentoresTableViewCell

        cell?.nameLabel.text = mentores[indexPath.row]


        return cell ?? UITableViewCell()
    }

}

extension ListandoMentoresViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // implementa aqui comportamento para seleção da linha
        print(mentores[indexPath.row])
    }
}
