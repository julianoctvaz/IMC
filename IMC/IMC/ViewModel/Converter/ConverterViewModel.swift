//
//  ConverterViewModel.swift
//  IMC
//
//  Created by Juliano Cezar Teles Vaz on 29/11/21.
//


import Foundation

class ConverterViewModel: ConverterViewModelProtocol {
    func kgToLibra(_ kg: Double) -> Double {
        return 2.2*kg
    }
    func LibratoKg(_ libra: Double) -> Double {
        return libra/2.2
    }
}

