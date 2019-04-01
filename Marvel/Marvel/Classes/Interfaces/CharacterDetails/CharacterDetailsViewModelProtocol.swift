//
//  CharacterDetailsViewModelProtocol.swift
//  Marvel
//
//  Created by GlobalTMS on 25/02/2019.
//  Copyright © 2019 Adrián Egea. All rights reserved.
//

import Foundation

protocol CharacterDetailsViewModelProtocol {
    var character: CharacterModel? { get set }
    var isFavourite: Bool { get }
    
    func setCharacter(_ character: CharacterModel)
    func getCharacter() -> CharacterModel?
    func addFavourite()
    func removeFavourite()
    func manageFavourite()
}
