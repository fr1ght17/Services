//
//  NetworkService+Services.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 19.02.2023.
//

import Foundation

extension NetworkService: ServicesNetworkProtocol {
    func getServices(completion: @escaping (Result<[Service], Error>) -> Void) {
        request(model: Response.self,
                method: .GET,
                url: URL(string: URLFactory.Services.services)) { result in
            switch result {
            case .success(let result):
                completion(.success(result.items))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
