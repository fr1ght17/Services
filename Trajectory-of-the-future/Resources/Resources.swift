//
//  Resources.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 18.02.2023.
//

import UIKit

struct Resources {
    // MARK: - Strings
    
    struct String {
        static let alertShowingActionOkText = NSLocalizedString("ok", tableName: "Common", comment: "")
        static let commonError = NSLocalizedString("error", tableName: "Common", comment: "")
        static let serviceFeedScreenTitle = NSLocalizedString("title", tableName: "ServicesFeed", comment: "")
        static let commonRefresh = NSLocalizedString("refresh", tableName: "Common", comment: "")
        static let errorServerErrorTitle = NSLocalizedString("server.error.title", tableName: "Errors", comment: "")
        static let errorServerErrorSubtitle = NSLocalizedString("server.error.subtitle", tableName: "Errors", comment: "")
        static let errorStorageFailedSaveFile = NSLocalizedString("storage.failed.save.file", tableName: "Errors", comment: "")
        static let errorStorageFailedFindSavedFile = NSLocalizedString("storage.failed.find.saved.file", tableName: "Errors", comment: "")
        static let errorStorageInvalidFileURL = NSLocalizedString("storage.invalid.file.url", tableName: "Errors", comment: "")
        static let errorNetworkNotValidURL = NSLocalizedString("network.not.valid.url", tableName: "Errors", comment: "")
        static let errorNetworkRequestFailed = NSLocalizedString("network.request.failed", tableName: "Errors", comment: "")
        static let errorNetworkDecodeFailed = NSLocalizedString("network.decode.failed", tableName: "Errors", comment: "")
    }
    
    // MARK: - Color
    
    struct Color {
        static let blue = UIColor(named: "Blue")!
        static let white = UIColor(named: "White")!
        static let black = UIColor(named: "Black")!
    }
    
    // MARK: - Images
    
    struct Image {
        static let errorRobot = UIImage(named: "ErrorRobot")!
    }
}
