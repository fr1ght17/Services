//
//  StorageServiceError.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 19.02.2023.
//

import Foundation

enum StorageServiceError: LocalizedError {
    case failedSaveFile, failedFindSavedFile, invalidFileURL
    
    var errorDescription: String? {
        switch self {
        case .failedSaveFile:
            return Resources.String.errorStorageFailedSaveFile
            
        case .failedFindSavedFile:
            return Resources.String.errorStorageFailedFindSavedFile
            
        case .invalidFileURL:
            return Resources.String.errorStorageInvalidFileURL
        }
    }
}
