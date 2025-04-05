//
//  ConverterViewController+PickerDataSource.swift
//  IMC
//
//  Created by Juliano on 04/04/25.
//

import UIKit

// MARK: - UIPickerViewDataSource

extension ConverterViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 400
    }
}
