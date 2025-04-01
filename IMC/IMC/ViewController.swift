//
//  ViewController.swift
//  IMC
//
//  Created by Juliano on 26/03/25.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    
    lazy var label: UILabel = {
        
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    lazy var label2: UILabel = {
        
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
//    var customLabel = CustomLabel()
    lazy var customLb: CustomLabel = {
        let cl = CustomLabel()
//        cl.translatesAutoresizingMaskIntoConstraints = false
       return cl
    }()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        setupUIStyle(of: label)
        setupUIStyle(of: label2, with: .green)
                
        setupViewHierarchy()
        
        setupConstraints(of: label)
        setupConstraints(of: label2, with: 80)
        setupConstraints(of: customLb, with: -80)

    }
    
    // MARK: - UI Functions
    
        private func setupViewHierarchy() {
        view.addSubview(label)
        view.addSubview(label2)
        view.addSubview(customLb)
    }
    
    private func setupUIStyle(of lb: UILabel, with color: UIColor = .red) {
        lb.textColor = color
        lb.font = .systemFont(ofSize: 30, weight: .bold)
        lb.text = "IMC"
    }
    
    private func setupConstraints(of label: UIView, with constant: CGFloat = 0) {
        label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: constant).isActive = true
        label.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
}


// MARK: - Preview
#Preview {
    ViewController()
}
