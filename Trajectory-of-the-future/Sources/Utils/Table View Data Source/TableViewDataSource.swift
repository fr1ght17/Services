//
//  TableViewDataSource.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 19.02.2023.
//

import UIKit

final class TableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    // MARK: - Properties
    
    var onDidScroll: ((_ scrollView: UIScrollView) -> Void)?
    
    private var tableView: UITableView?
    private var viewModel: TableViewModel?
    
    // MARK: - Setup
    
    func setup(tableView: UITableView, viewModel: TableViewModel) {
        self.tableView = tableView
        self.viewModel = viewModel
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    // MARK: - Public methods
    
    func update(with viewModel: TableViewModel) {
        self.viewModel = viewModel
        tableView?.reloadData()
    }
    
    // MARK: - Actions
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        onDidScroll?(scrollView)
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.sectionViewModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.sectionViewModels.element(at: section)?.rowsCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellViewModel = viewModel?.sectionViewModels.element(at: indexPath.section)?.cellViewModels.element(at: indexPath.row) else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.tableReuseIdentifier, for: indexPath)
        (cell as? TableCell)?.configure(with: cellViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.sectionViewModels.element(at: indexPath.section)?.cellViewModels.element(at: indexPath.row)?.select()
    }
}
