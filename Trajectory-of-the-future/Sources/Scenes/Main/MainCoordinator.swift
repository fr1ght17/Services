//
//  MainCoordinator.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 19.02.2023.
//

import Foundation

final class MainCoordinator: Coordinator {
    // MARK: - Properties
    
    let appDependency: AppDependency
    let navigationController: NavigationController
    
    var childCoordinators: [Coordinator] = []
    var onDidFinish: (() -> Void)?
    
    init(navigationController: NavigationController, appDependency: AppDependency = AppDependency()) {
        self.appDependency = appDependency
        self.navigationController = navigationController
    }
    
    // MARK: - Navigation
    
    func start(animated: Bool) {
        showServicesFeedScreen()
    }
    
    private func showServicesFeedScreen() {
        show(ServicesFeedCoordinator.self, animated: true)
    }
}
