//
//  AuditCasesViewController.swift
//  IMC
//
//  Created by Juliano on 03/04/25.
//


//⚠️ Casos com erro proposital:
//UILabel sem accessibilityLabel → Não será lido corretamente.
//Botão com menos de 44x44pt → Tamanho de toque inválido.
//Texto branco sobre fundo amarelo → Contraste abaixo do ideal.

//Rode esse VC no simulador, abra o Accessibility Inspector → aba Audit, e você verá os alertas sendo detectados.



import UIKit

class AuditCasesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // 1. ⚠️ UILabel sem accessibilityLabel
        let unlabeledLabel = UILabel()
        unlabeledLabel.text = "Texto sem label de acessibilidade"
        unlabeledLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(unlabeledLabel)

        // 2. ⚠️ Botão pequeno demais (tamanho de toque insuficiente)
        let smallButton = UIButton(type: .system)
        smallButton.setTitle("Pequeno", for: .normal)
        smallButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(smallButton)

        // 3. ⚠️ Contraste ruim (texto claro sobre fundo claro)
        let lowContrastLabel = UILabel()
        lowContrastLabel.text = "Contraste baixo"
        lowContrastLabel.textColor = .white
        lowContrastLabel.backgroundColor = .yellow
        lowContrastLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lowContrastLabel)

        // 4. ✅ Exemplo correto para comparação
        let accessibleButton = UIButton(type: .system)
        accessibleButton.setTitle("Enviar", for: .normal)
        accessibleButton.accessibilityLabel = "Botão de enviar mensagem"
        accessibleButton.backgroundColor = .systemBlue
        accessibleButton.setTitleColor(.white, for: .normal)
        accessibleButton.layer.cornerRadius = 8
        accessibleButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(accessibleButton)

        NSLayoutConstraint.activate([
            unlabeledLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            unlabeledLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            smallButton.topAnchor.constraint(equalTo: unlabeledLabel.bottomAnchor, constant: 20),
            smallButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            smallButton.widthAnchor.constraint(equalToConstant: 40),
            smallButton.heightAnchor.constraint(equalToConstant: 20),

            lowContrastLabel.topAnchor.constraint(equalTo: smallButton.bottomAnchor, constant: 20),
            lowContrastLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            accessibleButton.topAnchor.constraint(equalTo: lowContrastLabel.bottomAnchor, constant: 40),
            accessibleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            accessibleButton.widthAnchor.constraint(equalToConstant: 200),
            accessibleButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
