//
//  FavoriteViewController.swift
//  SurfEducationProject
//
//  Created by Максим Япринцев on 17.08.2022.
//

import UIKit
class FavoriteViewController: UIViewController {
    
    // MARK: - Constants
    
    private enum Constants {
        static let cellHeight: CGFloat = 460
    }
    
    // MARK: - Views
    
    @IBOutlet weak var favoriteCollection: UICollectionView!
    
    // MARK: - Private Properties //todel
    
    private let model: MainModel = .init()
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureApperance()
        configureModel()
        
        model.getPosts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureNavigationBar()
    }
}

// MARK: - Private Methods

private extension FavoriteViewController {
    
    func configureApperance() {
        favoriteCollection.register(UINib(nibName: "\(CollectionViewCell.self)", bundle: .main), forCellWithReuseIdentifier: "\(CollectionViewCell.self)")
        favoriteCollection.dataSource = self
        favoriteCollection.delegate = self
        favoriteCollection.contentInset = .init(top: 16, left: 16, bottom: 24, right: 16)
    }
    
    func configureModel() { // todel
        model.didItemUpdated = { [weak self] in
            self?.favoriteCollection.reloadData()
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
}

// MARK: - UIcollection

extension FavoriteViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CollectionViewCell.self)", for: indexPath)
        if let cell = cell as? CollectionViewCell {
            let item = model.items[indexPath.row]
            cell.title = item.title
            cell.image = item.image
            cell.text = item.content
            cell.date = item.dataCreation
        }
        return cell
   }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          return CGSize(width: UIScreen.main.bounds.width, height: Constants.cellHeight)
      }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let itemWidth = (view.frame.width - Constants.horisontalInset * 2 - Constants.spaceBetweenElements ) / 2
//        return CGSize(width: itemWidth, height: 1.46 * itemWidth)
//    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return Constants.spaceBetweenElements
//    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.model = model.items[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
