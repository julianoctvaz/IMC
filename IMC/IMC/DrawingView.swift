//
//  DrawingView.swift
//  IMC
//
//  Created by Juliano on 26/03/25.
//

import UIKit

class DrawingView: UIView {

 //poderia usar path (SwiftUI) /Bezier (curvas mais customizadas)
    
    var corAtual: UIColor = .red

    override func draw(_ rect: CGRect) {
        guard let contexto = UIGraphicsGetCurrentContext() else { return }

        contexto.setFillColor(corAtual.cgColor)
        let meuRect = CGRect(x: 0, y: 0, width: rect.width / 2, height: rect.height / 2)
        contexto.fill(meuRect)
        desenharLinhaDiagonal(contexto: contexto, in: meuRect)
    }
    
    private func desenharLinhaDiagonal(contexto: CGContext, in rect: CGRect) {
        contexto.setStrokeColor(UIColor.blue.cgColor)  // Cor da linha
        contexto.setLineWidth(4.0)                     // Espessura da linha

        contexto.move(to: CGPoint(x: 0, y: 0))                     // Começa no canto superior esquerdo
        contexto.addLine(to: CGPoint(x: rect.width, y: rect.height)) // Vai até o canto inferior direito

        contexto.strokePath() // Renderiza a linha no contexto
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
