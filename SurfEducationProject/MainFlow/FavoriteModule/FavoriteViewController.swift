//
//  FavoriteViewController.swift
//  SurfEducationProject
//
//  Created by Максим Япринцев on 04.08.2022.
//

import UIKit

class FavoriteViewController: UIViewController {

    // MARK: - Lifecyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }
}
    // MARK: - Private Methods
    
    private extension FavoriteViewController {
        
        func configureNavigationBar() {
            navigationItem.title = "Избранное"
            
            navigationItem.rightBarButtonItem  = UIBarButtonItem(image: UIImage(named: "search-button"), style: .plain, target: self, action: #selector(moveToSearch))
            navigationItem.rightBarButtonItem?.tintColor = .black
        }
        
        @objc func moveToSearch() {
            navigationController?.pushViewController(SearchViewController(), animated: true)
        }
        
        
    }



