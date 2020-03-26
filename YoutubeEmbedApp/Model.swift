//
//  Model.swift
//  YoutubeEmbedApp
//
//  Created by Omar Adel on 3/26/20.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import Foundation

struct Welcome: Decodable {
    let kind, etag, nextPageToken: String
    let pageInfo: PageInfo
    let items: [Item]
}

struct Item: Decodable {
    let kind, etag, id: String
    let snippet: Snippet
}

struct Snippet: Decodable {
    let publishedAt, channelID, title, snippetDescription: String
    let thumbnails: Thumbnails
    let channelTitle: String
    let tags: [String]
    let categoryID, liveBroadcastContent: String
    let localized: Localized

    enum CodingKeys: String, CodingKey {
        case publishedAt
        case channelID = "channelId"
        case title
        case snippetDescription = "description"
        case thumbnails, channelTitle, tags
        case categoryID = "categoryId"
        case liveBroadcastContent, localized
    }
}

struct Localized: Decodable {
    let title, localizedDescription: String

    enum CodingKeys: String, CodingKey {
        case title
        case localizedDescription = "description"
    }
}

struct Thumbnails: Decodable {
    let thumbnailsDefault, medium, high, standard: Default
    let maxres: Default

    enum CodingKeys: String, CodingKey {
        case thumbnailsDefault = "default"
        case medium, high, standard, maxres
    }
}

struct Default: Decodable {
    let url: String
    let width, height: Int
}

struct PageInfo: Decodable {
    let totalResults, resultsPerPage: Int
}
