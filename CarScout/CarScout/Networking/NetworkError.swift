//
//  NetworkError.swift
//  CarScout
//
//  Created by Valentina Henao on 13/11/19.
//  Copyright © 2019 Valentina Henao. All rights reserved.
//

import Foundation

/// Possible errors from a netwrok request
public enum NetworkError: Error {
    case clientProblem(Error)
    case wrongContentType
    case notAuthenticated
    case forbidden
    case notFound
    case unknown(HTTPURLResponse?)
    case userCancelled
    
    /// Creates an instance of a Network Error from a given Error object
    public init(error: Error) {
       self = .clientProblem(error)
     }
     
    /// Creates an instance of a Network Error from a given URL Response object
    public init(response: URLResponse?) {
        guard let response = response as? HTTPURLResponse else {
            self = .unknown(nil)
            return
        }
        
        switch response.statusCode {
        case NetworkError.notAuthenticated.statusCode: self = .notAuthenticated
        case NetworkError.forbidden.statusCode: self = .forbidden
        case NetworkError.notFound.statusCode: self = .notFound
        default: self = .unknown(response)
        }
     }
    
    /// Possible status codes for network errors
    public var statusCode: Int {
        switch self {
        case .notAuthenticated: return 401
        case .forbidden: return 403
        case .notFound: return 404
        case .wrongContentType: return 415
        case .clientProblem(_): return 10001
        case .unknown(_): return 10002
        case .userCancelled: return 99999
        }
    }
}
