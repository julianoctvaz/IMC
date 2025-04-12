//
//  CustomCellDelegate.swift
//  IMC
//
//  Created by Juliano on 11/04/25.
//

import UIKit

protocol CustomCellDelegate: AnyObject {
    func didTapButton(in cell: CustomCell)
    //consegue acessar o index, mas nao os elementos da celula provavelmente
}

