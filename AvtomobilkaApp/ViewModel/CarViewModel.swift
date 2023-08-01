//
//  CarViewModel.swift
//  AvtomobilkaApp
//
//  Created by Михаил on 27.07.2023.
//

import Foundation
import Combine

//protocol ICarViewModel {
//    func getCarList()
//}
//
//class CarViewModelImpl: ObservableObject, ICarViewModel {
//
//    private let service: CarService
//
//    private(set) var сars = [CarList]()
//
//    private var cancellables = Set<AnyCancellable>()
//
//    @Published private(set) var state: CarResultState = .loading
//
//    init(service: CarService) {
//        self.service = service
//    }
//
//    func getCarList() {
//
//        self.state = .loading
//
//        let cancellable = service
//            .request(from: .getCars)
//            .sink { res in
//                switch res {
//                case .finished:
//                    self.state = .success(content: self.сars)
//                break
//                case .failure(let error):
//                    self.state = .failed(error: error)
//                break
//                }
//            } receiveValue: { response in
//                self.сars = response.сars
//            }
//
//        self.cancellables.insert(cancellable)
//    }
//}

class CarsViewModel: ObservableObject {
    
    @Published var cars: [CarList] = []
    @Published var hasError = false
    @Published var error: CarError?
    @Published private(set) var isRefreshing = false
    
    private var bag = Set<AnyCancellable>()
    
    func fetchCars() {
        
        let carsUrlString = "http://am111.05.testing.place/api/v1/cars/list"
        if let url = URL(string: carsUrlString) {
            
            isRefreshing = true
            hasError = false
            
            URLSession
                .shared
                .dataTaskPublisher(for: url)
                .receive(on: DispatchQueue.main)
                .map(\.data)
                .decode(type: [CarList].self, decoder: JSONDecoder())
                .sink { [weak self] res in
                    
                    defer { self?.isRefreshing = false }
                    
                    switch res {
                    case .failure(let error):
                        self?.hasError = true
                        self?.error = CarError.custom(error: error)
                    default: break
                    }
                    
                    self?.isRefreshing = false
                } receiveValue: { [weak self] cars in
                    self?.cars = cars
                }
                .store(in: &bag)
        }
    }
}


extension CarsViewModel {
    enum CarError: LocalizedError {
        case custom(error: Error)
        case failedToDecode
        
        var errorDescription: String? {
            switch self {
            case .failedToDecode:
                return "Failed to decode response"
            case .custom(let error):
                return error.localizedDescription
            }
        }
    }
}
