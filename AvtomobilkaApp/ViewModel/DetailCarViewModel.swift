//
//  DetailCarViewModel.swift
//  AvtomobilkaApp
//
//  Created by Михаил on 30.07.2023.
//

import Foundation
import Combine

class DetailCarsViewModel: ObservableObject {

    @Published var detailCars: DetailInfoResponse?
    @Published var hasError = false
    @Published var error: DetailCarError?
    @Published private(set) var isRefreshing = false
    
    private var cancellables = Set<AnyCancellable>()

    func fetchCarInfo(detailCars id: Int) {
        
        isRefreshing = true
        hasError = false
        
        DetailCarApiBuilder.shared.fetchDetailCar(withID: id)
            .sink { [weak self] res in

                defer { self?.isRefreshing = false }

                switch res {
                case .failure(let error):
                    self?.hasError = true
                    self?.error = DetailCarError.custom(error: error)
                default: break
                }

                self?.isRefreshing = false
            } receiveValue: { [weak self] detailCars in
                self?.detailCars = detailCars
            }
            .store(in: &cancellables)
    }
}


extension DetailCarsViewModel {
    enum DetailCarError: LocalizedError {
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

