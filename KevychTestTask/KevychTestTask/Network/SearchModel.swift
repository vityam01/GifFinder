//
//  SearchModel.swift
//  KevychTestTask
//
//  Created by Vitya Mandryk on 27.05.2022.
//

import Foundation



struct Empty: Codable {
    let data: [Datum]
    let pagination: Pagination
    let meta: Meta
}

// MARK: - Datum
struct Datum: Codable {
    let type: String
    let id: String
    let url: String
    let slug: String
    let bitlyGIFURL: String
    let bitlyURL: String
    let embedURL: String
    let username: String
    let source: String
    let title: String
    let rating: String
    let contentURL: String
    let sourceTLD: String
    let sourcePostURL: String
    let isSticker: Int
    let importDatetime: String
    let trendingDatetime: String
    let images: Images
    let analyticsResponsePayload: String
    let analytics: Analytics

    enum CodingKeys: String, CodingKey {
        case type
        case id
        case url
        case slug
        case bitlyGIFURL = "bitly_gif_url"
        case bitlyURL = "bitly_url"
        case embedURL = "embed_url"
        case username
        case source
        case title
        case rating
        case contentURL = "content_url"
        case sourceTLD = "source_tld"
        case sourcePostURL = "source_post_url"
        case isSticker = "is_sticker"
        case importDatetime = "import_datetime"
        case trendingDatetime = "trending_datetime"
        case images
        case analyticsResponsePayload = "analytics_response_payload"
        case analytics
    }
}

// MARK: - Analytics
struct Analytics: Codable {
    let onload, onclick, onsent: Onclick
}

// MARK: - Onclick
struct Onclick: Codable {
    let url: String
}

// MARK: - Images
struct Images: Codable {
    let original: FixedHeight
    let downsized, downsizedLarge, downsizedMedium: The480_WStill
    let downsizedSmall: DownsizedSmall
    let downsizedStill: The480_WStill
    let fixedHeight, fixedHeightDownsampled, fixedHeightSmall: FixedHeight
    let fixedHeightSmallStill, fixedHeightStill: The480_WStill
    let fixedWidth, fixedWidthDownsampled, fixedWidthSmall: FixedHeight
    let fixedWidthSmallStill, fixedWidthStill: The480_WStill
    let looping: Looping
    let originalStill: The480_WStill
    let originalMp4, preview: DownsizedSmall
    let previewGIF, previewWebp, the480WStill: The480_WStill

    enum CodingKeys: String, CodingKey {
        case original
        case downsized
        case downsizedLarge = "downsized_large"
        case downsizedMedium = "downsized_medium"
        case downsizedSmall = "downsized_small"
        case downsizedStill = "downsized_still"
        case fixedHeight = "fixed_height"
        case fixedHeightDownsampled = "fixed_height_downsampled"
        case fixedHeightSmall = "fixed_height_small"
        case fixedHeightSmallStill = "fixed_height_small_still"
        case fixedHeightStill = "fixed_height_still"
        case fixedWidth = "fixed_width"
        case fixedWidthDownsampled = "fixed_width_downsampled"
        case fixedWidthSmall = "fixed_width_small"
        case fixedWidthSmallStill = "fixed_width_small_still"
        case fixedWidthStill = "fixed_width_still"
        case looping
        case originalStill = "original_still"
        case originalMp4 = "original_mp4"
        case preview
        case previewGIF = "preview_gif"
        case previewWebp = "preview_webp"
        case the480WStill = "480w_still"
    }
}

// MARK: - The480_WStill
struct The480_WStill: Codable {
    let height: String
    let width: String
    let size: String
    let url: String
}

// MARK: - DownsizedSmall
struct DownsizedSmall: Codable {
    let height: String
    let width: String
    let mp4Size: String
    let mp4: String

    enum CodingKeys: String, CodingKey {
        case height
        case width
        case mp4Size = "mp4_size"
        case mp4
    }
}

// MARK: - FixedHeight
struct FixedHeight: Codable {
    let height: String
    let width: String
    let size: String
    let url: String
    let mp4Size: String?
    let mp4: String?
    let webpSize: String
    let webp: String
    let frames: String?
    let hash: String?

    enum CodingKeys: String, CodingKey {
        case height
        case width
        case size
        case url
        case mp4Size = "mp4_size"
        case mp4
        case webpSize = "webp_size"
        case webp
        case frames
        case hash
    }
}

// MARK: - Looping
struct Looping: Codable {
    let mp4Size: String
    let mp4: String

    enum CodingKeys: String, CodingKey {
        case mp4Size = "mp4_size"
        case mp4
    }
}

// MARK: - Meta
struct Meta: Codable {
    let status: Int
    let msg: String
    let responseID: String

    enum CodingKeys: String, CodingKey {
        case status
        case msg
        case responseID = "response_id"
    }
}

// MARK: - Pagination
struct Pagination: Codable {
    let totalCount: Int
    let count: Int
    let offset: Int

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case count
        case offset
    }
}
