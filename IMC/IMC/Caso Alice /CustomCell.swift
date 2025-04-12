//
//  CustomCellDelegate.swift
//  IMC
//
//  Created by Juliano on 11/04/25.
//

import UIKit

class CustomCell: UITableViewCell {

    weak var delegate: CustomCellDelegate?
    
//    var actionButton2: (() -> Void)? // caso fosse usar uma closure para disparar algo a partir da viewcontroller, importante que seja opcional para nao gongar o nosso init!

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
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc private func buttonTapped() {
        print("Pode fazer alguma acao mais simples sem o do delegate")
        delegate?.didTapButton(in: self)
        print("Fez comportamento mais complexo dado responsabilidade de controle a viewController que contem a tableView quando o botao é acionado")
//        actionButton2?()
//        executaria o que esta definido la na viewcontroller
    }

}
