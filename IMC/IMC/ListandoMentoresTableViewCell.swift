//
//  ListandoMentoresTableViewCell.swift
//  IMC
//
//  Created by Francisco Miranda Soares on 02/04/25.
//

import UIKit

class ListandoMentoresTableViewCell: UITableViewCell {

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // TODO: - implementar comportamento de seleção
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // MARK: - UI setup

    private func setup(){
        setupViewHierarchy()
        setupViewAttributes()
        setupConstraints()
    }

    private func setupViewHierarchy() {
        self.addSubview(nameLabel)
    }

    private func setupViewAttributes() {
        nameLabel.textColor = .red
        nameLabel.font = .systemFont(ofSize: 30, weight: .bold)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}

#Preview {
    ListandoMentoresViewController()
}
