//
// ApiResponse.swift
//

import Foundation

public struct ApiResponse: Codable {

    public var date: String?
    public var url: String?
    public var data: ModelData?

    public init(date: String?, url: String?, data: ModelData?) {
        self.date = date
        self.url = url
        self.data = data
    }


}

