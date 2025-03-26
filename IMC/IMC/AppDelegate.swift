//
//  AppDelegate.swift
//  IMC
//
//  Created by Juliano on 26/03/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate { //Voltando para o nível da aplicação como um todo!
 //No iOS 12 e inferiores, esse arquivo era responsável pela configuraçao da window e da rootViewController, mas do 13 em idiante, ele passou a ser chamado apenas em alguns ciclos da aplicacação como um todo. Lida com apps que usam multiplas scenes (ipad), abrir telas específicas a partir de URLs, receber avisos de memória, gerenciar push notifications, responder a mudanças de ambiente, etc.


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

