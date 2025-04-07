//
//  LanguagesViewController.swift
//  IMC
//
//  Created by Juliano on 03/04/25.
//


import UIKit

class LanguagesViewController: UIViewController {
    
    // MARK: - Properties
    
    let localizedButton = UIButton(type: .system)
    let ptButton = UIButton(type: .system)
    let enButton = UIButton(type: .system)
    
    // MARK: - ALL 2gether ☠️

    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white

        // 1. Botão com accessibilityLabel usando NSLocalizedString (respeita idioma do app)
        let localizedTitle = NSLocalizedString("button_localized", comment: "Título do botão que muda com o idioma do app")
        //chamos aqui no NSLocalizedString o value que consta no no arquivo Localizable.strings ou que poderia ser Localizable.xcstrings (eles pegam a variante por idioma)
        localizedButton.setTitle(localizedTitle, for: .normal)
        localizedButton.accessibilityLabel = localizedTitle
        localizedButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(localizedButton)

        // 2. Botão com accessibilityAttributedLabel forçando leitura em pt-BR
        
        ptButton.setTitle("Forçado pt-BR", for: .normal)
        ptButton.translatesAutoresizingMaskIntoConstraints = false
        let ptString = NSAttributedString( //Aqui esse atrbuto forca!!!
            string: "Olá! Essa mensagem será lida em português.",
            attributes: [.accessibilitySpeechLanguage: "pt-BR"]
//            O .accessibilitySpeechLanguage tem precedência (prioridade) sobre outras configurações
//            ele sobrescreve até configurações personalizadas do usuário no VoiceOver
        )
        ptButton.accessibilityAttributedLabel = ptString //Seta atributo da label (IMPORTANTE)
        view.addSubview(ptButton)

        // 3. Botão com accessibilityAttributedLabel forçando leitura em en-US
        enButton.setTitle("Forced en-US", for: .normal)
        enButton.translatesAutoresizingMaskIntoConstraints = false
        let enString = NSAttributedString(
            string: "Hello! This message will be read in English.",
            attributes: [.accessibilitySpeechLanguage: "en-US"]
        )
        enButton.accessibilityAttributedLabel = enString
        view.addSubview(enButton)

        // Layout
        NSLayoutConstraint.activate([
            localizedButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            localizedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            ptButton.topAnchor.constraint(equalTo: localizedButton.bottomAnchor, constant: 40),
            ptButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            enButton.topAnchor.constraint(equalTo: ptButton.bottomAnchor, constant: 40),
            enButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
