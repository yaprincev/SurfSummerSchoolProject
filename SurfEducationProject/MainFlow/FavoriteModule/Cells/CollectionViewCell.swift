//
//  CollectionViewCell.swift
//  SurfEducationProject
//
//  Created by Максим Япринцев on 17.08.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    // MARK: - Views
    
    @IBOutlet weak var favoriteImage: UIImageView!
    @IBOutlet weak var favoriteDate: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var favoriteText: UILabel!
    @IBOutlet weak var favoriteLabel: UILabel!
    // MARK: - Calculated
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.2) {
                self.contentView.transform = self.isHighlighted ? CGAffineTransform(scaleX: 0.98, y: 0.98) : .identity
            }
        }
    }
    
    // MARK: - UICollectionViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureApperance()
    }
    
    // MARK: - Properties
    
    var title: String = "" {
        didSet {
            favoriteLabel.text = title
        }
    }
    var image: UIImage? {
        didSet {
            favoriteImage.image = image
        }
    }
    
    var text: String = "" {
        didSet {
            favoriteText.text = text
        }
    }
    
    var date: String = "" {
        didSet {
            favoriteDate.text = date
        }
    }
    
    // MARK: - Actions

    @IBAction func heartButton(_ sender: Any) {
    }
    
    
}

// MARK: - Private Methods

private extension CollectionViewCell {
    func configureApperance() {
        favoriteLabel.textColor = .black
        favoriteLabel.font = .systemFont(ofSize: 16)
        
        favoriteText.textColor = .black
        favoriteText.font = .systemFont(ofSize: 12)
        
        favoriteImage.layer.cornerRadius = 12
        
        heartButton.setImage(UIImage(named: "heart-fill"), for: .normal)
        
        favoriteDate.textColor = UIColor(displayP3Red: 0xB3 / 255, green: 0xB3 / 255, blue: 0xB3 / 255, alpha: 1)
        favoriteDate.font = .systemFont(ofSize: 10)
            
    }
}
