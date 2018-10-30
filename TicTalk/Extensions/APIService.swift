//
//  APIService.swift
//  TicTalk
//
//  Created by Tien Tran on 10/29/18.
//  Copyright © 2018 Tien-Enterprise. All rights reserved.
//

import Foundation
import UIKit
import MapKit
class APIService {
	let yelpAPIKey = "NNbUTt1qOCnGKRXexC6I9hkJApAWWUrQZSGxZQkh8HI3MOxVs4uYjlhK4-tAMEfHXaQTZGZFckWwLuhf87IadVA2sWZ1edwBPX6VOd0ASr-kt7P5Jn2PtshEjXuIW3Yx"

	
	func fetchBusiness(searchText: String, currentLocation: CLLocationCoordinate2D, completionHandler: @escaping (SearchResult) -> ()) {
		//		var location = "garden+grove+ca"
		//		let stringUrl =  "https://api.yelp.com/v3/businesses/search?term=\(searchText)&location=\(location)"
		let stringUrl =  "https://api.yelp.com/v3/businesses/search?term=\(searchText)&latitude=\(currentLocation.latitude)&longitude=\(currentLocation.longitude)"
		print(stringUrl)
		guard let url = URL(string: stringUrl) else { return }
		
		
		var request = URLRequest(url: url)
		request.httpMethod = "GET"
		request.setValue(("Bearer " + yelpAPIKey), forHTTPHeaderField: "Authorization")
		
		URLSession.shared.dataTask(with: request) { (data, response, error) in
			if let err = error {
				print("Failed to fetch get response", err)
				return
			}
			guard let data = data else { return }
			
			do {
				let businesses = try JSONDecoder().decode(SearchResult.self, from: data)
				completionHandler(businesses)
//				if !self.business.isEmpty {
//					self.business.removeAll()
//				}
//				for business in businesses.businesses {
//					self.business.append(business)
//					//					self.business = business
//					//					print(business.location.displayAddress)
//				}
//				print(businesses.businesses)
//				//				print(self.business.count)
//				DispatchQueue.main.async {
//					self.collectionView.reloadData()
//				}
				
				
			} catch let err {
				print(err)
			}
			}.resume()
		
	}
}
