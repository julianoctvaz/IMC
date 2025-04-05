//
//  IMCViewController+TextFieldDelegate.swift
//  IMC
//
//  Created by Juliano on 04/04/25.
//

import UIKit

// MARK: - UITextFieldDelegate

extension IMCViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = CharacterSet(charactersIn: "0123456789.").inverted
        return string.rangeOfCharacter(from: invalidCharacters) == nil
    }
}
