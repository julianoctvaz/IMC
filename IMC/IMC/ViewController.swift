//
//  ViewController.swift
//  IMC
//
//  Created by Juliano on 26/03/25.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Labels
    
    lazy var labelRed: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false // Desabilita a conversão automática de autoresizing mask em constraints
        label.text = "IMC"
        label.textAlignment = .center
        label.backgroundColor = .red
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        
        // Configura prioridade para hugging e compression
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal) // Evita que a label cresça desnecessariamente
//        label.setContentCompressionResistancePriority(.required, for: .horizontal)  // Evita que a label seja comprimida, exemplo 3
        
        return label
    }()
    
    lazy var labelBlue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "IMC"
//        label.text = "Texto muito muito muito longo mesmo" // exemplo 3
        label.textAlignment = .center
        label.backgroundColor = .blue
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal) //exemplo 2
//        label.setContentCompressionResistancePriority(.required, for: .horizontal) // exemplo 3
    
        return label
    }()

    
    // Uma view personalizada com uma label amarela (por exemplo)
    var labelYellow: UIView = CustomLabelView() // A CustomLabelView precisa ter `translatesAutoresizingMaskIntoConstraints = false` setado externamente
    
    // MARK: - StackView
    
    lazy var HStack: UIStackView = {
        let stack = UIStackView(
            arrangedSubviews: [
                labelRed,
                labelBlue,
                labelYellow
            ]
        ) //ordem influencia!
        stack.translatesAutoresizingMaskIntoConstraints = false // Também precisa estar no Auto Layout
        stack.axis = .horizontal // Orientação vertical
        stack.spacing = 20 // Espaço entre os elementos
        stack.alignment = .center // Centraliza os elementos horizontalmente
//        stack.distribution = .fillEqually  // Espaça os elementos igualmente, se possível
        stack.distribution = .equalSpacing // Espaça os elementos igualmente, se possível, para exemplo 2
//        stack.distribution = .fillProportionally // permite que elementos cresçam conforme o conteúdo, até um limite, para exemplo 3
            
        return stack
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(HStack)
        
        // Ativa as constraints para posicionar o stackView no centro da tela
        NSLayoutConstraint.activate([
            HStack.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Centraliza no eixo X
            HStack.centerYAnchor.constraint(equalTo: view.centerYAnchor), // Centraliza no eixo Y
        ])
            
        //             Define largura máxima para o stack para não ficar muito largo em telas grandes //TEstar depois melhor configuracao
//            NSLayoutConstraint.activate([
//            HStack.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 20),
//            HStack.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20)
//            ])
            
//            HStack.widthAnchor.constraint(equalToConstant: 300) // Exemplo 3: força a falta de espaço → compressão acontece
//        ])
        
        // Para garantir que a custom view também se comporte bem no stack:
        labelYellow.translatesAutoresizingMaskIntoConstraints = false
        
//        NSLayoutConstraint.activate([ // tstar com equalSpacing na distribuicao e ver como quebra
//            labelYellow.widthAnchor.constraint(equalToConstant: 100),
//            labelYellow.heightAnchor.constraint(equalToConstant: 50)
//        ])
        
//    Exemplo 2:
//        NSLayoutConstraint.activate([
//            labelRed.heightAnchor.constraint(equalToConstant: 300)
            // força ela a crescer mesmo com hugging high  Mesmo que o contentHuggingPriority seja .defaultHigh, a constraint de altura fixa vai vencer, porque constraints explícitas geralmente têm mais peso. Assim, o hugging será ignorado, e a label vai crescer até 300 de altura mesmo que o texto só ocupe ~40.
//            ])
        
//        Exemplo 3: Compressão Horizontal
//        labelBlue.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        // Exemplo: menor resistência essa label da stack
//        Aqui o labelBlue tem baixa resistência à compressão, então ele será esmagado primeiro quando o espaço for limitado.
    }
}


// MARK: - Preview
#Preview {
    ViewController()
}
