//
//  TabBarConfigurator.swift
//  SurfEducationProject
//
//  Created by Максим Япринцев on 05.08.2022.
//

import Foundation
import UIKit

class TabBarConfigurator {
    
    // MARK: - Private property
    
    private var allTab: [TabBarModel] = [.main, .favorite, .profile]
    
    // MARK: - Internal func
    
    func configure() -> UITabBarController {
        return getTabBarController()
    }
}

private extension TabBarConfigurator {
    
    func getTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = .black
        tabBarController.tabBar.unselectedItemTintColor = .lightGray
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.viewControllers = getControllers()
        return tabBarController
    }
    
    func getControllers() -> [UIViewController] {
        var viewControllers = [UIViewController]()
        
        allTab.forEach { tab in
            let controller = getCurrentViewController(tab: tab)
            let navigation = UINavigationController(rootViewController: controller)
            let tabBarItem = UITabBarItem(title: tab.title, image: tab.image, selectedImage: tab.selectedImage)
            controller.tabBarItem = tabBarItem
            viewControllers.append(navigation)
        }
        return viewControllers
    }
    
    func getCurrentViewController(tab: TabBarModel) -> UIViewController {
        switch tab {
        case .main:
            return MainViewController()
        case .favorite:
            return FavoriteViewController()
        case .profile:
            return ProfileViewController()
        }
    }
}

