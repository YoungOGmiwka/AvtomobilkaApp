//
//  DetailCarResponse.swift
//  AvtomobilkaApp
//
//  Created by Михаил on 30.07.2023.
//

import Foundation

// MARK: - DetailInfoResponse
struct DetailInfoResponse: Codable {
    var car: DetailCar
    var user: User
    
    enum CodingKeys: String, CodingKey {
        case car
        case user
    }
}

// MARK: - DetailCar
struct DetailCar: Codable, Identifiable {
    let id, forSale: Int
    let brandName, modelName: String
    let year: Int
    let brandID, modelID, engineID, transmissionID: Int
    let placeID, name, cityName, countryName: String
    let transmissionName, placeName: String
    let images: [ImageUrl]
    let inSelectionCount, followersCount: Int
    let follow: Bool
    let engine, engineName, engineVolume: String
    let isModerated: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case forSale = "for_sale"
        case brandName = "brand_name"
        case modelName = "model_name"
        case year
        case brandID = "brand_id"
        case modelID = "model_id"
        case engineID = "engine_id"
        case transmissionID = "transmission_id"
        case placeID = "place_id"
        case name
        case cityName = "city_name"
        case countryName = "country_name"
        case transmissionName = "transmission_name"
        case placeName = "place_name"
        case images
        case inSelectionCount = "in_selection_count"
        case followersCount = "followers_count"
        case follow, engine
        case engineName = "engine_name"
        case engineVolume = "engine_volume"
        case isModerated = "is_moderated"
    }
}

// MARK: - ImageUrl
struct ImageUrl: Codable {
    let id: Int
    let isPrimary: Bool
    let size, index: Int
    let url, thumbnailURL, image500, image100: String

    enum CodingKeys: String, CodingKey {
        case id
        case isPrimary = "is_primary"
        case size, index, url
        case thumbnailURL = "thumbnail_url"
        case image500, image100
    }
}

// MARK: - User
struct User: Codable, Identifiable {
    let id: Int
    let username, email: String
    let avatar: Avatar
    let autoCount: Int
    let mainAutoName: String

    enum CodingKeys: String, CodingKey {
        case id, username, email, avatar
        case autoCount = "auto_count"
        case mainAutoName = "main_auto_name"
    }
}

// MARK: - Avatar
struct Avatar: Codable {
    let path: String
    let url: String
}


extension DetailCar {
    
    static var dummyDetailData: DetailCar {
        .init(id: 49,
              forSale: 0,
              brandName: "Volkswagen",
              modelName: "Tiguan",
              year: 2018,
              brandID: 49,
              modelID: 5,
              engineID: 82,
              transmissionID: 2,
              placeID: "ChIJZf-0KTq_SkERpxQXi49I6WU",
              name: "Volkswagen Tiguan TSI AT 2018 Ð³.",
              cityName: "",
              countryName: "",
              transmissionName: "AT",
              placeName: "",
              images: [ImageUrl.init(id: 771,
                                     isPrimary: true,
                                     size: 0,
                                     index: 0,
                                     url: "http://am111.05.testing.place/uploads/user/37/auto/49/fc40ee0a0dbf97b2e504b2f48438a8ba.jpg",
                                     thumbnailURL: "",
                                     image500: "",
                                     image100: "")],
              inSelectionCount: 0,
              followersCount: 15,
              follow: false,
              engine: "2.0 TSI",
              engineName: "TSI",
              engineVolume: "2.0",
              isModerated: true)
    }
}

extension User {
    
    static var dummyUserData: User {
        .init(id: 37,
              username: "lexer7",
              email: "7lexer7@tester.avtomobilka.com",
              avatar: Avatar.init(path: "",
                                  url: "http://am111.05.testing.place/uploads/user/37/avatars/hkVsjX1d8CUWIfNRLk4Bo29NBMFsAio1sQiKSV5o.jpg"),
              autoCount: 1,
              mainAutoName: "Volkswagen Tiguan")
    }
}

// MARK: - Encode/decode helpers

//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public func hash(into hasher: inout Hasher) {
//        hasher.combine(0)
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
