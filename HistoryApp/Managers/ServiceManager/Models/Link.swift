//
// Link.swift
//

import Foundation

public struct Link: Codable {

    public var title: String?
    public var link: String?

    public init(title: String?, link: String?) {
        self.title = title
        self.link = link
    }


}

