//
//  SceneDelegate.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 17.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private var mainCoordinator: MainCoordinator?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        mainCoordinator = createMainCoordinator(scene: windowScene)
        mainCoordinator?.start(animated: false)
    }
    
    private func createMainCoordinator(scene: UIWindowScene) -> MainCoordinator {
        let window = UIWindow(windowScene: scene)
        let navigationController = NavigationController()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        self.window = window
        
        return MainCoordinator(navigationController: navigationController)
    }


}

