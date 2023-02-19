//
//  EmptyStateErrorView.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 19.02.2023.
//

import UIKit

final class EmptyStateErrorView: UIView {
    // MARK: - Properties
    
    var onDidTapRefreshButton: (() -> Void)?
    
    private let stackView = UIStackView()
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let refreshButton = UIButton()
    
    // MARK: - Init
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Actions
    
    @objc
    private func didTapRefreshButton() {
        onDidTapRefreshButton?()
    }
    
    // MARK: - Setup
    
    private func setup() {
        setupStackView()
        setupImageView()
        setupTitleLabel()
        setupSubtitleLabel()
        setupRefreshButton()
    }
    
    private func setupStackView() {
        addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .center
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func setupImageView() {
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Resources.Image.errorRobot
        stackView.addArrangedSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 220),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
    }
    
    private func setupTitleLabel() {
        stackView.addArrangedSubview(titleLabel)
        stackView.setCustomSpacing(4, after: titleLabel)
        titleLabel.text = Resources.String.errorServerErrorTitle
        titleLabel.textColor = .appBlack
        titleLabel.font = .systemFont(ofSize: 22, weight: .bold)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
    }
    
    private func setupSubtitleLabel() {
        stackView.addArrangedSubview(subtitleLabel)
        subtitleLabel.text = Resources.String.errorServerErrorSubtitle
        subtitleLabel.textColor = .appBlack
        subtitleLabel.font = .systemFont(ofSize: 18, weight: .light)
        subtitleLabel.numberOfLines = 0
        subtitleLabel.textAlignment = .center
    }
    
    private func setupRefreshButton() {
        stackView.addArrangedSubview(refreshButton)
        refreshButton.setTitle(Resources.String.commonRefresh, for: .normal)
        refreshButton.backgroundColor = .appAccent
        refreshButton.addTarget(self, action: #selector(didTapRefreshButton), for: .touchUpInside)
        refreshButton.layer.cornerRadius = 10
        refreshButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            refreshButton.heightAnchor.constraint(equalToConstant: 44),
            refreshButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}
