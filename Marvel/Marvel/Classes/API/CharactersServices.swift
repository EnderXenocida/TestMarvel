//
//  CharactersServices.swift
//  Marvel
//
//  Created by GlobalTMS on 25/02/2019.
//  Copyright © 2019 Adrián Egea. All rights reserved.
//

import Foundation

let baseUrl = "https://gateway.marvel.com:443/"
let getCharactersEndpoint = "v1/public/characters"

class CharactersServices {
    func getCharacters(_ onSuccess: @escaping ([CharacterModel]?) -> Void, onFailure: @escaping () -> Void) {
        let url = baseUrl + getCharactersEndpoint
        APIClient().request(url, method: .get, parameters: APIAuth().authParams, onSuccess: { (response) in
            guard let serviceModel: CharactersServiceModel = response.parseTo(), let data = serviceModel.data else {
                return onFailure()
            }
            onSuccess(data.results)
        }, onFailure: onFailure)
    }
}
