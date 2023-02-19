//
//  ServicesFeedViewController.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 19.02.2023.
//

import UIKit

final class ServicesFeedViewController: BaseViewController, ErrorHandling, ActivityIndicatorViewDisplaying, DataLoadingView, EmptyStateErrorViewDisplaying {
    
    // MARK: - Properties
    
    let activityIndicatorView = UIActivityIndicatorView()
    let activityIndicatorContainerView = UIView()
    let emptyStateErrorView = EmptyStateErrorView()
    
    private let tableView = UITableView(frame: .zero, style: .grouped)
    private let refreshControl = UIRefreshControl()
    private let dataSource = TableViewDataSource()
    
    private let viewModel: ServicesFeedViewModel
    
    // MARK: - Init
    
    init(viewModel: ServicesFeedViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        bind(to: viewModel)
        viewModel.viewIsReady()
    }
    
    // MARK: - Public methods
    
    func handleRequestStarted() {
        view.isUserInteractionEnabled = false
        activityIndicatorContainerView.isHidden = false
        activityIndicatorView.startAnimating()
    }

    func handleRequestFinished() {
        activityIndicatorContainerView.isHidden = true
        activityIndicatorView.stopAnimating()
        view.isUserInteractionEnabled = true
    }

    func handleErrorReceived() {
    }

    func reloadData() {
        emptyStateErrorView.isHidden = true
        refreshControl.endRefreshing()
        dataSource.update(with: viewModel)
    }

    func handleRefreshButtonTapped() {
        viewModel.viewIsReady()
    }
    
    // MARK: - Actions
    
    @objc
    private func handleRefreshControl() {
        viewModel.refreshData()
    }
    
    // MARK: - Setup
    
    private func setup() {
        setupTableView()
        setupRefreshControl()
        setupActivityIndicatorView()
        setupActivityIndicatorContainerView()
        setupEmptyStateErrorView()
    }
    
    private func setupActivityIndicatorContainerView() {
        view.addSubview(activityIndicatorContainerView)
        activityIndicatorContainerView.backgroundColor = .appBlack.withAlphaComponent(0.3)
        activityIndicatorContainerView.isHidden = true
        activityIndicatorContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicatorContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            activityIndicatorContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            activityIndicatorContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            activityIndicatorContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.backgroundColor = .appWhite
        tableView.separatorStyle = .none
        tableView.alwaysBounceVertical = false
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.showsVerticalScrollIndicator = false
        tableView.refreshControl = refreshControl
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableView.register(ServiceCell.self, forCellReuseIdentifier: ServiceCell.reuseIdentifier)
        dataSource.setup(tableView: tableView, viewModel: viewModel)
    }
    
    private func setupRefreshControl() {
        refreshControl.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
    }
}
