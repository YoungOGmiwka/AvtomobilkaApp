//
//  PostViewModel.swift
//  AvtomobilkaApp
//
//  Created by Михаил on 05.08.2023.
//
import Foundation
import Combine

class PostViewModel: ObservableObject {

    @Published var carPost: [Post]?
    @Published var hasError = false
    @Published var error: PostCarError?
    @Published private(set) var isRefreshing = false

    private var cancellables = Set<AnyCancellable>()

    func fetchPostInfo(carID id: Int, _ state: LoadingStatus = .loading) {
        DetailInfoApiBuilder.shared.getPosts(withID: id)
            .sink { [weak self] res in
                switch res {
                case .failure(let error):
                    self?.hasError = true
                    self?.error = PostCarError.custom(error: error)
                default: break
                }
                self?.isRefreshing = false
            } receiveValue: { [weak self] carPost in
                switch state {
                case .loading:
                    self?.carPost = carPost.posts
                case .finishedLoad:
                    self?.carPost?.append(contentsOf: carPost.posts ?? [Post]())
                }
            }
            .store(in: &cancellables)
    }
}

extension PostViewModel {
    enum PostCarError: LocalizedError {
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
    
    enum LoadingStatus {
        case loading
        case finishedLoad
    }
}
