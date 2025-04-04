//
//  SmallestViewController.swift
//  IMC
//
//  Created by Francisco Miranda Soares on 04/04/25.
//

import UIKit

class SmallestViewController: UIViewController {

    override func loadView() {
        super.loadView()
        view.backgroundColor = .green
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true)
    }
}
