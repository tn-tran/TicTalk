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
		let favoritesController = UINavigationController(rootViewController: ViewController())
		favoritesController.title = "Favorites"
		let usersController = UINavigationController(rootViewController: ViewController())
		usersController.title = "Me"
		
		
		viewControllers =  [searchController, usersController, favoritesController ]
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		view.backgroundColor = .white
		setupTabBar()
	}
}



