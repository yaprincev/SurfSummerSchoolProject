//
//  PersonContactTableViewCell.swift
//  SurfEducationProject
//
//  Created by Максим Япринцев on 21.08.2022.
//

import UIKit

class PersonContactTableViewCell: UITableViewCell {

    // MARK: - Views
    
    @IBOutlet weak var contactDetailLabel: UILabel!
    @IBOutlet weak var contactTypeLabel: UILabel!
    
    
    // MARK: - UITableViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
    }

    
}
