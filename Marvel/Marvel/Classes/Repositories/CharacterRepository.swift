//
//  CharacterRepository.swift
//  Marvel
//
//  Created by GlobalTMS on 01/04/2019.
//  Copyright © 2019 Adrián Egea. All rights reserved.
//

import Foundation

class CharacterRepository {
    func getCharacters(_ onSuccess: @escaping ([CharacterModel]?) -> Void, onFailure: @escaping () -> Void) {
        CharactersServices().getCharacters(onSuccess, onFailure: onFailure)
    }
}
