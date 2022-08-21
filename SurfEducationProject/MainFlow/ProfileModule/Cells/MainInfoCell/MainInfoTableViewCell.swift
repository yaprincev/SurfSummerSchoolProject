//
//  MainInfoTableViewCell.swift
//  SurfEducationProject
//
//  Created by Максим Япринцев on 20.08.2022.
//

import UIKit

class MainInfoTableViewCell: UITableViewCell {

    // MARK: - Views
    
    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var profileFirstNameLabel: UILabel!
    @IBOutlet private weak var profileLastNameLabel: UILabel!
    @IBOutlet private weak var profileQuoteLabel: UILabel!
    
    // MARK: - Properties
    
    var imageUrlInString: String = "" {
        didSet {
            guard let url = URL(string: imageUrlInString) else {
                return
            }
            profileImageView.loadImage(from: url)
        }
    }
    var firstName: String = "" {
        didSet {
            profileFirstNameLabel.text = firstName
        }
    }
    
    var lastName: String = "" {
        didSet {
            profileLastNameLabel.text = lastName
        }
    }
    
    var quote: String = "" {
        didSet {
            profileQuoteLabel.text = quote
        }
    }
    
    // MARK: - UITableViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        profileImageView.layer.cornerRadius = 12
    }

 
    
    
}
