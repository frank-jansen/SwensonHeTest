//
//  Service.swift
//  SwensonHeTest
//
//  Created by Frank Jansen on 27/12/2022.
//

import Foundation

// Guide: https://github.com/Moya/Moya/blob/master/Sources/Moya/TargetType.swift

// MARK: - Base

protocol Service {    
    var base: String { get }
    var path: String { get }
    var method: HttpMethod { get }
}

extension Service {
    var fullPath: String { base + path }
    var url: URL? { .init(service: self) }
}

// MARK: - Enums

enum HttpMethod: String {
    case get = "GET"
}

// MARK: - URL

extension URL {
    
    init?(service: Service) {
       self.init(string: service.fullPath)
    }
    
}
