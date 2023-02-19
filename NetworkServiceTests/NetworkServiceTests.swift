//
//  NetworkServiceTests.swift
//  NetworkServiceTests
//
//  Created by Степан Потапов on 20.02.2023.
//

import XCTest
@testable import Trajectory_of_the_future

final class NetworkServiceTests: XCTestCase {
    
    let network = NetworkService()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDecode_arrayInt_complete() throws {
        let testArray = [17, 28, 51]
        
        let data = try? JSONEncoder().encode(testArray)
        
        guard let data = data else {
            XCTFail("Ошибка кодирования")
            return
        }
        
        let resultArray: [Int]? = try? network.decode(data)
        
        guard let resultArray = resultArray else {
            XCTFail("Ошибка декодировани")
            return
        }
        
        XCTAssertEqual(testArray, resultArray)
    }
    
    func testDecode_arrayString_complete() throws {
        let testArray = ["vk", "mail", "ok"]
        
        
        let data = try? JSONEncoder().encode(testArray)
        
        guard let data = data else {
            XCTFail("Ошибка кодирования")
            return
        }
        
        let resultArray: [String]? = try? network.decode(data)
        
        guard let resultArray = resultArray else {
            XCTFail("Ошибка декодировани")
            return
        }
        
        XCTAssertEqual(testArray, resultArray)
    }
    
    

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
