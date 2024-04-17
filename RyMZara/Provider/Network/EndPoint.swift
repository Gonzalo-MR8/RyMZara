//
//  RyMZaraApp.swift
//  RyMZara
//
//  Created by GonzaloMR on 17/4/24.
//

import Foundation

protocol EndPoint {
    var basePath: String { get }
    var path: String { get }
    var method: HttpMethod { get }
    var postBody: [String: Any]? { get }
    var urlParameters: [String: String]? { get }
    var customHeaders: [String: String]? { get }
}

enum HttpMethod: String {
    case post   = "POST"
    case get    = "GET"
    case delete = "DELETE"
    case put    = "PUT"
}

enum RequestError: Error {
    case invalidURL
    case noData
    case noHttpResponse
    case noInternetConnection
    case statusError(code: Int)
    case unauthorized
    case unknown
}
