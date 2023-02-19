//
//  StorageTests.swift
//  StorageTests
//
//  Created by Степан Потапов on 20.02.2023.
//

import XCTest
@testable import Trajectory_of_the_future

final class StorageTests: XCTestCase {
    
    var storage = StorageService()
    
    override func setUpWithError() throws { }

    override func tearDownWithError() throws { }

    func testStorageServiceSave_String_Correct() throws {
        
        let string = "Всем привет"
        let data: Data?
        do {
            data = try JSONEncoder().encode(string)
        } catch {
            XCTFail("Ошибка кодирования")
            return
        }
        
        guard let data = data else {
            XCTFail("Ошибка сериализации")
            return
        }
        
        storage.saveObject(data, key: "test") { error in
            XCTAssertEqual(error?.localizedDescription, nil)
        }
    }
    
    func testStorageServiceGet_String_Correct() throws {
        let string = "Всем привет"
        let data: Data?
        do {
            data = try JSONEncoder().encode(string)
        } catch {
            XCTFail("Ошибка кодирования")
            return
        }
        
        guard let data = data else {
            XCTFail("Ошибка сериализации")
            return
        }
        
        storage.saveObject(data, key: "test") { error in
            if error != nil {
                XCTFail("Ошибка сохранения")
                return
            }
        }
        
        storage.getObject(ofType: Data.self, key: "test") { result in
            switch result {
            case .success(let success):
                do {
                    let result = try JSONDecoder().decode(String.self, from: success)
                    XCTAssertEqual(result, string)
                    return
                } catch {
                    XCTFail("Ошибка декодирования данных")
                    return
                }
                
            case .failure(_):
                XCTFail("Ошибка получения файла")
                return
            }
        }
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
