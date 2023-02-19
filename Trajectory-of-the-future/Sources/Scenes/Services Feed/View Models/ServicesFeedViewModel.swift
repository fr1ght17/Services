//
//  ServicesFeedViewModel.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 19.02.2023.
//

import Foundation

protocol ServicesFeedViewModelDelegate: AnyObject {
    func servicesFeedViewModel(_ viewModel: ServicesFeedViewModel, didRequestToShowDetailScreenWith service: Service)
}

final class ServicesFeedViewModel: TableViewModel, DataLoadingViewModel {
    typealias Dependecies = HasServiceNetworkService & HasServicesStorageService
    
    // MARK: - Properties
    
    var onDidStartRequest: (() -> Void)?
    var onDidFinishRequest: (() -> Void)?
    var onDidLoadData: (() -> Void)?
    var onDidReceiveError: ((Error, Bool) -> Void)?
    
    var sectionViewModels: [TableSectionViewModel] {
        let section = TableSectionViewModel()
        section.append(cellViewModels: itemViewModels)
        return [section]
    }
    
    weak var delegate: ServicesFeedViewModelDelegate?
    
    private var itemViewModels: [TableCellViewModel] = []
    
    private let dependencies: Dependecies
    
    // MARK: - Init
    
    init(dependecies: Dependecies) {
        self.dependencies = dependecies
    }
    
    // MARK: - Public methods
    
    func viewIsReady() {
        onDidStartRequest?()
        loadDataFromCache()
    }
    
    func refreshData() {
        refreshDataFromInternet()
    }
    
    // MARK: - Private methods
    
    private func loadDataFromCache() {
        dependencies.servicesStorageService.getServices { [weak self] result in
            switch result {
            case .success(let services):
                self?.handle(services)
            case .failure(_):
                self?.loadDataFromInternet()
            }
        }
    }
    
    private func refreshDataFromInternet() {
        dependencies.serviceNetworkService.getServices {[weak self] result in
            switch result {
            case .success(let success):
                self?.saveInCache(success)
                self?.handle(success)
            case .failure(let failure):
                self?.onDidReceiveError?(failure, true)
                self?.onDidFinishRequest?()
            }
        }
    }
    
    private func loadDataFromInternet() {
        dependencies.serviceNetworkService.getServices {[weak self] result in
            switch result {
            case .success(let success):
                self?.saveInCache(success)
                if let itemViewModels = self?.itemViewModels, itemViewModels.isEmpty {
                    self?.handle(success)
                }
            case .failure(let failure):
                if let itemViewModels = self?.itemViewModels, itemViewModels.isEmpty {
                    self?.onDidReceiveError?(failure, false)
                    self?.onDidFinishRequest?()
                }
            }
        }
    }
    
    private func saveInCache(_ services: [Service]) {
        dependencies.servicesStorageService.updateServices(with: services) {[weak self] error in
            guard let error = error else {
                return
            }
            self?.onDidReceiveError?(error, true)
        }
    }
    
    private func handle(_ services: [Service]) {
        self.itemViewModels = services.map {
            let itemViewModel = ServiceCellViewModel(service: $0)
            itemViewModel.delegate = self
            return itemViewModel
        }
        onDidLoadData?()
        onDidFinishRequest?()
    }
}

// MARK: - ServiceCellViewModelDelegate

extension ServicesFeedViewModel: ServiceCellViewModelDelegate {
    func serviceCellViewModel(_ viewModel: ServiceCellViewModel, didSelect service: Service) {
        delegate?.servicesFeedViewModel(self, didRequestToShowDetailScreenWith: service)
    }
}
