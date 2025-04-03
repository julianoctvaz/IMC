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
    case buttonExamples
    case customAction
    case auditCases
    case languages
    case fontExample
    case fruitsTable
    case fruitCollection

    var viewController: UIViewController {
        switch self {
        case .imc:
            return IMCViewController(mass: 70, height: 175)
        case .exemploTextField:
            return ExemploTextfieldViewController()
        case .buttonExamples:
            return ButtonExamplesViewController()
        case .customAction:
            return ViewControllerWithCustomAction()
        case .auditCases:
            return AuditCasesViewController()
        case .languages:
            return LanguagesViewController()
        case .fontExample:
            return FontExampleViewController()
        case .fruitsTable:
            return FruitsTableViewController()
        case .fruitCollection:
            return FruitCollectionViewController()
        }
    }
}
