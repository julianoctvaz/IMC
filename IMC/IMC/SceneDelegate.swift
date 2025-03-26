//
//  SceneDelegate.swift
//  IMC
//
//  Created by Juliano on 26/03/25.
//

import UIKit

// Esse arquivo gerencia o ciclo de vida da scene no app, controlando eventos como ativação, entrada em segundo plano e desconexão. Ele também configura a UIWindow principal quando a cena é criada.

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        
        let rootNavigationController = ViewController()
      
        self.window?.rootViewController = rootNavigationController
        self.window?.makeKeyAndVisible()
    }

  


}

