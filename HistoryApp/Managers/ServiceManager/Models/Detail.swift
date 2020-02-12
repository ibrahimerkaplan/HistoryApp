//
// Detail.swift
//

import Foundation

public struct Detail: Codable {

    public var year: String?
    public var text: String?
    public var html: String?
    public var noYearHtml: String?
    public var links: [Link]?

    public init(year: String?, text: String?, html: String?, noYearHtml: String?, links: [Link]?) {
        self.year = year
        self.text = text
        self.html = html
        self.noYearHtml = noYearHtml
        self.links = links
    }

    public enum CodingKeys: String, CodingKey { 
        case year
        case text
        case html
        case noYearHtml = "no_year_html"
        case links
    }


}

