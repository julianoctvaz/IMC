//
//  ExemploTextfieldViewController.swift
//  IMC
//
//  Created by Juliano on 01/04/25.
//

import UIKit

class ExemploTextfieldViewController: UIViewController {

    // MARK: - Propriedades
    
    lazy var textfield: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.delegate = self
        return textfield
    }()
    
    lazy var button = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return bt
    }()
    
    // MARK: - Ciclo de vida
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    // MARK: - View setup

    private func setupView() {
        setupUIStyle()
        setupViewHierarchy()
        setupConstraints()
        setupActions()
    }
    
    private func setupViewHierarchy() {
        view.addSubview(textfield)
        view.addSubview(button)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            textfield.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            textfield.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            textfield.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            button.topAnchor.constraint(equalTo: textfield.bottomAnchor, constant: 16),
            button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
            
            
        ])
    }
    
    private func setupUIStyle() {
        textfield.borderStyle = .roundedRect
        textfield.placeholder = "Digite aqui"
        textfield.text = "Texto real"
        textfield.backgroundColor = .red
        textfield.textColor = .white
        textfield.font = .systemFont(ofSize: 30, weight: .bold)
        
        button.setTitle("Toque aqui", for: .normal)
        button.setTitleColor(.red, for: .normal)
    }
    
    private func setupActions() {
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc private func didTapButton() {
        print(textfield.text ?? "Nenhum texto")
    }
}

extension ExemploTextfieldViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(textField.text ?? "Delegate retornou sem text")
        textField.resignFirstResponder()
        return true
    }
    
}

#Preview {
    ExemploTextfieldViewController()
}
