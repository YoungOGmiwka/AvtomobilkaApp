//
//  CarResultState.swift
//  AvtomobilkaApp
//
//  Created by Михаил on 27.07.2023.
//

import Foundation

enum CarResultState {
    case loading
    case success(content: [CarList])
    case failed(error: Error)
}
