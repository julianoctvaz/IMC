//
//  ListandoMentoresViewController.swift
//  IMC
//
//  Created by Francisco Miranda Soares on 02/04/25.
//

import UIKit

class ListandoMentoresViewController: UIViewController {
    let cellIdentifier = "cell"

    // MARK: - Propriedades
    let mentores = ["Chico", "Juli", "Thaís", "Thales"]

    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(
            ListandoMentoresTableViewCell.self,
            forCellReuseIdentifier: cellIdentifier
        )
        table.dataSource = self
        return table
    }()

    // MARK: - Ciclo de vida
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - Setup views

    private func setupView() {
        setupViewHierarchy()
        setupConstraints()
        setupViewAttributes()
    }

    private func setupViewHierarchy() {
        view.addSubview(tableView)
    }

    private func setupViewAttributes() {
        tableView.backgroundColor = .red
        tableView.rowHeight = 80
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

extension ListandoMentoresViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mentores.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: cellIdentifier,
            for: indexPath
        ) as? ListandoMentoresTableViewCell

        cell?.nameLabel.text = mentores[indexPath.row]


        return cell ?? UITableViewCell()
    }

}

#Preview {
    ListandoMentoresViewController()
}
