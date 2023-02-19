//
//  ServicesFeedCoordinator.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 19.02.2023.
//

import Foundation

final class ServicesFeedCoordinator: Coordinator {
    // MARK: - Properties
    
    let appDependency: AppDependency
    let navigationController: NavigationController
    
    var childCoordinators: [Coordinator] = []
    var onDidFinish: (() -> Void)?
    
    // MARK: - Init
    
    init(navigationController: NavigationController, appDependency: AppDependency) {
        self.appDependency = appDependency
        self.navigationController = navigationController
    }
    
    // MARK: - Navigation
    
    func start(animated: Bool) {
        showServicesFeedScreen(animated: animated)
    }
    
    private func showServicesFeedScreen(animated: Bool) {
        let viewModel = ServicesFeedViewModel(dependecies: appDependency)
        viewModel.delegate = self
        let viewController = ServicesFeedViewController(viewModel: viewModel)
        viewController.navigationTitleView.setTitle(Resources.String.serviceFeedScreenTitle)
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    private func showServiceDetailScreen(service: Service) {
        let configuration = ServiceDetailCoordinatorConfiguration(service: service)
        show(ServiceDetailCoordinator.self, configuration: configuration, animated: true)
    }
}

// MARK: - ServicesFeedViewModelDelegate

extension ServicesFeedCoordinator: ServicesFeedViewModelDelegate {
    func servicesFeedViewModel(_ viewModel: ServicesFeedViewModel, didRequestToShowDetailScreenWith service: Service) {
        showServiceDetailScreen(service: service)
        
    }
}
