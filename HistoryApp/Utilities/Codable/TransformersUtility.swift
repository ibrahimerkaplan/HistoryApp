//
//  TransformersUtility.swift
//  HistoryApp
//
//  Created by ibrahim erkaplan on 10.02.2020.
//  Copyright © 2020 ibrahim erkaplan. All rights reserved.
//

import UIKit

import Foundation

public typealias CodableTransformer = DecodingTransformer & EncodingTransformer

public protocol DecodingTransformer {
    associatedtype Input
    associatedtype Output
    func transform(_ decoded: Input) throws -> Output
}

public protocol EncodingTransformer {
    associatedtype Input
    associatedtype Output
    func transform(_ encoded: Output) throws -> Input
}

public extension KeyedDecodingContainer {

    func decode<Transformer: DecodingTransformer>(_ key: KeyedDecodingContainer.Key,
                                                         transformer: Transformer) throws -> Transformer.Output where Transformer.Input : Decodable {
        let decoded: Transformer.Input = try self.decode(key)
        return try transformer.transform(decoded)
    }

    func decode<T: Decodable>(_ key: KeyedDecodingContainer.Key) throws -> T {
        return try self.decode(T.self, forKey: key)
    }

}

public extension KeyedEncodingContainer {

    mutating func encode<Transformer: EncodingTransformer>(_ value: Transformer.Output,
                                                                  forKey key: KeyedEncodingContainer.Key,
                                                                  transformer: Transformer) throws where Transformer.Input : Encodable {
        let transformed: Transformer.Input = try transformer.transform(value)
        try self.encode(transformed, forKey: key)
    }

}
