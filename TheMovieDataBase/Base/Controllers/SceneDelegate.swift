//
//  SceneDelegate.swift
//  TheMovieDataBase
//
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        weak var dashboard = UIStoryboard(name: "LaunchScreen",
                                          bundle: .main).instantiateViewController(withIdentifier: "LaunchScreen")
        window?.rootViewController = dashboard
        window?.makeKeyAndVisible()
    }
}
