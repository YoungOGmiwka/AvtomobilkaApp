//
//  DetailInfoEndpoint.swift
//  AvtomobilkaApp
//
//  Created by Михаил on 05.08.2023.
//

import Foundation
import Combine

private enum DetailAPI {
    static let car = "http://am111.05.testing.place/api/v1/car/"
}

class DetailInfoApiBuilder: ObservableObject {
    static let shared = DetailInfoApiBuilder()
    
    func getDetailCar(withID id: Int) -> AnyPublisher<DetailInfoResponse, Error> {
        let finishedUrl = DetailAPI.car + String(id)
        guard let url = URL(string: finishedUrl) else {
            return Fail(error: NSError(domain: "Error", code: -1)).eraseToAnyPublisher()
        }
        return URLSession
            .shared
            .dataTaskPublisher(for: url)
            .map {
                $0.data
            }
            .decode(type: DetailInfoResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func getPosts(withID id: Int) -> AnyPublisher<CarPostResponse, Error> {
        let finishedUrl = DetailAPI.car + String("\(id)/posts")
        guard let url = URL(string: finishedUrl) else {
            return Fail(error: NSError(domain: "Error", code: -1)).eraseToAnyPublisher()
        }
        return URLSession
            .shared
            .dataTaskPublisher(for: url)
            .map {
                $0.data
            }
            .decode(type: CarPostResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
