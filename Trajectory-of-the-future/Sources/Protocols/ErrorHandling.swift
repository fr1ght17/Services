//
//  ErrorHandling.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 19.02.2023.
//

import Foundation

protocol ErrorHandling: AlertShowing {
    func handle(_ error: Error, showAsEmptyState: Bool)
    func handleRefreshButtonTapped()
}

extension ErrorHandling {
    func handle(_ error: Error, showAsEmptyState: Bool) {
        if showAsEmptyState, let self = self as? EmptyStateErrorViewDisplaying {
            self.emptyStateErrorView.isHidden = false
        } else {
            showAlert(title: Resources.String.commonError, message: error.localizedDescription)
        }
    }
    
    func handleRefreshButtonTapped() {
        //Do nothing
    }
}
