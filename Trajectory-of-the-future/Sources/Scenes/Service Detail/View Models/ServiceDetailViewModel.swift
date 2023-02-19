//
//  ServiceDetailViewModel.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 19.02.2023.
//

import Foundation

final class ServiceDetailViewModel {
    // MARK: - Properties
    
    var imageLinkService: String {
        service.iconLink
    }
    
    var nameService: String {
        service.name
    }
    
    var descriptionService: String {
        service.description
    }
    
    var linkService: String {
        service.serviceLink
    }
    
    private let service: Service
    
    // MARK: - Init
    
    init (service: Service) {
        self.service = service
    }
    
}
