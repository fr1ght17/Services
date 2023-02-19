//
//  StorageServiceProtocols.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 19.02.2023.
//

import Foundation

protocol ServicesStorageServiceProtocol {
    func updateServices(with services: [Service], completion: @escaping(Error?) -> Void)
    func getServices(completion: @escaping (Result<[Service], Error>) -> Void)
}
