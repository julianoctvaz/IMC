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
    
    lazy var stack: UIStackView = {
        let st = UIStackView(arrangedSubviews: [labelRed, labelBlue, labelGreen])
        st.translatesAutoresizingMaskIntoConstraints = false
        
        st.axis = .vertical
        st.spacing = 32
        st.spacing = UIScreen.main.bounds.height * 0.1
        st.distribution = .fillProportionally
        
        return st
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    
}

#Preview {
    StackViewController()
}
