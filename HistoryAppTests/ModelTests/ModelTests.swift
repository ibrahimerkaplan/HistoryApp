//
//  ModelTests.swift
//  HistoryAppTests
//
//  Created by ibrahim erkaplan on 10.02.2020.
//  Copyright © 2020 ibrahim erkaplan. All rights reserved.
//

import XCTest
@testable import HistoryApp

class ModelTests: XCTestCase {

    enum FileType {
        case date
    }

    func JSONFrom(fileType: FileType) -> Data? {
        let fileName: String
        switch fileType {
        case .date:
            fileName = "date"
        }

        let pathURL = Bundle(for: type(of: self)).url(forResource: fileName, withExtension: "json")
        guard let url = pathURL else {
            XCTFail("There is no such a file '\(fileName)")
            return nil
        }

        guard let data = try? Data.init(contentsOf: url) else {
            XCTFail("Cannot convert json file to data")
            return nil
        }
        return data
    }

    func testDateModel() {
        guard let data = JSONFrom(fileType: .date),
        let response = ApiResponse(jsonData: data) else {
            XCTFail("Response didn't mapped. Missing parameters (non optinals)")
            return
        }

        XCTAssert((type(of: response) == ApiResponse.self), "Not a ApiResponse type")
        XCTAssertEqual("February 10", response.date, "Date is wrong. Should be 'February 10'")
        XCTAssertEqual(true, response.url?.verifyUrl(), "Url is wrong. Should be valid")
        XCTAssertEqual(true, response.data?.events?.count ?? 0 > 0, "Event data is missing.")
        XCTAssertEqual(true, response.data?.births?.count ?? 0 > 0, "Birth data is missing.")
        XCTAssertEqual(true, response.data?.deaths?.count ?? 0 > 0, "Death data is missing.")
        for data in response.data!.births! + response.data!.deaths! {
            XCTAssertEqual(true, data.text?.getNameWithServiceFormat().count ?? 0 > 0, "Name data is missing. \(data)")
        }
        XCTAssertEqual(true, response.data?.events?.first?.links?.count ?? 0 > 0, "Event links are missing.")
        XCTAssertEqual(true, response.data?.events?.first?.links?.first?.link?.verifyUrl(), "Event link is wrong. Should be valid.")
    }
    
}
