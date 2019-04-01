//
//  CharacterModel.swift
//  Marvel
//
//  Created by GlobalTMS on 25/02/2019.
//  Copyright © 2019 Adrián Egea. All rights reserved.
//

import Foundation

class CharacterModel: Codable {
    let id: Int?
    let name: String?
    let description: String?
    let thumbnail: ThumbnailModel?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case thumbnail
    }
    
    required init(from decoder: Decoder) throws
    {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int?.self, forKey: .id)
        name = try values.decode(String?.self, forKey: .name)
        description = try values.decode(String?.self, forKey: .description)
        thumbnail = try values.decode(ThumbnailModel?.self, forKey: .thumbnail)
    }
    
    init(_ id: Int, name: String, description: String, thumbnail: ThumbnailModel) {
        self.id = id
        self.name = name
        self.description = description
        self.thumbnail = thumbnail
    }
    
}
