//
//  MainViewController.swift
//  SurfEducationProject
//
//  Created by Максим Япринцев on 04.08.2022.
//

import UIKit
import RealmSwift

class MainViewController: UIViewController {
    
    // MARK: - Realm
    
    let realm = try! Realm()
    
    // MARK: - Constants
    
    private enum Constants {
        static let horisontalInset: CGFloat = 16
        static let spaceBetweenElements: CGFloat = 7
        static let spaceBetweenRows: CGFloat = 8
    }
    
    // MARK: - Private Properties
    private var isAddedToFavorite: Bool = false
    private let model: MainModel = .init()
    private var modelItems: [MainModel] = []
    
    // MARK: - Views
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureApperance()
        configureModel()
        model.loadPosts()
        try! realm.write {
            realm.deleteAll()
        }
        
        let credentials = AuthRequestModel(phone: "+79876543219", password: "qwerty")
        AuthService().performLoginRequestAndSaveToken(credentials: credentials) { result in
            switch result {
            case .success(let response):

                print(response)
            case .failure(let error):
                print(error)
            }
        }
//        PicturesService().loadPictures { result in
//            print(result)
//        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
        checkFavoriteVC()
       
    }
}

// MARK: - Private Methods

private extension MainViewController {
    func configureApperance() {
        collectionView.register(UINib(nibName: "\(MainCollectionViewCell.self)", bundle: .main), forCellWithReuseIdentifier: "\(MainCollectionViewCell.self)")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset = .init(top: 10, left: 16, bottom: 10, right: 16)
    }
    
    func configureModel() {
        model.didItemUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    func configureNavigationBar() {
        navigationItem.title = "Главная"
        
        navigationItem.rightBarButtonItem  = UIBarButtonItem(image: UIImage(named: "search-button"), style: .plain, target: self, action: #selector(moveToSearch))
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    @objc func moveToSearch() {
        navigationController?.pushViewController(SearchViewController(), animated: true)
    }
    
    func checkFavoriteVC() {
        let items = realm.objects(FavoriteModel.self)
        
        if (!items.isEmpty && isAddedToFavorite) {
            model.loadPosts()
            for i in 0...(model.items.count - 1) {
                for j in 0...(items.count - 1) {
                    if model.items[i].title == items[j].title {
                        model.items[i].isFavorite = true
                    }
                }
            }
        } else if isAddedToFavorite {
            for i in 0...(model.items.count - 1) {
               
                model.items[i].isFavorite = false
                    
            }
        }
    }
    
        //else {
//            for i in 0...(model.items.count - 1) {
//                model.items[i].isFavorite = false
//
//            }
       // }
        
    
    func loadModelAndAddToArray() {
        model.loadPosts()
        
            modelItems.append(model)
        
        
    }
    // MARK: - Database methods
    
    func addModelToFavoriteDataBase(currentItem: DetailItemModel, currentCell: MainCollectionViewCell) {
        let favoriteModel = FavoriteModel()
        isAddedToFavorite = true
        favoriteModel.imageUrlInString = currentItem.imageUrlInString
        favoriteModel.dateCreation = currentItem.dateCreation
        favoriteModel.title = currentItem.title
        favoriteModel.content = currentItem.content
        try! realm.write {
            realm.add(favoriteModel)
        }
        
    }
    
}

// MARK: - UIcollection

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(MainCollectionViewCell.self)", for: indexPath)
        if let cell = cell as? MainCollectionViewCell {
            
            let item = model.items[indexPath.row]
            
            cell.isFavorite = item.isFavorite
            cell.imageUrlInString = item.imageUrlInString
            cell.title = item.title
            cell.didFavoritesTapped = { [weak self] in
                self?.addModelToFavoriteDataBase(currentItem: item, currentCell: cell)
            }
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (view.frame.width - Constants.horisontalInset * 2 - Constants.spaceBetweenElements ) / 2
        return CGSize(width: itemWidth, height: 1.46 * itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.spaceBetweenRows
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.spaceBetweenElements
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.model = model.items[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
