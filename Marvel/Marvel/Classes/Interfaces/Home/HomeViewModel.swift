//
//  HomeViewModel.swift
//  Marvel
//
//  Created by GlobalTMS on 25/02/2019.
//  Copyright © 2019 Adrián Egea. All rights reserved.
//

import Foundation

class HomeViewModel: HomeViewModelProtocol {
    var reloadDataClosure: () -> Void = {}
    var characters = [CharacterModel]() {
        didSet {
            reloadDataClosure()
        }
    }
    
    func getCharacters(onFailure: @escaping () -> Void) {
        CharacterRepository().getCharacters({ [weak self] (characters) in
            guard let characters = characters else {
                return onFailure()
            }
            self?.characters = characters
        }, onFailure: onFailure)
    }
    
    func getCharactersCount() -> Int {
        return characters.count
    }
    
    func getCharacter(_ row: Int) -> CharacterModel {
        return characters[row]
    }
    
    func setReloadDataClosure(_ closure: @escaping () -> Void) {
        reloadDataClosure = closure
    }
}
