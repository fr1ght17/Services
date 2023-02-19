//
//  ServiceView.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 19.02.2023.
//

import UIKit

typealias ServiceCell = TableCellContainer<ServiceView>

final class ServiceView: UIView, Configurable {
    // MARK: - Properties
    
    private let container = UIStackView()
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Configurable
    
    func configure(with viewModel: ServiceCellViewModel) {
        nameLabel.text = viewModel.serviceName
        guard let url = URL(string: viewModel.serviceImageLink) else { return }
        imageView.setImage(with: url, placeholder: .none, options: .none)
    }
    
    // MARK: - Setup
    
    private func setup() {
        setupContainer()
        setupImageView()
        setupNameLabel()
    }
    
    private func setupContainer() {
        addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.axis = .horizontal
        container.spacing = 8
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: self.topAnchor),
            container.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            container.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    private func setupImageView() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 45),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
        
        container.addArrangedSubview(imageView)
    }
    
    private func setupNameLabel() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .systemFont(ofSize: 24, weight: .thin)
        nameLabel.textColor = .appBlack
        container.addArrangedSubview(nameLabel)
    }
}

extension ServiceView: PaddingsDescribing {
    var paddings: UIEdgeInsets {
        UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    }
}
