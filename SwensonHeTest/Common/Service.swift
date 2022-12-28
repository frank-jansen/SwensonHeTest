//
//  Service.swift
//  SwensonHeTest
//
//  Created by José Valderrama on 27/12/2022.
//

import Foundation

// Guide: https://github.com/Moya/Moya/blob/master/Sources/Moya/TargetType.swift

// MARK: - Base

protocol Service {    
    var base: String { get }
    var path: String { get }
    var method: HttpMethod { get }
}

// MARK: - Enums

enum HttpMethod: String {
    case get = "GET"
}

// MARK: - URL

extension URL {
    
    init?<T: Service>(service: T) {
        self.init(string: service.path.isEmpty
                  ? service.base :
                    service.base + service.path)
    }    
}
