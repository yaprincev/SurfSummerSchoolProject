//
//  MainViewController.swift
//  SurfEducationProject
//
//  Created by Максим Япринцев on 04.08.2022.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Constants
    
    private enum Constants {
        static let horisontalInset: CGFloat = 16
        static let spaceBetweenElements: CGFloat = 7
        static let spaceBetweenRows: CGFloat = 8
    }
    
    // MARK: - Private Properties
    
    private let model: MainModel = .init()
    
    // MARK: - Views
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Lifecyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureApperance()
        configureModel()
        model.getPosts()
    }
}

// MARK: - Private Methods

private extension MainViewController {
    func configureApperance() {
        navigationItem.title = "Главная"
        collectionView.register(UINib(nibName: "\(MainCollectionViewCell.self)", bundle: .main), forCellWithReuseIdentifier: "\(MainCollectionViewCell.self)")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset = .init(top: 10, left: 16, bottom: 10, right: 16)
    }
    
    func configureModel() {
        model.didItemUpdated = { [weak self] in
            self?.collectionView.reloadData()
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
            cell.title = item.title
            cell.isFavorite = item.isFavorite
            cell.image = item.image
            cell.didFavoritesTapped = { [weak self] in
                self?.model.items[indexPath.row].isFavorite.toggle()
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
}
