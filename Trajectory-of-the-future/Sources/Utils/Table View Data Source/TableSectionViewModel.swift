//
//  TableSectionViewModel.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 19.02.2023.
//

import Foundation

class TableSectionViewModel {
    var rowsCount: Int {
        cellViewModels.count
    }
    
    private(set) var cellViewModels: [TableCellViewModel] = []
    
    func append(_ cellViewModel: TableCellViewModel) {
        cellViewModels.append(cellViewModel)
    }
    
    func append(cellViewModels: [TableCellViewModel]) {
        self.cellViewModels.append(contentsOf: cellViewModels)
    }
}
