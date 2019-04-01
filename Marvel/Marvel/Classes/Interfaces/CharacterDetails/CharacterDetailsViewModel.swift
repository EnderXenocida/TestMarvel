//
//  CharacterDetailsViewModel.swift
//  Marvel
//
//  Created by GlobalTMS on 25/02/2019.
//  Copyright © 2019 Adrián Egea. All rights reserved.
//

import Foundation

class CharacterDetailsViewModel: CharacterDetailsViewModelProtocol {    
    var character: CharacterModel?
    var isFavourite: Bool {
        guard let id = character?.id else {
            return false
        }
        return FavouritesHandler.shared.isFavourite(id)
    }
    
    func setCharacter(_ character: CharacterModel) {
        self.character = character
    }
    
    func getCharacter() -> CharacterModel? {
        return self.character
    }
    
    func addFavourite() {
        if let id = character?.id {
            FavouritesHandler.shared.addFavourite(id)
        }
    }
    
    func removeFavourite() {
        if let id = character?.id {
            FavouritesHandler.shared.removeFavourite(id)
        }
    }
    
    func manageFavourite() {
        if isFavourite {
            removeFavourite()
        } else {
            addFavourite()
        }
    }
}
