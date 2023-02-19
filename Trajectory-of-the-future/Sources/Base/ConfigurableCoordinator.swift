//
//  ConfigurableCoordinator.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 19.02.2023.
//

import Foundation

protocol ConfigurableCoordinator: Coordinator {
    associatedtype Configuration
    
    // MARK: TODO - Убрать когда буду отправлять проект, если не пришлось использовать
    
    init(navigationController: NavigationController, appDependency: AppDependency, configuration: Configuration)
}

extension ConfigurableCoordinator {
    init(navigationController: NavigationController, appDependency: AppDependency) {
        fatalError("Use init with configuration for this coordinator")
    }
}
