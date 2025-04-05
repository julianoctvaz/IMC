//
//  ConverterViewController+Delegate.swift
//  IMC
//
//  Created by Juliano on 04/04/25.
//

import UIKit

// MARK: - UIPickerViewDelegate

extension ConverterViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        height = Double(row)
        converterView.pickerLabel.text = String(format: "Altura: %.1f", height)
    }
}
