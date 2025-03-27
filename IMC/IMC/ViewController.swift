//
//  ViewController.swift
//  IMC
//
//  Created by Juliano on 26/03/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let drawedView = DrawingView(
            frame: CGRect(
                x: 50,
                y: 100,
                width: 200,
                height: 200
            )
        )
        drawedView.backgroundColor = .white
        self.view.addSubview(drawedView)
        drawedView.updateColorAfterDelay() // Inicia o forcao de barra para atualizar a tela
    }
}


// MARK: - Preview
#Preview {
    ViewController()
}
