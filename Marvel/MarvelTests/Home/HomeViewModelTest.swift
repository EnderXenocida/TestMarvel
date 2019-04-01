//
//  HomeViewModelTest.swift
//  MarvelTests
//
//  Created by GlobalTMS on 26/02/2019.
//  Copyright © 2019 Adrián Egea. All rights reserved.
//

import XCTest

@testable import Marvel

class HomeViewModelTest: XCTestCase {
    
    var viewModel: HomeViewModelProtocol = HomeViewModel()
    let mockCharacterRepository = MockCharacterRepository()
    
    override func setUp() {
        mockCharacterRepository.getCharacters { (characters) in
            self.viewModel.characters = characters
        }
    }
    
    func testGetCharacters() {
        XCTAssertNotNil(viewModel.characters)
    }
    
    func testGetCharacterCount() {
        let characterCount = viewModel.getCharactersCount()
        XCTAssertTrue(characterCount > 0)
    }
    
    func testGetCharacter() {
        let character = viewModel.getCharacter(0)
        XCTAssertNotNil(character)
    }
}

