//
//  FontExampleViewController.swift
//  IMC
//
//  Created by Juliano on 03/04/25.
//


import UIKit

//Pontinhos de atencao no final da classe!

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
        
        // Suporte a Dynamic Type com fonte personalizada,
        // no trecho comentado abaixo estamos settando o estilo de fonte .body para usar uma fonte personalizada (AvenirNext-Regular) com suporte a Dynamic Type
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
        
        // Suporte a Dynamic Type com fonte personalizada,
        // no trecho comentado abaixo estamos settando o estilo de fonte .headline para usar uma fonte personalizada (AvenirNext-Regular) com suporte a Dynamic Type
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
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .dark // ou .light ou .unspecified (Aqui forcamos o estilo!)

        
        setupUIStyleAndConstraints()
        
        // Cria de navegação personalizada para voiceOver
        view.accessibilityElements = [tituloLabel, descricaoLabel, confirmarBotao]
        
        // Notificação via VoiceOver (após delay para simular evento)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            UIAccessibility.post(notification: .announcement, argument: "Tela carregada com sucesso")
            //exemplo uso de post com announcement, mas temos outros tipos de notificacao
        }
        
        if UIAccessibility.isDarkerSystemColorsEnabled {
            print("Modo de alto contraste não está ativado")
        } else {
            print("Modo de alto contraste está ativado")
        }
        
        // Registrar para observar mudanças de traits (algumas caracteristicas da nossa interface de estilo)
        registerForTraitChanges([UITraitUserInterfaceStyle.self,
                                UITraitPreferredContentSizeCategory.self,
                                UITraitAccessibilityContrast.self]) { (self: Self, previousTraitCollection: UITraitCollection?) in
            self.handleTraitChanges(previousTraitCollection: previousTraitCollection)
        }
    }
    
    
    // MARK: - Setup UI
    
    
    private func setupUIStyleAndConstraints() {
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
    }
    
    // Se quiser fazer ad etecção do modo escuro ou claro
    private func handleTraitChanges(previousTraitCollection: UITraitCollection?) {
        if traitCollection.userInterfaceStyle == .dark {
            print("🌙 Modo Escuro Ativo")
        } else {
            print("☀️ Modo Claro Ativo")
        }
        
        // Se quiser verificar o tamanho da fonte atual
        print("Tamanho da fonte preferido: \(traitCollection.preferredContentSizeCategory.rawValue)")
        
        // Se quiser verificar se o modo alto contraste está ativo (iOS 13+)
        if traitCollection.accessibilityContrast == .high {
            print("⚠️ Alto contraste está ativado")
        }
    }
    
}

// ATENCAO 👀:
//  Use o Accessibility Inspector para verificar contraste entre cor do texto e fundo.
//  Cores definidas com UIColor.label, systemBackground etc. se adaptam automaticamente.
//  Se usar UIColor personalizada (via .setColor), faça uso de asset catalog com variantes Light/Dark.
//  Fontes personalizadas também podem suportar Dynamic Type com UIFontMetrics. Se NAO usar UIFontMetrics, o tamanho não irá escalar com o ajuste do usuário.
