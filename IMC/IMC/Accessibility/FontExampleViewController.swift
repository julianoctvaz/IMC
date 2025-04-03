//
//  FontExampleViewController.swift
//  IMC
//
//  Created by Juliano on 03/04/25.
//


import UIKit

class FontExampleViewController: UIViewController {
    
    private let tituloLabel: UILabel = {
        let label = UILabel()
        label.text = "Acessibilidade em UIKit"
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.adjustsFontForContentSizeCategory = true // Suporta Dynamic Type
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descricaoLabel: UILabel = {
        let label = UILabel()
        label.text = "Exemplo com ordem de navegação, notificações, tipografia dinâmica e cores."
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .body)
        
        // Suporte a Dynamic Type com fonte personalizada
          /*  if let customFont = UIFont(name: "AvenirNext-Regular", size: 17) {
                label.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: customFont)
            } else {
                label.font = UIFont.preferredFont(forTextStyle: .body)
            }
        */
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let confirmarBotao: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Confirmar", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        
        //No caso de fonte customizada para testar tipo dinamico
       /* if let customFont = UIFont(name: "AvenirNext-Bold", size: 18) {
            button.titleLabel?.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: customFont)
        } else {
            button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        }
        */
        
        
        button.backgroundColor = UIColor(named: "CustomPrimaryColor") ?? UIColor.systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityLabel = "Botão de confirmar"
        button.accessibilityHint = "Toque para confirmar a ação"
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .dark // ou .light ou .unspecified for
        
        view.backgroundColor = .systemBackground
        view.addSubview(tituloLabel)
        view.addSubview(descricaoLabel)
        view.addSubview(confirmarBotao)
        
        NSLayoutConstraint.activate([
            tituloLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            tituloLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            descricaoLabel.topAnchor.constraint(equalTo: tituloLabel.bottomAnchor, constant: 16),
            descricaoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descricaoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            confirmarBotao.topAnchor.constraint(equalTo: descricaoLabel.bottomAnchor, constant: 32),
            confirmarBotao.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmarBotao.widthAnchor.constraint(equalToConstant: 200),
            confirmarBotao.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // 4) Ordem de navegação personalizada
        view.accessibilityElements = [tituloLabel, descricaoLabel, confirmarBotao]
        
        // 5) Notificação via VoiceOver (após delay para simular evento)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            UIAccessibility.post(notification: .announcement, argument: "Tela carregada com sucesso")
        }
        
        if UIAccessibility.isDarkerSystemColorsEnabled {
            print("Modo de alto contraste não está ativado")
        } else {
            print("Modo de alto contraste está ativado")
        }
    }
    
    // 6) Detecção do modo escuro ou claro
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if traitCollection.userInterfaceStyle == .dark {
            print("🌙 Modo Escuro Ativo")
        } else {
            print("☀️ Modo Claro Ativo")
        }
        
        // Verifica tamanho da fonte atual
        print("Tamanho da fonte preferido: \(traitCollection.preferredContentSizeCategory.rawValue)")
        
        // Verifica se o modo alto contraste está ativo (iOS 13+)
        if traitCollection.accessibilityContrast == .high {
            print("⚠️ Alto contraste está ativado")
        }
    }
    
}

// Observação:
// - Use o Accessibility Inspector para verificar contraste entre cor do texto e fundo.
// - Cores definidas com UIColor.label, systemBackground etc. se adaptam automaticamente.
// - Se usar UIColor personalizada (via .setColor), faça uso de asset catalog com variantes Light/Dark.
// - Fontes personalizadas também podem suportar Dynamic Type com UIFontMetrics. Se não usar UIFontMetrics, o tamanho não irá escalar com o ajuste do usuário.
