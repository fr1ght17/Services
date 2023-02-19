//
//  DataLoadingViewModel.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 19.02.2023.
//

import Foundation

protocol DataLoadingViewModel: AnyObject {
    var onDidStartRequest: (() -> Void)? { get set }
    var onDidFinishRequest: (() -> Void)? { get set }
    var onDidLoadData: (() -> Void)? { get set }
    var onDidReceiveError: ((Error, Bool) -> Void)? { get set }
}
