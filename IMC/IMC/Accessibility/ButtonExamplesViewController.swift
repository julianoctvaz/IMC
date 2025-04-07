//
//  ButtonExamplesViewController.swift
//  IMC
//
//  Created by Juliano on 03/04/25.
//


import UIKit

class ButtonExamplesViewController: UIViewController {

    private let greetingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Hello", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.accessibilityIdentifier = "GreetingButton" // importante, para podermos focar nesse elemento com voiceOver a partir de alguma funcao e para testes automatizados
        
        // 👇 Esses são os campos usados pelo VoiceOver!
         button.accessibilityLabel = "Botão de boas-vindas"
         button.accessibilityHint = "Toca para exibir uma saudação"
        button.accessibilityTraits = .button
        return button
    }()
    
    private let greetingLabel: UILabel = {
        let label = UILabel()
        label.text = "Boas-vindas!"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.accessibilityIdentifier = "GreetingLabel"
        
        label.accessibilityLabel = "Mensagem de boas-vindas"
        
        label.accessibilityTraits = .staticText
        
//        switch.accessibilityValue = "Ativado" (no caso do swift) ou slider (fala o valor)!
        return label
    }()

    private lazy var horizontalStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [greetingLabel, greetingButton])
        stack.axis = .horizontal
        stack.spacing = 16
        stack.alignment = .center
        stack.distribution = .equalCentering
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.isAccessibilityElement = false
        // Geralmente a UIStackView não é um elemento de acessibilidade
        
//        👉 Maaaass se você quiser que a stack seja lida como uma única entidade, pode fazer isso:
        
//        stack.isAccessibilityElement = true
//        stack.accessibilityLabel = "Mensagem e botão"
//        stack.accessibilityHint = "Conjunto de boas-vindas"
        
//        ⚠️ Se você fizer isso, o VoiceOver vai ignorar os filhos da stack e focar na stack como um todo.

        return stack
    }()

    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        greetingButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        logAccessibilityHierarchy(from: self.view)
    }

    
    // MARK: - UI Setup
    private func setupLayout() {
         view.addSubview(horizontalStack)

         NSLayoutConstraint.activate([
             horizontalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             horizontalStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
             greetingButton.widthAnchor.constraint(equalToConstant: 120),
             greetingButton.heightAnchor.constraint(equalToConstant: 44)
         ])
     }
    
    
    // MARK: - Actions

    @objc private func buttonTapped() {
        print("Botão foi tocado!")
        print(greetingButton.accessibilityIdentifier ?? "No ID")
        print(greetingButton.isAccessibilityElement)
        print(greetingButton.accessibilityLabel ?? "No Label")

    }
    
    
    // MARK: - Logging
    
    func logAccessibilityHierarchy(from view: UIView, level: Int = 0) {
        let indent = String(repeating: "  ", count: level)
        let className = String(describing: type(of: view))
        let id = view.accessibilityIdentifier ?? "nil"
        let label = view.accessibilityLabel ?? "nil"
        let isElement = view.isAccessibilityElement
        let isVisible = !view.isHidden && view.alpha > 0.01
        
        let isHittable = isVisible && view.isUserInteractionEnabled
        
        /* No futuro, veremos que o isHittable aqui em baixo é uma propriedade de XCUIElement (usada em UI Tests, não em UIView).
         No seu ViewController.swift (target do app), você está lidando com UIView, que não tem isHittable diretamente.  MAS: dá pra checar o equivalente com view.isUserInteractionEnabled && !view.isHidden && view.alpha > 0 (uma aproximação razoável).  :) */

        print("\(indent)🔹 \(className) | identifier: \(id) | label: \(label) | isAccessibilityElement: \(isElement) | isHittable: \(isHittable)")
        
        for subview in view.subviews {
            logAccessibilityHierarchy(from: subview, level: level + 1)
//            funcao recursiva! simliar a do Inspetor de Acessibilidade
        }
    }
}


#Preview {
    ButtonExamplesViewController()
}
