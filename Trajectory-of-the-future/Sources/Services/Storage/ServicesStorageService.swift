//
//  ServicesStorageService.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 19.02.2023.
//

import Foundation

class ServicesStorageService: StorageService, ServicesStorageServiceProtocol {
    private struct Keys {
        static let services = "services"
    }
    
    func getServices(completion: @escaping (Result<[Service], Error>) -> Void){
        getObject(ofType: [Service].self, key: Keys.services) { result in
            switch result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func updateServices(with services: [Service], completion: @escaping(Error?) -> Void) {
        saveObject(services, key: Keys.services) { error in
            completion(error)
        }
    }
}
