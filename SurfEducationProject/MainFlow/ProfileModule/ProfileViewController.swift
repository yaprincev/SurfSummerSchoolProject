//
//  ProfileViewController.swift
//  SurfEducationProject
//
//  Created by Максим Япринцев on 04.08.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Constants
    
    private let profileMainInfoCell: String = "\(MainInfoTableViewCell.self)"
    private let contactsCell: String = "\(PersonContactTableViewCell.self)"
    private let numberOfRows = 4
    private let mainInfoCellHeight: CGFloat = 160
    private let contactsCellHeight: CGFloat = 72
    
    // MARK: - Views
    
    @IBOutlet private weak var logoutButtonLabel: UIButton!
    @IBOutlet private weak var tableView: UITableView!
    
    //MARK: - Model
    
    private var profileModel: ProfileModel = ProfileInstance.shared.profileModel
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "Профиль"
    }
    
}



extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfRows
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: profileMainInfoCell)
            if let cell = cell as? MainInfoTableViewCell {
                cell.imageUrlInString = profileModel.avatar
                cell.quote = profileModel.about
                cell.firstName = profileModel.firstName
                cell.lastName = profileModel.lastName
            }
            return cell ?? UITableViewCell()
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: contactsCell)
            if let cell = cell as? PersonContactTableViewCell {
                cell.contactTypeLabel.text = "Country"
                cell.contactDetailLabel.text = profileModel.city
            }
            return cell ?? UITableViewCell()
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: contactsCell)
            if let cell = cell as? PersonContactTableViewCell {
                cell.contactTypeLabel.text = "Telephone"
                cell.contactDetailLabel.text = profileModel.phone
            }
            return cell ?? UITableViewCell()
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: contactsCell)
            if let cell = cell as? PersonContactTableViewCell {
                cell.contactTypeLabel.text = "Email"
                cell.contactDetailLabel.text = profileModel.email
            }
            return cell ?? UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return mainInfoCellHeight
        default:
            return contactsCellHeight
        }
    }

}
