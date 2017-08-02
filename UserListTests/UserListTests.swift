//
//  UserListTests.swift
//  UserListTests
//
//  Created by user128664 on 8/1/17.
//  Copyright © 2017 Sateesh. All rights reserved.
//

import XCTest
@testable import UserList

class UserListTests: XCTestCase {
    
    var apiTest: URLSession!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAPIStautus() {
        
        apiTest = URLSession(configuration: URLSessionConfiguration.default)

        let url = URL(string: "https://jsonplaceholder.typicode.com/users")
        let status = expectation(description: "Status code: 200")
        
        let dataTask = apiTest.dataTask(with: url!) { data, response, error in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusFromAPI = (response as? HTTPURLResponse)?.statusCode {
                if statusFromAPI == 200 {
                    status.fulfill()
                } else {
                    XCTFail("Status code: \(statusFromAPI)")
                }
            }
        }
        dataTask.resume()
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testUsersCount() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let userView = UsersViewController()
        userView.viewModel.getUserModels {
            
            let usersCount = userView.viewModel.numberOfUsersToDisplay(in: 0)
            XCTAssertGreaterThan(usersCount, 0)
        }
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
