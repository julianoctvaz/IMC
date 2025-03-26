//
//  CustomView.swift
//  IMC
//
//  Created by Juliano on 26/03/25.
//
import UIKit

class CustomLabelView: UIView {
    
    lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        // É o inicializador que usamos de forma padrão da classe UIView quando você cria uma view programaticamente, ou seja, via código, sem usar Storyboard ou XIB.
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        // 🔐 O required init?(coder:) é necessário porque o UIKit pode carregar views a partir de Storyboard/XIB, e essa inicialização é obrigatória. Mas não utilizaremos! Então a gente exibe um erro caso seja chamado.
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUIStyle(of label: UILabel) {
        // Do any additional setup after loading the view.
        label.text = "IMC"
        label.textAlignment = .center
        label.backgroundColor = .yellow
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
    }
    
    
    private func setupConstraints () {
        // Centraliza a label no centro desta subview. O tamanho da label será definido com base no conteúdo de texto e propriedades como fonte e alinhamento.
//        Aqui estamos setando dentro da CustomLabelView, apenas o layout inicial da labelTitle dentro da view dela mesma!!!
//        Mas a CustomLabelView como componente inteiro ainda provavelmente vai precisar ser posicionada com Auto Layout no lugar onde você vai usá-la (ex: em uma ViewController) ou outra UIView.
        NSLayoutConstraint.activate([
            labelTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelTitle.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    
    private func setupView() {
        // Adiciona subviews, constraints, etc
        setupUIStyle(of: labelTitle)
        addSubview(labelTitle)
        setupConstraints()
    }
}

#Preview {
    CustomLabelView()
}
