//
//  ModalViewController.swift
//  IMC
//
//  Created by Juliano on 06/04/25.
//

import UIKit

class ModalViewController: UIViewController {
    
//    O accessibilityViewIsModal é uma propriedade importante para acessibilidade que controla como o VoiceOver interage com elementos visuais sobrepostos.
//    Quando você define accessibilityViewIsModal = true em uma view:
//
//    O VoiceOver ignora completamente todos os elementos que estão visualmente atrás dessa view
//    O foco do VoiceOver fica restrito apenas aos elementos dentro da view modal e seus filhos
    
    // MARK: - Properties
    
    let label = UILabel()
    let closeButton = UIButton(type: .system)
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIStyleAndConstraints()

        view.isAccessibilityElement = false // marca que a view principal não é um único elemento (leremos a label e botao, default é true, mas nao queremos ler o bloco da view como um todo), enquanto isAccessibilityElement agrega, accessibilityViewIsModal isola.
//        "Não me leia como um bloco único, leia meus componentes separados"
//        ← Isso afeta APENAS a view do modal, ja que estamos na ModalViewController (e n na que sera chamada)
        
        view.accessibilityViewIsModal = true // IMPORTANTE: indica que é um modal!
        // "Ignore tudo que está atrás de mim e foque só no meu conteúdo"
//        O VoiceOver só enxerga o pop-up (o modal), ignorando completamente o conteudo atrás.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIAccessibility.post(notification: .screenChanged, argument: view)
        //notificao voice over (o sistema em si) q a tela apareceu
    }
    
    
    // MARK: - UI SETUP
    
    private func setupUIStyleAndConstraints() {
        view.backgroundColor = .systemBackground
        
        // conteúdo dentro do modal
        
        label.text = "Este é um modal"
        label.font = .boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false

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
    }
    
    // MARK: - Actions

    @objc func fecharModal() {
        UIAccessibility.post(notification: .screenChanged, argument: nil) //  ajuda o VoiceOver a saber q a tela fechou (mudou)
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
        UIAccessibility.post(notification: .screenChanged, argument: nil) //  ajuda o VoiceOver a saber q a tela abriu (mudou)
        present(modalVC, animated: true, completion: nil)
    }
}


#Preview {
    AbreModalViewController()
}
