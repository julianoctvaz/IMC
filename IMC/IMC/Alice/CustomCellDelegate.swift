//
//  CustomCellDelegate.swift
//  IMC
//
//  Created by Juliano on 11/04/25.
//

import UIKit

protocol CustomCellDelegate: AnyObject {
    func didTapButton(in cell: CustomCell)
    //consegue acessar o index, mas nao os elementos da celula provavelmente
}

class CustomCell: UITableViewCell {

    weak var delegate: CustomCellDelegate?

    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Toque em mim", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(actionButton)
        NSLayoutConstraint.activate([
            actionButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            actionButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
//            actionButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])

        actionButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @objc private func buttonTapped() {
        delegate?.didTapButton(in: self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
