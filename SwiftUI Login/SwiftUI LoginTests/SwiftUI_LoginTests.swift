//
//  SwiftUI_LoginTests.swift
//  SwiftUI LoginTests
//
//  Created by Smin Rana on 2/11/21.
//

import XCTest
@testable import SwiftUI_Login

class SwiftUI_LoginTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testLoginApi() {
        var user: User?
        var isLogged = false
        
        let promise = expectation(description: "Loging API")
        
        LoginApi().login(email: "sminrana@gmail.com", password: "goaL5738", completion: { result, data in
            if result == .success {
                guard let data = data else { return }
                let decodedResponse = try! JSONDecoder().decode(UserApiData.self, from: data as! Data)
                print(decodedResponse)
                
                DispatchQueue.main.sync {
                    if decodedResponse.login {
                        isLogged = true

                        if let u = decodedResponse.data {
                            user = u
                        }
                    }
                    
                    promise.fulfill()
                }
            }
            
            if result == .error {
                DispatchQueue.main.sync {
                    promise.fulfill()
                }
            }
        })
        
        wait(for: [promise], timeout: 5.0)
        
        XCTAssertNotNil(user)
        XCTAssertTrue(isLogged)
    }
}
