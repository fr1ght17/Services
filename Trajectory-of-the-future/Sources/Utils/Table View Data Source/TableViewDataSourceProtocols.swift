//
//  TableViewDataSourceProtocols.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 19.02.2023.
//

import Foundation

protocol TableViewModel {
    var sectionViewModels: [TableSectionViewModel] { get }
}

protocol TableHeaderFooterViewModel: AnyObject {
    var tableReuseIdentifier: String { get }
}

protocol TableCellViewModel {
    var tableReuseIdentifier: String { get }
    func select()
}

extension TableCellViewModel {
    func select() {}
}

protocol TableCell {
    func configure(with viewModel: TableCellViewModel)
}
