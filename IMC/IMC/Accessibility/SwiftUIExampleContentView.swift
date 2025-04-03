//
//  AccessibilitySwiftUIExampleContentView.swift
//  IMC
//
//  Created by Juliano on 03/04/25.
//


import SwiftUI

struct SwiftUIExampleContentView: View {
    var body: some View {
        VStack {
            Text("Botão de exemplo")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                .accessibilityLabel("Esse é um botão de exemplo")

            Button("Clique aqui") {
                print("Apertou o botão")
            }
            .accessibilityHint("Pressione para realizar uma ação")
        }
    }
}

#Preview {
    SwiftUIExampleContentView()
}
