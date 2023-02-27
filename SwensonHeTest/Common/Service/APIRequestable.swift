//
//  APIRequestable.swift
//  SwensonHeTest
//
//  Created by Frank Jansen 27/12/2022.
//

import Network
import Foundation

// Guide: https://www.danijelavrzan.com/posts/2022/11/network-connection-alert-swiftui/

// MARK: - Base

/// Uses Service to consume basic endpoints. It can be improved, few examples status code, error handleling and logs, monitor handler
class APIRequestable {
    
    enum APIError: LocalizedError {
        case noInternet
        case malformed(String)
//        case unsuccess(errorResponse: APIErrorResponse)
        // can be renamed (?)
        case underlying(Error)
        
        var errorDescription: String? {
            switch self {
            case .noInternet: return "No internet connection"
            case let .malformed(url): return "The URL ( \(url) ) is malformed"
            case let .underlying(error): return "Underlying: \(error.localizedDescription)"
            }
        }
    }
    
    // maybe we can have this inside a single manager instead creating it every time an APIRequestable is created 👀
    private let networkMonitor = NWPathMonitor()
    private let workerQueue = DispatchQueue(label: "networkMonitor")
    // could be used with login (?) instead of hardcoded.
    var sessionKey: String? = "fe2434c0cd1b480cac8162214222712"
    
    var isConnected = true
    
    init() {
        networkMonitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
        }
        networkMonitor.start(queue: workerQueue)
    }
    
    func request<T : Decodable>(service: Service, modelType: T.Type) async throws -> T {
        guard isConnected else {
            throw APIError.noInternet
        }
        
        guard let url = service.url else {
           throw APIError.malformed(service.fullPath)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = service.method.rawValue
        
        do {
            
            // the can be "wrapped", for example with DEBUG
            print("▶️ url \(request.url?.absoluteString ?? "")")
            let (data, response) = try await URLSession.shared.data(for: request)
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
            
            let decoder = JSONDecoder()
            guard 200..<300 ~= statusCode else {
                let errorModel = try decoder.decode(APIErrorResponse.self, from: data)
                throw errorModel
            }

            let model = try decoder.decode(modelType.self, from: data)
            return model
        }
        catch let error as APIErrorResponse {
            throw error
        }
        catch {
            throw APIError.underlying(error)
        }
    }
}

