//
//  AutoLayoutView.swift
//  IMC
//
//  Created by Juliano on 26/03/25.
//


import UIKit

@propertyWrapper final class AutoLayoutView<View: UIView> {
    private lazy var view: View = {
        let view = View(frame: .zero)
//        let view = View()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var wrappedValue: View {
        return view
    }
}
