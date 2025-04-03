//
//  ExemploTextfieldViewController.swift
//  IMC
//
//  Created by Juliano on 01/04/25.
//

import UIKit

class ExemploTextfieldViewController: UIViewController {

    // MARK: - Propriedades
    
    lazy var textField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.delegate = self
        return tf
    }()
    
    // MARK: - Ciclo de vida
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    // MARK: - Setup de UI
    
    private func setupView() {
        addSubViews()
        setupConstraints()
        setupUIStyle()
        setupActions()
    }
    
    private func addSubViews() {
        view.addSubview(textField)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            textField.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    private func setupUIStyle() {
        textField.backgroundColor = .systemCyan
        textField.borderStyle = .roundedRect
        textField.placeholder = "Digite aqui"
        textField.font = .systemFont(ofSize: 30, weight: .bold)
        textField.text = "Digite aqui"
    }
    
    private func submittedText() {
        print(textField.text ?? "Nenhum texto")
    }
    
    private func setupActions() {
        
    }
}

extension ExemploTextfieldViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        submittedText()
        textField.resignFirstResponder()
        return true
    }
}

#Preview {
    ExemploTextfieldViewController()
}
