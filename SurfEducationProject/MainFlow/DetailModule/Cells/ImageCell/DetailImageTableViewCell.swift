//
//  DetailImageTableViewCell.swift
//  SurfEducationProject
//
//  Created by Максим Япринцев on 15.08.2022.
//

import UIKit

class DetailImageTableViewCell: UITableViewCell {

    // MARK: - Views
    
    @IBOutlet weak var cartImageView: UIImageView!
    
    
    // MARK: - Properties
    
    var imageUrlInString: String = "" {
        didSet {
            guard let url = URL(string: imageUrlInString) else {
                return
            }
            cartImageView?.loadImage(from: url)
        }
    }
    
    // MARK: - UITableViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        cartImageView.layer.cornerRadius = 12
        cartImageView.contentMode = .scaleAspectFill
    }

}
