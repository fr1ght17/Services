//
//  AppDependency.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 18.02.2023.
//

import Foundation

protocol HasServiceNetworkService {
    var serviceNetworkService: ServicesNetworkProtocol { get }
}

protocol HasServicesStorageService {
    var servicesStorageService: ServicesStorageServiceProtocol { get }
}

final class AppDependency: HasServicesStorageService{
    
    let servicesStorageService: ServicesStorageServiceProtocol
    
    private let networkService: NetworkService
    
    init() {
        servicesStorageService = ServicesStorageService()
        networkService = NetworkService()
    }
}

// MARK: - HasServiceNetworkService

extension AppDependency: HasServiceNetworkService {
    var serviceNetworkService: ServicesNetworkProtocol {
        networkService
    }
}
