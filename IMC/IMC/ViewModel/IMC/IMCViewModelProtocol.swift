//
//  IMCViewModelProtocol.swift
//  IMC
//
//  Created by Juliano on 04/04/25.
//


protocol IMCViewModelProtocol {
    func IMC(_ mass: Double, _ height: Double) -> Double
    func changeTextAndImageResult(_ resultIMC: Double) -> (subtitleResultLabel: String, imageName: String)
}
