//
//  HomeViewController.swift
//  Marvel
//
//  Created by GlobalTMS on 25/02/2019.
//  Copyright © 2019 Adrián Egea. All rights reserved.
//

import UIKit

let homeCellIdentifier = "HomeCollectionViewCell"
let HomeToDetailsSegue = "HomeToDetailsSegue"

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let viewModel: HomeViewModelProtocol = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewModel.setReloadDataClosure({ [weak self] in
            self?.reloadData()
        })
        setupCollectionView()
        getCharacters()
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let character = sender as? CharacterModel, let vc = segue.destination as? CharacterDetailsViewController {
            vc.setupCharacter(character)
        }
    }
    

}

// MARK: private methods
private extension HomeViewController {
    func setupCollectionView() {
        collectionView.register(UINib(nibName: homeCellIdentifier, bundle: nil), forCellWithReuseIdentifier: homeCellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func getCharacters() {
        viewModel.getCharacters {
            // MANAGE error
        }
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
}

// MARK: UICollectionView datasource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getCharactersCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: homeCellIdentifier, for: indexPath)
        
        if let homeCell = cell as? HomeCollectionViewCell {
            let character = viewModel.getCharacter(indexPath.row)
            homeCell.setupCell(HomeCellStruct(image: character.thumbnail?.url ?? "", name: character.name))
        }
        
        return cell
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {        
        var width: CGFloat
        
        if UIDevice.current.isPad {
            if UIDevice.current.isPortrait {
                width = UIScreen.main.bounds.width / 4 - 10
            } else {
                width = UIScreen.main.bounds.width / 6 - 10
            }
        } else {
            width = UIScreen.main.bounds.width / 3 - 10
        }
        return CGSize(width: width, height: width + 40)
    }
}

// MARK: UICollectionView delegate
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: HomeToDetailsSegue, sender: viewModel.getCharacter(indexPath.row))
    }
}
