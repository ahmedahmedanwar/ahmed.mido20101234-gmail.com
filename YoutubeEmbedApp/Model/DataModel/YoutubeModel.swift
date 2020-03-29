// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let youtubeModel = try? newJSONDecoder().decode(YoutubeModel.self, from: jsonData)

import Foundation

// MARK: - YoutubeModel
struct YoutubeModel: Codable {
    let kind, etag, nextPageToken: String
    let pageInfo: PageInfo
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let kind, etag, id: String
    let snippet: Snippet
}

// MARK: - Snippet
struct Snippet: Codable {
    let publishedAt, channelID, title, snippetDescription: String
    let thumbnails: Thumbnails
    let channelTitle: String
    let tags: [String]?
    let categoryID, liveBroadcastContent: String
    let defaultLanguage: String?
    let localized: Localized
    let defaultAudioLanguage: String?

    enum CodingKeys: String, CodingKey {
        case publishedAt
        case channelID = "channelId"
        case title
        case snippetDescription = "description"
        case thumbnails, channelTitle, tags
        case categoryID = "categoryId"
        case liveBroadcastContent, defaultLanguage, localized, defaultAudioLanguage
    }
}

// MARK: - Localized
struct Localized: Codable {
    let title, localizedDescription: String

    enum CodingKeys: String, CodingKey {
        case title
        case localizedDescription = "description"
    }
}

// MARK: - Thumbnails
struct Thumbnails: Codable {
    let thumbnailsDefault, medium, high, standard: Default
    let maxres: Default?

    enum CodingKeys: String, CodingKey {
        case thumbnailsDefault = "default"
        case medium, high, standard, maxres
    }
}

// MARK: - Default
struct Default: Codable {
    let url: String
    let width, height: Int
}

// MARK: - PageInfo
struct PageInfo: Codable {
    let totalResults, resultsPerPage: Int
}

