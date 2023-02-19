//
//  NavigationControllerTitleView.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 19.02.2023.
//

import UIKit

final class NavigationControllerTitleView: UIView {
    // MARK: - Properties
    
    private let container = UIStackView()
    private let label = UILabel()
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    
    func setTitle(_ title: String) {
        label.text = title
    }
    
    // MARK: - Setup
    
    private func setup() {
        setupContainer()
        setupLabel()
        setupSpacer()
    }
    
    private func setupContainer() {
        addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.axis = .horizontal
        container.alignment = .leading
        container.distribution = .equalSpacing
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: self.topAnchor),
            container.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func setupLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .appWhite
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 20)
        container.addArrangedSubview(label)
    }
    
    private func setupSpacer() {
        let spacer = UIView()
        spacer.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = spacer.widthAnchor.constraint(greaterThanOrEqualToConstant: UIScreen.main.bounds.width)
        constraint.priority = .defaultLow
        constraint.isActive = true
        container.addArrangedSubview(spacer)
    }
    
}
