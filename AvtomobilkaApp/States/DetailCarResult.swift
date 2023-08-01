//
//  DetailCarResult.swift
//  AvtomobilkaApp
//
//  Created by Михаил on 31.07.2023.
//

import Foundation

enum DetailCarResultState {
    case loading
    case success(content: DetailCar, User)
    case failed(error: Error)
}
