//
//  AutoLayoutView.swift
//  IMC
//
//  Created by Juliano on 26/03/25.
//

import UIKit

@propertyWrapper final class AutoLayoutView<View: UIView> {
    private lazy var view: View = {
        let view = View(frame: .zero) // no geral o View() ou View.init() tb cria com frame em .zero. O que deixamos explicito aqui é. crie essa view sem tamanho definido (porque eu vou usar Auto Layout para definir depois),
//        let view = View.init()
//        let view = View()
        view.translatesAutoresizingMaskIntoConstraints = false // e desligue autoresizing masks para evitar conflitos com Auto Layout.
        return view
    }()
    
    var wrappedValue: View {
        return view
    }
}
