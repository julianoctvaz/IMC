//
//  RootControllerOption.swift
//  IMC
//
//  Created by Juliano on 03/04/25.
//

import UIKit

enum RootControllerOption {
    case imc
    case exemploTextField
    case alice

    var viewController: UIViewController {
        switch self {
        case .imc:
            return IMCViewController(mass: 70, height: 175)
        case .exemploTextField:
            return ExemploTextfieldViewController()
        case .alice:
            return MyViewController()
        }
    }
}
