//
//  ServiceModel.swift
//  Marvel
//
//  Created by GlobalTMS on 25/02/2019.
//  Copyright © 2019 Adrián Egea. All rights reserved.
//

import Foundation

class CharactersServiceDataModel: Codable {
    let results: [CharacterModel]?
    
    enum CodingKeys: String, CodingKey {
        case results
    }
    
    required init(from decoder: Decoder) throws
    {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        results = try values.decode([CharacterModel]?.self, forKey: .results)
    }
}
