//
//  CharactersServiceModel.swift
//  Marvel
//
//  Created by GlobalTMS on 25/02/2019.
//  Copyright © 2019 Adrián Egea. All rights reserved.
//

import Foundation

class CharactersServiceModel: Codable {
    let code: Int?
    let data: CharactersServiceDataModel?
    
    enum CodingKeys: String, CodingKey {
        case code
        case data
    }
    
    required init(from decoder: Decoder) throws
    {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decode(Int?.self, forKey: .code)
        data = try values.decode(CharactersServiceDataModel?.self, forKey: .data)
    }
}
