//
//  StorageService.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 19.02.2023.
//

import Foundation

private extension Constants {
    static let folderName = "VKServicesCacheData"
}

class StorageService {
    // MARK: - Properties
    
    private let fileManager = FileManager.default
    
    // MARK: - Public methods
    
    func saveObject<T:Codable>(_ object: T, key: String, completion: @escaping (Error?) -> Void) {
        let fileName = makeFileName(type: T.self, key: key)
        let fileURL = try? makeDirectoryURL().appendingPathComponent(fileName, isDirectory: false)
        let data = try? JSONEncoder().encode(object)
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let fileManager = self?.fileManager else { return }
            
            guard let fileURL = fileURL else {
                completion(StorageServiceError.invalidFileURL)
                return
            }
            
            if fileManager.fileExists(atPath: fileURL.path) {
                do {
                    try fileManager.removeItem(at: fileURL)
                } catch {
                    completion(error)
                }
            }
            
            let isSaved = fileManager.createFile(atPath: fileURL.path, contents: data)
            
            guard isSaved else {
                DispatchQueue.main.async {
                    completion(StorageServiceError.failedSaveFile)
                }
                return
            }
            DispatchQueue.main.async {
                completion(nil)
            }
        }
    }
    
    func getObject<T:Codable>(ofType type: T.Type, key: String, completion: @escaping(Result<T, Error>) -> Void) {
        let fileName = makeFileName(type: type, key: key)
        let fileURL = try? makeDirectoryURL().appendingPathComponent(fileName, isDirectory: false)
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let fileManager = self?.fileManager else { return }
            
            guard let fileURL = fileURL else {
                DispatchQueue.main.async {
                    completion(.failure(StorageServiceError.invalidFileURL))
                }
                return
            }
            
            guard let data = fileManager.contents(atPath: fileURL.path) else {
                DispatchQueue.main.async {
                    completion(.failure(StorageServiceError.failedFindSavedFile))
                }
                return
            }
            
            guard let result = try? JSONDecoder().decode(type, from: data) else {
                DispatchQueue.main.async {
                    completion(.failure(StorageServiceError.failedFindSavedFile))
                }
                return
            }
            DispatchQueue.main.async {
                completion(.success(result))
            }
        }
    }
    
    // MARK: - Private methods
    
    private func makeDirectoryURL() throws -> URL {
        let directoryURL = try fileManager.url(for: .documentDirectory,
                                               in: .userDomainMask,
                                               appropriateFor: nil,
                                               create: true).appendingPathComponent(Constants.folderName, isDirectory: true)
        try fileManager.createDirectory(at: directoryURL, withIntermediateDirectories: true)
        return directoryURL
    }
    
    private func makeFileName<T:Codable>(type: T.Type, key: String) -> String {
        return "\(String(describing: T.self)).\(key)"
    }
}
