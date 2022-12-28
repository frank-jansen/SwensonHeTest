//
//  APIRequestable.swift
//  SwensonHeTest
//
//  Created by José Valderrama on 27/12/2022.
//

import Network
import Foundation

// Guide: https://www.danijelavrzan.com/posts/2022/11/network-connection-alert-swiftui/

// MARK: - Base

/// Uses Service to consume basic endpoints. It can be improved, few examples status code, error handleling and logs, monitor handler
class APIRequestable {
    
    enum APIError: Error {
        case noInternet
        case malformed
        case unsuccess(code: Int)
        // can be renamed (?)
        case decoding(underlying: Error)
    }
    
    // maybe we can have this inside a single manager instead creating it every time an APIRequestable is created 👀
    private let networkMonitor = NWPathMonitor()
    private let workerQueue = DispatchQueue(label: "networkMonitor")
    // could be used with login (?) instead of hardcoded.
    var sessionKey: String? = "fe2434c0cd1b480cac8162214222712"
    
    var isConnected = false
    
    init() {
        networkMonitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
        }
        networkMonitor.start(queue: workerQueue)
    }
    
    func request<T : Decodable>(service: Service, model: T.Type) async throws -> T {
        guard isConnected else {
            throw APIError.noInternet
        }
        
        guard let url = URL(service: service) else {
            throw APIError.malformed
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = service.method.rawValue
        
        do {
            // the can be "wrapped", for example with DEBUG
            print("▶️ url \(request.url?.absoluteString ?? "")")
            let (data, response) = try await URLSession.shared.data(for: request)
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
            
            guard 200..<300 ~= statusCode else {
                throw APIError.unsuccess(code: statusCode)
            }

            let model = try JSONDecoder().decode(model.self, from: data)
            return model
        } catch {
            throw APIError.decoding(underlying: error)
        }
    }
}

