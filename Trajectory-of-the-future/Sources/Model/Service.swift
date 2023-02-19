//
//  Service.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 19.02.2023.
//

import Foundation

struct Service: Codable {
    enum CodingKeys: String, CodingKey {
        case name
        case description
        case iconLink = "icon_url"
        case serviceLink = "service_url"
    }
    
    let name: String
    let description: String
    let iconLink: String
    let serviceLink: String
}
