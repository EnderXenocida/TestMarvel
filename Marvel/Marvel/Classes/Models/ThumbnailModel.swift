//
//  ThumbnailModel.swift
//  Marvel
//
//  Created by GlobalTMS on 25/02/2019.
//  Copyright © 2019 Adrián Egea. All rights reserved.
//

import Foundation

class ThumbnailModel: Codable {
    let path: String?
    let fileExtension: String?
    var url: String? {
        if let path = path, let fileExtension = fileExtension {
            return path + "." + fileExtension
        } else {
            return nil
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case path
        case fileExtension = "extension"
    }
    
    required init(from decoder: Decoder) throws
    {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        path = try values.decode(String?.self, forKey: .path)
        fileExtension = try values.decode(String?.self, forKey: .fileExtension)
    }
    
    init(_ path: String, fileExtension: String) {
        self.path = path
        self.fileExtension = fileExtension
    }
}


