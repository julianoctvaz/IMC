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
        return cell
    }
}

extension MyViewController: CustomCellDelegate {
    func didTapButton(in cell: CustomCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let item = items[indexPath.row]
        print("Botão da célula \(indexPath.row) tocado! Item: \(item)")
    }
}

#Preview {
    MyViewController()
}
