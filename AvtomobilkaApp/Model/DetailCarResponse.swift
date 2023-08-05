//
//  DetailCarResponse.swift
//  AvtomobilkaApp
//
//  Created by Михаил on 30.07.2023.
//

import Foundation

// MARK: - DetailInfoResponse
struct DetailInfoResponse: Codable {
    var detailCar: DetailCar
    var user: User
    
    enum CodingKeys: String, CodingKey {
        case detailCar = "car"
        case user
    }
}
// MARK: - DetailCar
struct DetailCar: Codable, Identifiable {
    var id: Int
    var forSale: Int
    var brandName: String
    var modelName: String
    var year: Int
    var price: Int?
    var brandId: Int
    var modelId: Int
    var engineId: Int
    var transmissionId: Int
    var placeId: String?
    var name: String
    var cityName: String
    var countryName: String
    var transmissionName: String
    var placeName: String
    var images: [CarImages]
    var inSectionCount: Int
    var followersCount: Int
    var follow: Bool
    var engine: String
    var engineName: String
    var engineVolume: String
    var isModerated: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case forSale = "for_sale"
        case brandName = "brand_name"
        case modelName = "model_name"
        case year
        case price
        case brandId = "brand_id"
        case modelId = "model_id"
        case engineId = "engine_id"
        case transmissionId = "transmission_id"
        case placeId = "place_id"
        case name
        case cityName = "city_name"
        case countryName = "country_name"
        case transmissionName = "transmission_name"
        case placeName = "place_name"
        case images
        case inSectionCount = "in_selection_count"
        case followersCount = "followers_count"
        case follow
        case engine
        case engineName = "engine_name"
        case engineVolume = "engine_volume"
        case isModerated = "is_moderated"
    }
}
// MARK: - User
struct User: Codable {
    var id: Int
    var username: String
    var email: String?
    var about: String?
    var avatar: Avatar
    var autoCount: Int
    var mainAutoName: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case username
        case email
        case about
        case avatar
        case autoCount = "auto_count"
        case mainAutoName = "main_auto_name"
    }
}

// MARK: - CarImages
struct CarImages: Codable {
    var id: Int
    var isPrimary: Bool
    var size: Int
    var index: Int
    var url: String
    var thumbnailUrl: String
    var image500: String
    var image100: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case isPrimary = "is_primary"
        case size
        case index
        case url
        case thumbnailUrl = "thumbnail_url"
        case image500
        case image100
    }
}
// MARK: - Avatar
struct Avatar: Codable {
    var path: String
    var url: String
}
