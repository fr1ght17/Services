//
//  ServiceCellViewModel.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 19.02.2023.
//

import Foundation

protocol ServiceCellViewModelDelegate: AnyObject {
    func serviceCellViewModel(_ viewModel: ServiceCellViewModel, didSelect service: Service)
}

final class ServiceCellViewModel {
    // MARK: - Properties
    
    weak var delegate: ServiceCellViewModelDelegate?
    
    var serviceName: String {
        service.name
    }
    
    var serviceImageLink: String {
        service.iconLink
    }
    
    private let service: Service
    
    // MARK: - Init
    
    init(service: Service) {
        self.service = service
    }
    
    // MARK: - Actions
    
    func select() {
        delegate?.serviceCellViewModel(self, didSelect: service)
    }
}

// MARK: - TableCellViewModel

extension ServiceCellViewModel: TableCellViewModel {
    var tableReuseIdentifier: String {
        ServiceCell.reuseIdentifier
    }
}
