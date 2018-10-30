//
//  SearchController+UISearchBar.swift
//  TicTalk
//
//  Created by Tien Tran on 10/29/18.
//  Copyright © 2018 Tien-Enterprise. All rights reserved.
//

import Foundation
import UIKit
extension SearchController: UISearchBarDelegate {
	
	func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
		isSearching = true
		
	}
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		isSearching = true
//		print(searchText)
//		fetchBusiness(searchText: searchText)
	}
	func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
		isSearching = false
	}
	func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
		isSearching = false
	}
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		isSearching = false
		guard let searchText = searchBar.text else  {  return }
//		fetchBusiness(searchText: searchText)
	}
	
}
