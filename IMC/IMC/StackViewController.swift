//
//  StackViewController.swift
//  IMC
//
//  Created by Juliano on 31/03/25.
//

import UIKit

class StackViewController: UIViewController {
    
    
    // MARK: - Properties
    
    lazy var labelRed: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false // Desabilita a conversão automática de autoresizing mask em constraints
        label.text = "IMC"
        label.textAlignment = .center
        label.backgroundColor = .red
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        
        return label
    }()
    
    lazy var labelBlue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false // Desabilita a conversão automática de autoresizing mask em constraints
        label.text = "IMC"
        label.textAlignment = .center
        label.backgroundColor = .blue
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        
        return label
    }()
        
        
        lazy var labelGreen: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false // Desabilita a conversão automática de autoresizing mask em constraints
            label.text = "IMC"
            label.textAlignment = .center
            label.backgroundColor = .green
            label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
            
            return label
        }()
        
    lazy var hstack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [labelRed, labelBlue, labelGreen])
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray.withAlphaComponent(0.4)
        
        view.addSubview(hstack)
        
        hstack.spacing = 30
        hstack.axis = .vertical
        hstack.alignment = .firstBaseline
        hstack.distribution = .fillProportionally
        
        NSLayoutConstraint.activate([
            hstack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hstack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
        ])
    }
        
}

#Preview {
    StackViewController()
}
