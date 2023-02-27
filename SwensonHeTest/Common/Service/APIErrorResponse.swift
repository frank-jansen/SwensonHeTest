//
//  APIErrorResponse.swift
//  SwensonHeTest
//
//  Created by Frank Jansen on 2/2/23.
//

import Foundation

struct APIErrorResponse: Decodable, LocalizedError {
    
    let errorDescription: String?
    let code: Int
    
    enum OuterKeys: String, CodingKey {
        case error
    }
    
    enum ErrorKeys: String, CodingKey {
        case errorDescription = "message"
        case code
    }
    
    init(from decoder: Decoder) throws {
        let outerContainer = try decoder.container(keyedBy: OuterKeys.self)
        let errorContainer = try outerContainer.nestedContainer(keyedBy: ErrorKeys.self,
                                                                   forKey: .error)
        errorDescription = try errorContainer.decode(String.self, forKey: .errorDescription)
        code = try errorContainer.decode(Int.self, forKey: .code)
    }
    
}

