//
// ModelData.swift
//

import Foundation

public struct ModelData: Codable {

    public var events: [Detail]?
    public var births: [Detail]?
    public var deaths: [Detail]?

    public init(events: [Detail]?, births: [Detail]?, deaths: [Detail]?) {
        self.events = events
        self.births = births
        self.deaths = deaths
    }

    public enum CodingKeys: String, CodingKey { 
        case events = "Events"
        case births = "Births"
        case deaths = "Deaths"
    }


}

