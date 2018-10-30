//
//  SearchController.swift
//  TicTalk
//
//  Created by Tien Tran on 10/27/18.
//  Copyright © 2018 Tien-Enterprise. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class SearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout, CLLocationManagerDelegate{
	var headerId = "headerId"
	var cellId = "cellId"
	var business = [Business]()
	var isSearching: Bool = false
	var locationManager = CLLocationManager()
	var currentLocation = CLLocationCoordinate2D()
	var location = CLLocation()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupCurrentLocation()
		setupNavigationBarAndSearchBar()
		let pizza = "pizza"
		let fetchBussiness = APIService()
		//		fetchBussiness.fetchBusiness(searchText: pizza, currentLocation: currentLocation)
		fetchBussiness.fetchBusiness(searchText: pizza, currentLocation: currentLocation) { (business) in
			if !self.business.isEmpty {
				self.business.removeAll()
			}
			for businesses in business.businesses {
				self.business.append(businesses)
				//					self.business = business
				//					print(business.location.displayAddress)
			}
//			print(business)
			//				print(self.business.count)
			DispatchQueue.main.async {
				self.collectionView.reloadData()
			}
		}
		collectionView?.backgroundColor = .white
		collectionView?.register(SearchCell.self, forCellWithReuseIdentifier: cellId)
		
	}
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
	}

	
	//MARK: - Current Location methods/locationManager
	fileprivate func setupCurrentLocation() {
		// Ask for Authorisation from the User.
		self.locationManager.requestAlwaysAuthorization()
		
		// For use in foreground
		self.locationManager.requestWhenInUseAuthorization()
		
		if CLLocationManager.locationServicesEnabled() {
			locationManager.delegate = self
			locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
			locationManager.startUpdatingLocation()
		}
	}
	
	fileprivate func setupNavigationBarAndSearchBar() {
		//		collectionView.register(SearchHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
		navigationItem.title = "TicTalk"
		navigationController?.navigationBar.prefersLargeTitles = true
		let searchController = UISearchController(searchResultsController: nil)
		navigationItem.searchController = searchController
		searchController.searchBar.tintColor = .white
		searchController.searchBar.delegate = self
//		searchController.searchBar.setImage(#imageLiteral(resourceName: "icons8-search-50"), for: .clear, state: .normal)
		
	
	}
	
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
		self.currentLocation = locValue
		print("latitude = \(locValue.latitude) longitude: \(locValue.longitude)")
		
	}
	
	//	override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
	//		let searchHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId, for: indexPath)
	//
	//		searchHeaderView.backgroundColor = .red
	////		searchHeaderView.addSubview(searchBar)
	//		searchHeaderView.anchor(top: searchBar.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
	//		return searchHeaderView
	//	}
	//
	
	
	//MARK: - CollectionView methods
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		return CGSize(width: view.bounds.width, height: 0)
	}
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchCell
		cell.business = self.business[indexPath.item]
		return cell
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return business.count
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		return CGSize(width: view.frame.width, height: 150)
	}
	
}




