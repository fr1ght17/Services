//
//  Array+ElementAt.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 19.02.2023.
//

import Foundation

extension Array {
    func element(at index: Int) -> Array.Element? {
        guard index >= 0, index < count else { return nil }
        return self[index]
    }
}
