//
//  NetworkService.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 18.02.2023.
//

import Foundation

final class NetworkService {
    // MARK: - Loading data
    
    func request<T:Codable>(model: T.Type, method: HTTPMethod,
                 url: URL?,
                 completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = url else {
            completion(.failure(NetworkServiceError.notValidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(NetworkServiceError.requestFailed(error)))
                }
            } else if let data = data {
                do {
                    let result: T = try self.decode(data)
                    DispatchQueue.main.async {
                        completion(.success(result))
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            }
        }
        
        task.resume()
    }
    
    // MARK: - Decoding data
    
    func decode<T:Codable> (_ data: Data) throws -> T {
        log(data)
        do {
            let object = try JSONDecoder().decode(T.self, from: data)
            return object
        } catch {
            throw NetworkServiceError.decodeFailed
        }
    }
    
    // MARK: - Logging in console
    
    private func log(_ data: Data) {
        print("----------------------------------------")
        if let object = try? JSONSerialization.jsonObject(with: data),
           let data4Console = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
           let prettyPrintedString = NSString(data: data4Console, encoding: String.Encoding.utf8.rawValue) {
            print(prettyPrintedString)
        }
        print("----------------------------------------")
    }
}
