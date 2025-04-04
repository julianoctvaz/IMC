//
//  ListandoMentoresViewController.swift
//  IMC
//
//  Created by Francisco Miranda Soares on 02/04/25.
//

import UIKit

class ListandoMentoresViewController: UIViewController {

    // MARK: - Propriedades
    let mentores = ["Chico", "Juli", "Thaís", "Thales"]

    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(
            ListandoMentoresTableViewCell.self,
            forCellReuseIdentifier: ListandoMentoresTableViewCell.cellIdentifier
        )
        table.dataSource = self
        table.delegate = self
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
        self.title = "Mentores"
        navigationController?.navigationBar.prefersLargeTitles = true
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



#Preview {
    UINavigationController(
        rootViewController:
            ListandoMentoresViewController()
    )
}
