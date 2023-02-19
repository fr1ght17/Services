//
//  ServiceDetailCoordinator.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 19.02.2023.
//

import Foundation

struct ServiceDetailCoordinatorConfiguration {
    let service: Service
}

final class ServiceDetailCoordinator: ConfigurableCoordinator {
    typealias Configuration = ServiceDetailCoordinatorConfiguration
    
    // MARK: - Properties
    
    let appDependency: AppDependency
    let navigationController: NavigationController
    
    var childCoordinators: [Coordinator] = []
    var onDidFinish: (() -> Void)?
    
    private let configuration: Configuration
    
    // MARK: - Init
    
    init(navigationController: NavigationController, appDependency: AppDependency, configuration: Configuration) {
        self.appDependency = appDependency
        self.navigationController = navigationController
        self.configuration = configuration
    }
    
    // MARK: - Navigation
    
    func start(animated: Bool) {
        showServiceDetailScreen(animated: animated)
    }
    
    private func showServiceDetailScreen(animated: Bool) {
        let viewModel = ServiceDetailViewModel(service: configuration.service)
        let viewController = ServiceDetailViewController(viewModel: viewModel)
        
        viewController.navigationTitleView.setTitle(configuration.service.name)
        
        navigationController.pushViewController(viewController, animated: animated)
    }
    
}
