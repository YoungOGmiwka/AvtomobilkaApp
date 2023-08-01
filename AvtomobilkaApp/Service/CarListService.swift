//
//  CarListService.swift
//  AvtomobilkaApp
//
//  Created by Михаил on 27.07.2023.
//

import Foundation
import Combine

protocol CarService {
    func request(from endpoint: CarAPI) -> AnyPublisher<CarList, APIError>
}

struct CarListServiceImpl: CarService {
    
    func request(from endpoint: CarAPI) -> AnyPublisher<CarList, APIError> {
        return URLSession
            .shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in APIError.unknown }
            .flatMap { data, response -> AnyPublisher<CarList, APIError> in
                guard let response = response as? HTTPURLResponse else {
                    return Fail (error: APIError.unknown).eraseToAnyPublisher()
                }
                
                if (200...299).contains(response.statusCode) {
                    let jsonDecoder = JSONDecoder()
                    
                    return Just(data)
                        .decode(type: CarList.self, decoder: jsonDecoder)
                        .mapError { _ in APIError.decodingError }
                        .eraseToAnyPublisher()
                        
                } else {
                    return Fail(error: APIError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
}
