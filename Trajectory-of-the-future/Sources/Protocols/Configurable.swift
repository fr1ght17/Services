//
//  Configurable.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 19.02.2023.
//

import Foundation

protocol Configurable {
    associatedtype ViewModel
    
    func configure(with viewModel: ViewModel)
}
