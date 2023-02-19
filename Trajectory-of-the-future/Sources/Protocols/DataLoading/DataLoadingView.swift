//
//  DataLoadingView.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 19.02.2023.
//

import Foundation

protocol DataLoadingView: AnyObject {
    func bind(to viewModel: DataLoadingViewModel)
    func handleRequestStarted()
    func handleRequestFinished()
    func handleErrorReceived()
    func reloadData()
}

extension DataLoadingView where Self: ActivityIndicatorViewDisplaying & ErrorHandling {
    func bind(to viewModel: DataLoadingViewModel) {
        viewModel.onDidStartRequest = { [weak self] in
            self?.activityIndicatorView.startAnimating()
            self?.handleRequestStarted()
        }
        
        viewModel.onDidFinishRequest = { [weak self] in
            self?.activityIndicatorView.stopAnimating()
            self?.handleRequestFinished()
        }
        
        viewModel.onDidLoadData = { [weak self] in
            self?.reloadData()
        }
        
        viewModel.onDidReceiveError = { [weak self] error, alert in
            self?.handle(error, showAsEmptyState: !alert)
            self?.handleErrorReceived()
        }
    }
    
    func handleRequestStarted() {}
    func handleRequestFinished() {}
    func handleErrorReceived() {}
    func reloadData() {}
}
