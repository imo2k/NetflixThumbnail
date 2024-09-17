//
//  Drama.swift
//  NetflixThumbnail
//
//  Created by GO on 9/10/24.
//

import Foundation

struct DramaCollection: Decodable{
    var bigBanner: String
    var dramas: [Drama]
    
    enum CodingKeys: String, CodingKey {
        case bigBanner = "BIG_BANNER"
        case dramas = "DRAMAS"
    }
}
struct Drama: Decodable {
    var categoryTitle: String
    var posters: [String]
    
    enum CodingKeys: String, CodingKey {
        case categoryTitle = "CATEGORY_TITLE"
        case posters = "POSTERS"
    }
}
