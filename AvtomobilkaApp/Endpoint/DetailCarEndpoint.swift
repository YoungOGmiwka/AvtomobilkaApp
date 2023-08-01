//
//  DetailCarEndpoint.swift
//  AvtomobilkaApp
//
//  Created by Михаил on 31.07.2023.
//

import Foundation
import Combine

enum DetailCarAPI {
    static let car = "http://am111.05.testing.place/api/v1/car/"
}

class DetailCarApiBuilder {
    static let shared = DetailCarApiBuilder()
    
    func fetchDetailCar(withID id: Int) -> AnyPublisher<DetailInfoResponse, Error> {
        let finishedUrl = DetailCarAPI.car + String(id)
        
        guard let url = URL(string: finishedUrl) else {
            return Fail(error: NSError(domain: "Error", code: -1)).eraseToAnyPublisher()
        }
        
        return URLSession
            .shared
            .dataTaskPublisher(for: url).map { $0.data }
            .decode(type: DetailInfoResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
