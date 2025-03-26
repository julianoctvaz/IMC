//
//  ViewController.swift
//  IMC
//
//  Created by Juliano on 26/03/25.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    
    lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    @AutoLayoutView var labelTitlePW: UILabel
    
     var customLabelTitle: UIView = CustomLabelView()
//     var customLabelTitle: CustomLabelView()
//    @AutoLayoutView var customLabelTitle : CustomLabelView se nao marcar como false o uso de autoresizing embaixo! linha 57!

    
    
    // MARK: - UI Functions
    
    private func setupUIStyle(of label: UILabel, with color: UIColor = .red) {
        // Do any additional setup after loading the view.
        label.text = "IMC"
        label.textAlignment = .center
        label.backgroundColor = color
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
    }
    
    private func setupConstraints(of selectedView: UIView, with additional: CGFloat = 0) {
        // Centraliza a label no centro desta subview. O tamanho da label será definido com base no conteúdo de texto e propriedades como fonte e alinhamento.
//        Aqui estamos setando dentro da CustomLabelView, apenas o layout inicial da labelTitle dentro da view dela mesma!!!
//        Mas a CustomLabelView como componente inteiro ainda provavelmente vai precisar ser posicionada com Auto Layout no lugar onde você vai usá-la (ex: em uma ViewController) ou outra UIView.
        NSLayoutConstraint.activate([
            selectedView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: additional),
            selectedView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("🔵 viewDidLoad")
//chamamos super.viewDidLoad() antes de configurar o resto, assim a gente deixar a superclasse UIViewController fazer a parte dela: preparar recursos internos, configurar a view, lidar com storyboard (se houver), etc. E a gente fez nossas mudancas eventuais após isso.
        
        self.title = "Página Inicial"
        
        
        // Mostra se a view já foi carregada
            if isViewLoaded {
                print("✅ A view já foi carregada")
            } else {
                print("⏳ A view ainda não foi carregada")
            }

            // Verifica a presença de navigation e tab bar
            print("Navigation Controller:", navigationController ?? "sem navigation")
            print("TabBar Controller:", tabBarController ?? "sem tab bar")
        
        
//         Setup da label vermelha
        setupUIStyle(of: labelTitle)
        view.addSubview(labelTitle)
        setupConstraints(of: labelTitle)
        
        view.addSubview(customLabelTitle)
        customLabelTitle.translatesAutoresizingMaskIntoConstraints = false
        // Setup da label amarela
//        ou usa @TemplateView! dentro da LabelTitle a gente tela para false a constraint interna, na a view que encapsula a label! Isso fazemos externamente (aqui)
        setupConstraints(of: customLabelTitle, with: -80)
        
//         Setup da label verde
        setupUIStyle(of: labelTitlePW, with: .blue)
        self.view.addSubview(labelTitlePW)
        setupConstraints(of: labelTitlePW, with: 80)
        
    }
}


// MARK: - Preview
#Preview {
    ViewController()
}
