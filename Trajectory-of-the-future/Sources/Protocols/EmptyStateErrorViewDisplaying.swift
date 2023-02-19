//
//  EmptyStateErrorViewDisplaying.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 19.02.2023.
//

import UIKit

protocol EmptyStateErrorViewDisplaying: AnyObject {
    var emptyStateErrorView: EmptyStateErrorView { get }
    var emptyStateErrorViewContainer: UIView { get }
    
    func setupEmptyStateErrorView()
}

extension EmptyStateErrorViewDisplaying {
    func setupEmptyStateErrorView() {
        emptyStateErrorViewContainer.addSubview(emptyStateErrorView)
        emptyStateErrorView.translatesAutoresizingMaskIntoConstraints = false
        emptyStateErrorView.isHidden = true
        
        NSLayoutConstraint.activate([
            emptyStateErrorView.trailingAnchor.constraint(equalTo: emptyStateErrorViewContainer.trailingAnchor, constant: -24),
            emptyStateErrorView.leadingAnchor.constraint(equalTo: emptyStateErrorViewContainer.leadingAnchor, constant: 24),
            emptyStateErrorView.centerYAnchor.constraint(equalTo: emptyStateErrorViewContainer.centerYAnchor)
        ])
        
        emptyStateErrorView.onDidTapRefreshButton = { [weak self] in
            (self as? ErrorHandling)?.handleRefreshButtonTapped()
        }
    }
}

extension EmptyStateErrorViewDisplaying where Self: UIViewController {
    var emptyStateErrorViewContainer: UIView {
        view
    }
}

extension EmptyStateErrorViewDisplaying where Self: UIView {
    var emptyStateErrorViewContainer: UIView {
        self
    }
}
