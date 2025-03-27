//
//  DrawingView.swift
//  IMC
//
//  Created by Juliano on 26/03/25.
//

import UIKit

class DrawingView: UIView {

    var corAtual: UIColor = .red

    override func draw(_ rect: CGRect) {
        guard let contexto = UIGraphicsGetCurrentContext() else { return }

        contexto.setFillColor(corAtual.cgColor)
        let meuRect = CGRect(x: 0, y: 0, width: rect.width / 2, height: rect.height / 2)
        contexto.fill(meuRect)
    }

    func updateColorAfterDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.corAtual = .blue
            self.setNeedsDisplay() // Força o redesenho da view
        }
    }
}

#Preview {
    DrawingView()
}
