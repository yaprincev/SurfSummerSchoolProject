//
//  FavoriteViewController.swift
//  SurfEducationProject
//
//  Created by Максим Япринцев on 17.08.2022.
//

import UIKit
import RealmSwift


class FavoriteViewController: UIViewController {

    
  
    // MARK: - Realm
    
    let realm = try! Realm()
    
    
    
    // MARK: - Constants
    
    private enum Constants {
        static let cellHeight: CGFloat = 460
    }
    
    // MARK: - Views
    
    @IBOutlet private weak var favoriteCollection: UICollectionView!
    
    // MARK: - Private Properties
        
    private let model: MainModel = .init()
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureApperance()
        configureModel()
        model.loadPosts()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureNavigationBar()
        DispatchQueue.main.async {
            self.favoriteCollection.reloadData()
        }
        
    }
}

// MARK: - Private Methods

private extension FavoriteViewController {
    
    func configureApperance() {
        favoriteCollection.register(UINib(nibName: "\(CollectionViewCell.self)", bundle: .main), forCellWithReuseIdentifier: "\(CollectionViewCell.self)")
        favoriteCollection.dataSource = self
        favoriteCollection.delegate = self
        
    }
    
    func configureModel() { // todel
        model.didItemUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.favoriteCollection.reloadData()
            }
            
        }
    }
    
    func configureNavigationBar() {
        navigationItem.title = "Избранное"
        
        navigationItem.rightBarButtonItem  = UIBarButtonItem(image: UIImage(named: "search-button"), style: .plain, target: self, action: #selector(moveToSearch))
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    @objc func moveToSearch() {
        navigationController?.pushViewController(SearchViewController(), animated: true)
    }
    
    
    
    func deleteModelFromFavoriteDataBase(item: FavoriteModel, index: Int) {
        
    
        let item = realm.objects(FavoriteModel.self)[index]
    
        try! realm.write {
            realm.delete(item)
        }
        favoriteCollection.reloadData()
        
    }
}

// MARK: - UIcollection

extension FavoriteViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let items = realm.objects(FavoriteModel.self)
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CollectionViewCell.self)", for: indexPath)
        if let cell = cell as? CollectionViewCell {
            let item = realm.objects(FavoriteModel.self)[indexPath.row]
            cell.title = item.title
            cell.imageUrlInString = item.imageUrlInString
            cell.text = item.content
            cell.date = item.dateCreation

            cell.didFavoritesTapped = { [weak self] in
                self?.deleteModelFromFavoriteDataBase(item: item, index: indexPath.row )
                
            }
        }
        return cell
   }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          return CGSize(width: UIScreen.main.bounds.width, height: Constants.cellHeight)
      }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainVC = MainViewController()
        let item = realm.objects(FavoriteModel.self)[indexPath.row]
        let vc = DetailViewController()
        let index = mainVC.giveCurrentItemID(title: item.title)
        vc.model = model.items[index]
    
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
