//
//  CarPostResponse.swift
//  AvtomobilkaApp
//
//  Created by Михаил on 02.08.2023.
//
//
import Foundation

// MARK: - CarPostResponse
struct CarPostResponse: Codable {
    var posts: [Post]?
    var user: User
}
// MARK: - Post
struct Post: Codable, Identifiable {
    var id: Int
    var text: String
    var likeCount: Int
    var createdAt: String
    var commentCount: Int
    var postImage: String?
    var author: PostUser
    var correctDate: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case text
        case likeCount = "like_count"
        case createdAt = "created_at"
        case commentCount = "comment_count"
        case postImage = "img"
        case author
        case correctDate
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        text = try container.decode(String.self, forKey: .text)
        likeCount = try container.decode(Int.self, forKey: .likeCount)
        commentCount = try container.decode(Int.self, forKey: .commentCount)
        postImage = try container.decodeIfPresent(String.self, forKey: .postImage)
        author = try container.decode(PostUser.self, forKey: .author)
        createdAt = try container.decode(String.self, forKey: .createdAt)
        correctDate = DateNormalFormat.shared.normalizedDate(createdAt)
    }
}
// MARK: - PostUser
struct PostUser: Codable {
    var id: Int
    var username: String
    var avatar: Avatar
    var autoCount: Int
    var mainAutoName: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case username
        case avatar
        case autoCount = "auto_count"
        case mainAutoName = "main_auto_name"
    }
}
