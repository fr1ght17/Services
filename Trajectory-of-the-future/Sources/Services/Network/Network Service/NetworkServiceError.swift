//
//  NetworkServiceError.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 19.02.2023.
//

import Foundation

enum NetworkServiceError: LocalizedError {
    case notValidURL
    case requestFailed(Error)
    case decodeFailed
}
