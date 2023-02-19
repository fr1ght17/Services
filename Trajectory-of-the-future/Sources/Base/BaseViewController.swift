//
//  BaseViewController.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 18.02.2023.
//

import UIKit

class BaseViewController: UIViewController {
    
    private(set) var navigationTitleView = NavigationControllerTitleView()
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Setup
    
    private func setup() {
        view.backgroundColor = .appAccent
        navigationItem.backBarButtonItem?.tintColor = .black
        navigationItem.titleView = navigationTitleView
    }

}
