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
	
	
	var searchBar: UISearchBar = {
		let sb = UISearchBar()
		sb.placeholder = "Search"
		sb.frame = CGRect(x: 0, y: 0, width: Int(UIScreen.main.bounds.width), height: 40)
		
		sb.searchBarStyle = .minimal
		return sb
	}()
	
	
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
		view.addSubview(searchBar)
		searchBar.delegate = self
		searchBar.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 40)
	}
	
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
			print(business)
			//				print(self.business.count)
			DispatchQueue.main.async {
				self.collectionView.reloadData()
			}
		}
		collectionView?.backgroundColor = .white
		collectionView?.register(SearchCell.self, forCellWithReuseIdentifier: cellId)
		
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
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		return CGSize(width: view.bounds.width, height: 40)
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




