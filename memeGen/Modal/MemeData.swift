//
//  MemeData.swift
//  memeGen
//
//  Created by user224812 on 8/8/22.
//

import Foundation


// MARK: - MemeInformation
struct MemeData: Codable {
    let success: Bool
    let data: MemeInfo
}

// MARK: - DataClass
struct MemeInfo: Codable {
    let memes: [Meme]
}

// MARK: - Meme
struct Meme: Codable {
    let id, name: String
    let url: String
    let width, height, boxCount: Int

    enum CodingKeys: String, CodingKey {
        case id, name, url, width, height
        case boxCount = "box_count"
    }
}
