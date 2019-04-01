//
//  FavouritesHandler.swift
//  Marvel
//
//  Created by GlobalTMS on 26/02/2019.
//  Copyright © 2019 Adrián Egea. All rights reserved.
//

import Foundation

let favouritesKey = "favourites"

class FavouritesHandler {
    static let shared = FavouritesHandler()
    
    var favourites = [Int]() {
        didSet {
            UserDefaults().set(favourites, forKey: favouritesKey)
        }
    }
    
    init() {
        if let defaultsFAvourites = UserDefaults().value(forKey: favouritesKey) as? [Int] {
            favourites = defaultsFAvourites
        }
    }
    
    func addFavourite(_ favourite: Int) {
        if !isFavourite(favourite) {
            favourites.append(favourite)
        }
    }
    
    func removeFavourite(_ favourite: Int) {
        if let index = favourites.firstIndex(of: favourite) {
            favourites.remove(at: index)
        }        
    }
    
    func isFavourite(_ id: Int) -> Bool {
        return favourites.contains(id)
    }
}
