//
//  CarListResponse.swift
//  AvtomobilkaApp
//
//  Created by Михаил on 27.07.2023.
//

import Foundation
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

//typealias CarList = [CarListResponse]

//// MARK: - CarListResponse
//struct CarListResponse: Codable {
//    let сars: [CarList]
//}

// MARK: - CarList
struct CarList: Codable, Identifiable {
    let id: Int
    let forSale: Int
    let brandName, modelName, engineName: String
    let year: Int
    let brandID, modelID, engineID, transmissionID: Int
    let name, placeID: String
    let imageURL, thumbnail: String
    let cityName, countryName: String
    let transmissionName: TransmissionName
    let engineVolume, placeName: String
    let images: [Images]
    let engine: String

    enum CodingKeys: String, CodingKey {
        case id
        case forSale = "for_sale"
        case brandName = "brand_name"
        case modelName = "model_name"
        case engineName = "engine_name"
        case year
        case brandID = "brand_id"
        case modelID = "model_id"
        case engineID = "engine_id"
        case transmissionID = "transmission_id"
        case placeID = "place_id"
        case name
        case imageURL = "image"
        case thumbnail
        case cityName = "city_name"
        case countryName = "country_name"
        case transmissionName = "transmission_name"
        case engineVolume = "engine_volume"
        case placeName = "place_name"
        case images, engine
    }
}

extension CarList {
    static var dummyData: CarList {
        .init(id: 49,
              forSale: 0,
              brandName: "Volkswagen",
              modelName: "Tiguan",
              engineName: "TSI",
              year: 2018,
              brandID: 49,
              modelID: 5,
              engineID: 82,
              transmissionID: 2,
              name: "Volkswagen Tiguan TSI AT 2018 Ð³.",
              placeID: "ChIJZf-0KTq_SkERpxQXi49I6WU",
              imageURL: "http://am111.05.testing.place/uploads/user/37/auto/49/fc40ee0a0dbf97b2e504b2f48438a8ba.jpg",
              thumbnail: "",
              cityName: "",
              countryName: "",
              transmissionName: TransmissionName.at,
              engineVolume: "2.0",
              placeName: "",
              images: [Images.init(id: 771,
                                   isPrimary: true,
                                   size: 81685,
                                   index: 0,
                                   url: "",
                                   thumbnailURL: "",
                                   image500: "",
                                   image100: "")],
              engine: "2.0 TSI")
        
        
//        .init(id: 49,
//              brandName: "Volkswagen",
//              modelName: "Tiguan",
//              engineName: "TSI",
//              year: 2018,
//              name: "Volkswagen Tiguan TSI AT 2018 г.",
//              imageURL: "",
//              transmissionName: TransmissionName.at)

    }
}

// MARK: - Image
struct Images: Codable {
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

enum TransmissionName: String, Codable {
    case at = "AT"
    case mt = "MT"
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
