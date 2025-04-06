//
//  ModalViewController.swift
//  IMC
//
//  Created by Juliano on 06/04/25.
//

import UIKit

class ModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        // conteúdo dentro do modal
        let label = UILabel()
        label.text = "Este é um modal"
        label.font = .boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false

        let closeButton = UIButton(type: .system)
        closeButton.setTitle("Fechar", for: .normal)
        closeButton.titleLabel?.font = .systemFont(ofSize: 18)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.addTarget(self, action: #selector(fecharModal), for: .touchUpInside)

        view.addSubview(label)
        view.addSubview(closeButton)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            closeButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            closeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        // Acessibilidade
        view.isAccessibilityElement = false // marca que a view principal não é um único elemento (leremos a label e botao, default é true)
        view.accessibilityViewIsModal = true // Importante: indica que é um modal!
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIAccessibility.post(notification: .screenChanged, argument: view)
        //notificao voice over (o sistema em si)
    }

    @objc func fecharModal() {
        dismiss(animated: true, completion: nil)

    }
}


class AbreModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let openModalButton = UIButton(type: .system)
        openModalButton.setTitle("Abrir Modal", for: .normal)
        openModalButton.titleLabel?.font = .systemFont(ofSize: 20)
        openModalButton.translatesAutoresizingMaskIntoConstraints = false
        openModalButton.addTarget(self, action: #selector(abrirModal), for: .touchUpInside)

        view.addSubview(openModalButton)

        NSLayoutConstraint.activate([
            openModalButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            openModalButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc func abrirModal() {
        let modalVC = ModalViewController()
        modalVC.modalPresentationStyle = .automatic
        present(modalVC, animated: true, completion: nil)
    }
}


#Preview {
    AbreModalViewController()
}
