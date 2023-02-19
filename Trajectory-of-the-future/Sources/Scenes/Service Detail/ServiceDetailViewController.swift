//
//  ServiceDetailViewController.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 19.02.2023.
//

import UIKit

final class ServiceDetailViewController: BaseViewController {
    // MARK: - Properties
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let container = UIStackView()
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let linkButton = UIButton(type: .system)
    
    private let viewModel: ServiceDetailViewModel
    
    // MARK: - Init
    
    init(viewModel: ServiceDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    @objc
    private func handleLinkTap() {
        guard let url = URL(string: viewModel.linkService) else { return }
        UIApplication.shared.open(url)
    }
    
    // MARK: - Setup
    
    private func setup() {
        setupScrollView()
        setupContainer()
        setupImageView()
        setupNameLabel()
        setupDescriptionLabel()
        setupLinkButton()
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .appWhite
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
    }
    
    private func setupContainer() {
        contentView.addSubview(container)
        
        container.translatesAutoresizingMaskIntoConstraints = false
        container.axis = .vertical
        container.alignment = .center
        container.spacing = 14
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    private func setupImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        guard let url = URL(string: viewModel.imageLinkService) else { return }
        imageView.setImage(with: url, placeholder: .none, options: .none)
        imageView.contentMode = .scaleAspectFill
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
        
        container.addArrangedSubview(imageView)
    }
    private func setupNameLabel() {
        nameLabel.font = UIFont.systemFont(ofSize: 28, weight: .regular)
        nameLabel.textColor = .appBlack
        nameLabel.text = viewModel.nameService
        nameLabel.numberOfLines = 0
        nameLabel.textAlignment = .center
        container.addArrangedSubview(nameLabel)
    }
    private func setupDescriptionLabel() {
        descriptionLabel.font = UIFont.systemFont(ofSize: 22, weight: .thin)
        descriptionLabel.textColor = .appBlack
        descriptionLabel.text = viewModel.descriptionService
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .left
        container.addArrangedSubview(descriptionLabel)
    }
    private func setupLinkButton() {
        let attributes: [NSAttributedString.Key: Any] = [.font : UIFont.systemFont(ofSize: 20, weight: .light), .foregroundColor : UIColor.appAccent, .underlineStyle: NSUnderlineStyle.single.rawValue]
        
        let attributeString = NSMutableAttributedString(string: viewModel.linkService, attributes: attributes)
        
        linkButton.setAttributedTitle(attributeString, for: .normal)
        linkButton.titleLabel?.textAlignment = .left
        linkButton.addTarget(self, action: #selector(handleLinkTap), for: .touchUpInside)
        
        container.addArrangedSubview(linkButton)
    }
}
