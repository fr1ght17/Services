//
//  Coordinator.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 18.02.2023.
//

import UIKit

protocol Coordinator: AnyObject {
    init(navigationController: NavigationController,
         appDependency: AppDependency)
    
    var navigationController: NavigationController { get }
    var appDependency: AppDependency { get }
    var childCoordinators: [Coordinator] { get set }
    var onDidFinish: (() -> Void)? { get set }
    
    func start(animated: Bool)
    func add(_ coordinator: Coordinator)
    func remove(_ coordinator: Coordinator)
    
    func show<T: Coordinator>(_ type: T.Type, animated: Bool) -> T
    func show<T: ConfigurableCoordinator>(_ type: T.Type, configuration: T.Configuration, animated: Bool) -> T
    func startCoordinator(_ coordinator: Coordinator, animated: Bool)
    
    func handleCoordinatorFinished()
}

extension Coordinator {
    func add(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    func remove(_ coordinator: Coordinator) {
        childCoordinators.removeAll { $0 === coordinator }
    }
    
    @discardableResult
    func show<T: Coordinator>(_ type: T.Type, animated: Bool) -> T {
        let coordinator = T(navigationController: navigationController, appDependency: appDependency)
        startCoordinator(coordinator, animated: animated)
        return coordinator
    }
    
    @discardableResult
    func show<T: ConfigurableCoordinator>(_ type: T.Type, configuration: T.Configuration, animated: Bool) -> T {
        let coordinator = T(navigationController: navigationController, appDependency: appDependency,
                            configuration: configuration)
        startCoordinator(coordinator, animated: animated)
        return coordinator
    }
    
    func startCoordinator(_ coordinator: Coordinator, animated: Bool) {
        add(coordinator)
        coordinator.onDidFinish = { [weak self, weak coordinator] in
            guard let coordinator = coordinator else { return }
            coordinator.handleCoordinatorFinished()
            self?.remove(coordinator)
        }
        coordinator.start(animated: animated)
    }
    
    func handleCoordinatorFinished() {
        // Do nothing
    }
}

