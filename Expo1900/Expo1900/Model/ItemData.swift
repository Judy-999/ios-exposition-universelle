//
//  ItemData.swift
//  Expo1900
//
//  Created by 웡빙, bonf on 2022/06/13.
//

import Foundation

struct Item: Codable {
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}

