//
//  HomeViewModelProtocol.swift
//  Marvel
//
//  Created by GlobalTMS on 25/02/2019.
//  Copyright © 2019 Adrián Egea. All rights reserved.
//

import Foundation

protocol HomeViewModelProtocol {
    var reloadDataClosure: () -> Void { get set }
    var characters: [CharacterModel] { get set }
    
    func getCharacters(onFailure: @escaping () -> Void)
    func getCharactersCount() -> Int
    func getCharacter(_ row: Int) -> CharacterModel
    func setReloadDataClosure(_ closure: @escaping () -> Void)
}
