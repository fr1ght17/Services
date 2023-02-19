//
//  TableCellContainer.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 19.02.2023.
//

import UIKit

class TableCellContainer<ItemView: UIView>: UITableViewCell, TableCell where ItemView: Configurable {
    // MARK: - Properties
    
    private let itemView = ItemView()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Configure
    func configure(with viewModel: TableCellViewModel) {
        if let viewModel = viewModel as? ItemView.ViewModel {
            itemView.configure(with: viewModel)
        }
    }
    
    // MARK: - Setup
    
    private func setup() {
        contentView.addSubview(itemView)
        itemView.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        
        let paddings = (itemView as? PaddingsDescribing)?.paddings ?? .zero
        
        NSLayoutConstraint.activate([
            itemView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: paddings.top),
            itemView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -paddings.right),
            itemView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -paddings.bottom),
            itemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: paddings.left)
        ])
        
        selectionStyle = .none
    }
}
