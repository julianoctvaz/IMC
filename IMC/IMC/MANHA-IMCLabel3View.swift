//
//  IMCLabel3View.swift
//  IMC
//
//  Created by Juliano on 31/03/25.
//

import UIKit

class IMCLabel3View: UIView {
    // MARK: - Properties
    
    lazy var imcLabel3: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Functions
    
    private func setupUIStyle(of label: UILabel, with color: UIColor = .white) {
        label.text = "IMC"
        label.textColor = color
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imcLabel3.centerXAnchor.constraint(equalTo: centerXAnchor),
            imcLabel3.centerYAnchor.constraint(equalTo: centerYAnchor),
//            imcLabel3.widthAnchor.constraint(equalToConstant: 100),
        
        ])
    }
    
    private func setupView() {
        //se nao setar o translate auto resizing mask em self aqui para falso tem q ue setar onde incorporar!!
        setupUIStyle(of: imcLabel3, with: .green)
        addSubview(imcLabel3)
        setupConstraints()
    }
}

#Preview {
    IMCLabel3View()
}

