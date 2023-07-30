//
//  CarEndpoint.swift
//  AvtomobilkaApp
//
//  Created by Михаил on 27.07.2023.
//

import Foundation

protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    var path: String { get }
}

enum CarAPI {
    case getCars
}

extension CarAPI: APIBuilder {
    
    var baseUrl: URL {
        switch self {
        case .getCars:
            return URL(string: "http://am111.05.testing.place/api/v1/cars")!
        }
    }
    
    var path: String {
        return "/list"
    }
    
    var urlRequest: URLRequest {
        return URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
    }
}
