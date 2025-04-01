//
//  CustomLabel.swift
//  IMC
//
//  Created by Juliano on 31/03/25.
//

import UIKit

class CustomLabel: UIView {
    
    lazy var label: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    
    fileprivate func setupView() {
        self.translatesAutoresizingMaskIntoConstraints = false // como setamos aqui nao precisamos setar onde incorporar
        setupUIStyle(of: label, with: .yellow)
        addSubview(label)
        setupConstraints(of: label)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // MARK: - UI Styling
    
    private func setupUIStyle(of lb: UILabel, with color: UIColor = .red) {
        lb.textColor = color
        lb.font = .systemFont(ofSize: 30, weight: .bold)
        lb.text = "IMC"
    }
    
    func setupConstraints(of label: UILabel) {
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
}
