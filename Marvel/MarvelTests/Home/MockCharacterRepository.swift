//
//  MockCharacterRepository.swift
//  MarvelTests
//
//  Created by GlobalTMS on 01/04/2019.
//  Copyright © 2019 Adrián Egea. All rights reserved.
//

import Foundation
@testable import Marvel

class MockCharacterRepository: CharacterRepository {
    var characters = [CharacterModel]()
    
    func getCharacters(_ onSuccess: @escaping ([CharacterModel]) -> Void) {
        characters.append(CharacterModel(1011334, name: "3-D Man", description: "", thumbnail: ThumbnailModel("http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", fileExtension: "jpg")))
        characters.append(CharacterModel(1017100, name: "A-Bomb (HAS)", description: "Rick Jones has been Hulk\'s best bud since day one, but now he\'s more than a friend...he\'s a teammate! Transformed by a Gamma energy explosion, A-Bomb\'s thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction! ", thumbnail: ThumbnailModel("http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16", fileExtension: "jpg")))
        
        onSuccess(characters)
    }
}
