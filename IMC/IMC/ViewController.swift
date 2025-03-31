//
//  ViewController.swift
//  IMC
//
//  Created by Juliano on 26/03/25.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    
    lazy var imcLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    lazy var imcLabel2: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    lazy var imcLabel3: UIView  = {
        let lb = IMCLabel3View()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    } ()
    
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        setupUIStyle(of: imcLabel)
        setupUIStyle(of: imcLabel2, with: .red)
        
        setupViewHierarchy()
        
        setupConstraints()

    }
    
    // MARK: - UI Functions
    
    fileprivate func setupViewHierarchy() {
        view.addSubview(imcLabel)
        view.addSubview(imcLabel2)
        view.addSubview(imcLabel3)
    }
    
    private func setupUIStyle(of label: UILabel, with color: UIColor = .white) {
        label.text = "IMC"
        label.textColor = color
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imcLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            imcLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            
            imcLabel2.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 60),
            imcLabel2.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            
            imcLabel3.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -60),
            imcLabel3.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
        ])
    }
}


// MARK: - Preview
#Preview {
    ViewController()
}
