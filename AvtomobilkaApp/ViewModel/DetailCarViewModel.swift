//
//  DetailCarViewModel.swift
//  AvtomobilkaApp
//
//  Created by Михаил on 30.07.2023.
//

import Foundation
import Combine

class DetailCarsViewModel: ObservableObject {

    @Published var car: DetailInfoResponse?
    @Published var hasError = false
    @Published var error: DetailCarError?
    @Published private(set) var isRefreshing = false

    private var cancellables = Set<AnyCancellable>()

    func fetchDetailCarInfo(carID id: Int) {

        isRefreshing = true
        hasError = false

        DetailInfoApiBuilder.shared.getDetailCar(withID: id)
            .sink { [weak self] res in

                defer { self?.isRefreshing = false }

                switch res {
                case .failure(let error):
                    self?.hasError = true
                    self?.error = DetailCarError.custom(error: error)
                default: break
                }

                self?.isRefreshing = false
            } receiveValue: { [weak self] car in
                self?.car = car
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
