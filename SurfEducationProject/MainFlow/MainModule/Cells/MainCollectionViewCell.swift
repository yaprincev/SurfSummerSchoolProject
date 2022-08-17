//
//  MainCollectionViewCell.swift
//  SurfEducationProject
//
//  Created by Максим Япринцев on 09.08.2022.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {

    // MARK: - Constants
    
    private enum Constants {
        static let fillHeart = UIImage(named: "heart-fill")
        static let heartImage = UIImage(named: "heart")
    }
    
    // MARK: - Views
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var favoriteButton: UIButton!
    
    // MARK: - Events
    
    var didFavoritesTapped: (() -> Void)?
    
    // MARK: - Calculated
    
    var buttonImage: UIImage? {
        return isFavorite ? Constants.fillHeart : Constants.heartImage
    }

    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.2) {
                self.contentView.transform = self.isHighlighted ? CGAffineTransform(scaleX: 0.98, y: 0.98) : .identity
            }
        }
    }
    
    // MARK: - Properties
    
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    var isFavorite: Bool = false {
        didSet {
            favoriteButton.setImage(buttonImage, for: .normal)
        }
    }
    
    // MARK: - Actions
    
    @IBAction private func favoriteAction(_ sender: Any) {
        didFavoritesTapped?()
        isFavorite.toggle()
    }
    
    // MARK: - UICollectionViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureApperance()
    }
    
}

    // MARK: - Private Methods
    
private extension MainCollectionViewCell {
    func configureApperance() {
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 12)
            
        imageView.layer.cornerRadius = 12
            
        favoriteButton.tintColor = .white
            
    }
}

