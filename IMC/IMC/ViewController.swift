//
//  ViewController.swift
//  IMC
//
//  Created by Juliano on 26/03/25.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.text = "IMC"
        label.textAlignment = .center
        label.backgroundColor = .red
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
       // Do any additional setup after loading the view.
        
        self.view.addSubview(labelTitle)
        
        
        NSLayoutConstraint.activate([
            labelTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

#Preview {
    ViewController()
}
