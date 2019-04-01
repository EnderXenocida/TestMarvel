//
//  CharacterDetailsViewController.swift
//  Marvel
//
//  Created by GlobalTMS on 25/02/2019.
//  Copyright © 2019 Adrián Egea. All rights reserved.
//

import UIKit

// should be in Localizable strings.
let AddFavouriteText = "Add Fav"
let RemoveFavouriteText = "Remove Fav"

class CharacterDetailsViewController: UIViewController {

    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var favouriteButton: UIBarButtonItem!
    
    let viewModel: CharacterDetailsViewModelProtocol = CharacterDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    func setupCharacter(_ character: CharacterModel) {
        viewModel.setCharacter(character)
    }
    
    @IBAction func favouriteButtonAction(_ sender: Any) {
        manageFavourite()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: private methods
private extension CharacterDetailsViewController {
    func setupView() {
        if let character = viewModel.getCharacter() {
            characterImageView.loadRemoteImage(character.thumbnail?.url ?? "")
            nameLabel.text = character.name
            descriptionLabel.text = character.description
        }
        manageFavouriteButton()
    }
    
    func manageFavourite() {
        viewModel.manageFavourite()
        manageFavouriteButton()
    }
    
    func manageFavouriteButton() {
        if viewModel.isFavourite {
            favouriteButton.title = RemoveFavouriteText
        } else {
            favouriteButton.title = AddFavouriteText
        }
    }
}
