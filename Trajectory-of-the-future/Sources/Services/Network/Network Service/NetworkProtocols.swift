//
//  NetworkProtocols.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 19.02.2023.
//

import Foundation

protocol ServicesNetworkProtocol {
    func getServices(completion: @escaping (Result<[Service], Error>) -> Void)
}
