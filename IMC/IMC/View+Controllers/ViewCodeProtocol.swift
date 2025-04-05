//
//  ViewCode.swift
//  IMC
//
//  Created by Juliano on 04/04/25.
//

import UIKit

typealias ViewCodeProtocol = UIView & ViewCode

protocol ViewCode {
    
    func addSubViews()
    func setupConstraints()
    func setupView()
    func setupUIConfiguration()
}

extension ViewCode {
     func setupView() {
        addSubViews()
        setupConstraints()
        setupUIConfiguration()
    }
}
