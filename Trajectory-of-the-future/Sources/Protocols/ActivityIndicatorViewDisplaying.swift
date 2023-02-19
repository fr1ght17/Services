//
//  ActivityIndicatorViewDisplaying.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 19.02.2023.
//

import UIKit

protocol ActivityIndicatorViewDisplaying {
    var activityIndicatorView: UIActivityIndicatorView { get }
    var activityIndicatorContainerView: UIView { get }
    
    func setupActivityIndicatorView()
}

extension ActivityIndicatorViewDisplaying {
    func setupActivityIndicatorView() {
        activityIndicatorContainerView.addSubview(activityIndicatorView)
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicatorView.topAnchor.constraint(equalTo: activityIndicatorContainerView.topAnchor),
            activityIndicatorView.leadingAnchor.constraint(equalTo: activityIndicatorContainerView.leadingAnchor),
            activityIndicatorView.trailingAnchor.constraint(equalTo: activityIndicatorContainerView.trailingAnchor),
            activityIndicatorView.bottomAnchor.constraint(equalTo: activityIndicatorContainerView.bottomAnchor)
        ])
    }
}

extension ActivityIndicatorViewDisplaying where Self: UIViewController {
    var activityIndicatorContainerView: UIView {
        view
    }
}

extension ActivityIndicatorViewDisplaying where Self: UIView {
    var activityIndicatorContainerView: UIView {
        self
    }
}
