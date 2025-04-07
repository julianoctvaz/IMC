//
//  ModalViewController.swift
//  IMC
//
//  Created by Juliano on 06/04/25.
//

import UIKit

//Extra nessa class: Habilita fechar fazendo gesto em Z (usado com VoiceOver)
//Desafio: Verificando em quais cenarios usar label.accessibilitySpeechPunctuation (emails, senhas..)
//Desafio: Quando usar MagicTap?
//Desafio: Quando usar zoomFocusChanged? O que é control focus há outras formas de trabalhar com isso?

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
//        / Fundo translúcido usando material effect
            let blurEffect = UIBlurEffect(style: .systemMaterial) // você pode trocar por .systemUltraThinMaterial, .systemThickMaterial etc.
            let blurView = UIVisualEffectView(effect: blurEffect)
            blurView.frame = view.bounds
            blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        garantir que o blurView se redimensione automaticamente se a view principal mudar de tamanho
            view.addSubview(blurView)
        
        // com uma imgem de fundo fica melhor de visualziar
        
        // Caso deseje, pode colocar camada colorida semi-transparente por cima do blur (pra realçar o efeito)
            let coloredOverlay = UIView(frame: view.bounds)
            coloredOverlay.backgroundColor = UIColor.systemTeal.withAlphaComponent(0.2) // pode ajustar a cor e a opacidade
            coloredOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        mesma coisa d alinha 54 so que para o overlay
            view.addSubview(coloredOverlay)
        
        
        // conteúdo dentro do modal
        
        label.text = "Este é um modal"
        label.font = .boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false

        closeButton.setTitle("Fechar", for: .normal)
        closeButton.titleLabel?.font = .systemFont(ofSize: 18)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.addTarget(self, action: #selector(fecharModal), for: .touchUpInside)
        
        // adiciona os elementos por cima da blur view
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
    
    override func accessibilityPerformEscape() -> Bool {
        // Habilita fechar fazendo gesto em Z (usado com VoiceOver)
        fecharModal() // mesma ação do botão
        return true // indica que o gesto foi tratado com sucesso
    }
}


class AbreModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        
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
