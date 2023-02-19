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
    
    var errorDescription: String? {
        switch self {
        case .notValidURL:
            return Resources.String.errorNetworkNotValidURL
            
        case .decodeFailed:
            return Resources.String.errorNetworkDecodeFailed
            
        case .requestFailed(let error):
            return Resources.String.errorNetworkRequestFailed + error.localizedDescription
        }
    }
}
