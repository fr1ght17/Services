//
//  URLFactory.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 19.02.2023.
//

import Foundation

struct URLFactory {
    private static let baseURL = "https://mobile-olympiad-trajectory.hb.bizmrg.com"
    
    struct Services {
        static let services = baseURL + "/semi-final-data.json"
    }
}
