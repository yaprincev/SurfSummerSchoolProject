//
//  DetailTitleTableViewCell.swift
//  SurfEducationProject
//
//  Created by Максим Япринцев on 16.08.2022.
//

import UIKit

class DetailTitleTableViewCell: UITableViewCell {

    // MARK: - Views
    
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var cartTitleLabel: UILabel!
    
    // MARK: - Properties
    
    var title = "" {
        didSet {
            cartTitleLabel.text = title
        }
    }
    
    var date = "" {
        didSet {
            dateLabel.text = date
        }
    }
    
    // MARK: - UITableViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureApperance()
        
    }

    private func configureApperance() {
        selectionStyle = .none
        cartTitleLabel.font = .systemFont(ofSize: 16)
        dateLabel.font = .systemFont(ofSize: 10)
        dateLabel.textColor = UIColor(displayP3Red: 0xB3 / 255, green: 0xB3 / 255, blue: 0xB3 / 255, alpha: 1)
    }
    
}
