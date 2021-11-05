//
//  SceneDelegate.swift
//  FeedsApp
//
//  Created by Ely Assumpcao Ndiaye on 04/11/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = TabBar()
        window.makeKeyAndVisible()
        self.window = window
    }

}

