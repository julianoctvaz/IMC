//
//  ZStackController.swift
//  IMC
//
//  Created by Juliano on 26/03/25.
//

import UIKit

class ZStackController: UIViewController {
    
    // MARK: - Views
    
    @AutoLayoutView var redView: UIView
    @AutoLayoutView var blueView: UIView
    @AutoLayoutView var greenView: UIView
    
    
    // Botão para bringSubviewToFront
    let bringToFrontButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("🔝 Trazer Azul pra Frente", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // Botão para sendSubviewToBack
    let sendToBackButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("🔙 Enviar Azul pra Trás", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        redView.backgroundColor = .red
        blueView.backgroundColor = .blue
        greenView.backgroundColor = .green
        
        // Adiciona as views em ordem inicial
        view.addSubview(redView)    // 🔴 fundo
        view.addSubview(blueView)   // 🔵 meio (será manipulada)
        view.addSubview(greenView)  // 🟢 frente
        
        // Adiciona os botões
        view.addSubview(bringToFrontButton)
        view.addSubview(sendToBackButton)
        
        setupConstraints()
        setupActions()
    }
    
    // MARK: - Setup
    
    private func setupConstraints() {
        // Todas as views com mesma posição e tamanho (sobrepostas)
        let views = [redView, blueView, greenView]
        views.forEach { coloredView in
            NSLayoutConstraint.activate([
                coloredView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                coloredView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                coloredView.widthAnchor.constraint(equalToConstant: 200),
                coloredView.heightAnchor.constraint(equalToConstant: 200)
            ])
        }
        
        // Botões abaixo das views
        NSLayoutConstraint.activate([
            bringToFrontButton.topAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 40),
            bringToFrontButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            sendToBackButton.topAnchor.constraint(equalTo: bringToFrontButton.bottomAnchor, constant: 20),
            sendToBackButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        //Se você precisar de controle fino da profundidade, pode usar:
        //            redView.layer.zPosition = 2
        //            blueView.layer.zPosition = 1
        //            greenView.layer.zPosition = 0
        // Tem mais poder! e definicao na construcao
        //        Quanto maior o zPosition, mais na frente o elemento vai ficar. pode ser útil para animações, drag & drop, efeitos visuais, etc.
        
    }
    
    private func setupActions() {
        bringToFrontButton.addTarget(self, action: #selector(bringBlueToFront), for: .touchUpInside)
        sendToBackButton.addTarget(self, action: #selector(sendBlueToBack), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc private func bringBlueToFront() {
        view.bringSubviewToFront(blueView)
        print("🔵 Azul foi trazido para frente")
    }
    
    @objc private func sendBlueToBack() {
        view.sendSubviewToBack(blueView)
        print("🔵 Azul foi enviado para trás")
    }
}

#Preview {
    ZStackController()
}
