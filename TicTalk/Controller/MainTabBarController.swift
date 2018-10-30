//
//  MainTabBarController.swift
//  TicTalk
//
//  Created by Tien Tran on 10/27/18.
//  Copyright © 2018 Tien-Enterprise. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
	fileprivate func setupTabBar() {
		
		let searchController = UINavigationController(rootViewController: SearchController(collectionViewLayout: UICollectionViewFlowLayout()))
		searchController.title = "Search"
		searchController.tabBarItem.image = #imageLiteral(resourceName: "icons8-search-50").withRenderingMode(.alwaysOriginal)
		let favoritesController = UINavigationController(rootViewController: ViewController())
		favoritesController.title = "Favorites"
		favoritesController.tabBarItem.image = #imageLiteral(resourceName: "icons8-align-right-50").withRenderingMode(.alwaysOriginal)
		let usersController = UINavigationController(rootViewController: ViewController())
		usersController.title = "Me"
		usersController.tabBarItem.image = #imageLiteral(resourceName: "icons8-customer-50").withRenderingMode(.alwaysOriginal)
		
		
		
		viewControllers =  [searchController, usersController, favoritesController ]
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		view.backgroundColor = .white
		setupTabBar()
	}
}



