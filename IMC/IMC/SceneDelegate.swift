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

        // como seria implementação de um onBoarding
        if UserDefaults.standard.bool(forKey: "hasShownOnboarding") {
            let viewController = SmallestViewController()
            self.window?.rootViewController = viewController
            UserDefaults.standard.set(true, forKey: "hasShownOnboarding")
        } else {
            let tabBarController = UITabBarController()
            let rootNavigationController = UINavigationController(
                rootViewController: ListandoMentoresViewController()
            )
            rootNavigationController.tabBarItem.image = UIImage(systemName: "eraser")
            rootNavigationController.tabBarItem.selectedImage = UIImage(systemName: "eraser.fill")
            rootNavigationController.tabBarItem.title = "Mentores"

            let imcViewController = IMCViewController(mass: 86, height: 184)
            imcViewController.tabBarItem.image = UIImage(systemName: "person.circle")
            imcViewController.tabBarItem.selectedImage = UIImage(systemName: "person.circle.fill")
            imcViewController.tabBarItem.title = "IMC"

            tabBarController.viewControllers = [rootNavigationController, imcViewController]

            self.window?.rootViewController = tabBarController
        }
        self.window?.makeKeyAndVisible()
    }

    func sceneWillResignActive(_ scene: UIScene) {
        self.window?.rootViewController?.view.isHidden = true
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        self.window?.rootViewController?.view.isHidden = false
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        self.window?.rootViewController?.view.isHidden = true
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        self.window?.rootViewController?.view.isHidden = false
    }


}
