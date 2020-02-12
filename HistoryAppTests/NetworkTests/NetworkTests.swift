//
//  NetworkTests.swift
//  HistoryAppTests
//
//  Created by ibrahim erkaplan on 10.02.2020.
//  Copyright © 2020 ibrahim erkaplan. All rights reserved.
//

import XCTest
@testable import HistoryApp

class NetworkTests: XCTestCase {

    func testGetDatesRequest() {
        let e = expectation(description: "Get Dates")

        DateAPI.getDates { (response, error) in
            if error != nil{
                XCTAssertNil(error, "An error occured: \(String(describing: error))")
            }
            else{
                
                if let apiResponse = response as? ApiResponse? {
                    XCTAssert((type(of: apiResponse) == ApiResponse.self), "Not a ApiResponse type")
                    XCTAssertEqual("February 10", apiResponse?.date, "Date is wrong. Should be 'February 10'")
                    XCTAssertEqual(true, apiResponse?.url?.verifyUrl(), "Url is wrong. Should be valid")
                    XCTAssertEqual(true, apiResponse?.data?.events?.count ?? 0 > 0, "Event data is missing.")
                    XCTAssertEqual(true, apiResponse?.data?.births?.count ?? 0 > 0, "Birth data is missing.")
                    XCTAssertEqual(true, apiResponse?.data?.deaths?.count ?? 0 > 0, "Death data is missing.")
                    for data in (apiResponse?.data!.births!)! + (apiResponse?.data!.deaths!)! {
                        XCTAssertEqual(true, data.text?.getNameWithServiceFormat().count ?? 0 > 0, "Name data is missing. \(data)")
                    }
                    XCTAssertEqual(true, apiResponse?.data?.events?.first?.links?.count ?? 0 > 0, "Event links are missing.")
                    XCTAssertEqual(true, apiResponse?.data?.events?.first?.links?.first?.link?.verifyUrl(), "Event link is wrong. Should be valid.")
                }
                else {
                    e.fulfill()
                }

            }
        }

        waitForExpectations(timeout: 30.0) { (error: Error?) in
            print("Timeout Error: \(error.debugDescription)")
        }
    }
    
}
