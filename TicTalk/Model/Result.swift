//
//  Result.swift
//  TicTalk
//
//  Created by Tien Tran on 10/28/18.
//  Copyright © 2018 Tien-Enterprise. All rights reserved.
//

import Foundation
import UIKit
struct SearchResult: Codable {
	let total: Int
	let businesses: [Business]

}
struct Business: Codable  {
	let name: String
	let imageURL: String
	let url: String?
	let review_count: Int?
	let location: Location
	
	private enum CodingKeys: String, CodingKey {
		case name
		case imageURL = "image_url"
		case url
		case review_count = "review_count"
		case location
	}
}

struct Location: Codable {
	let address1: String?
	let address3: String?
	let city, zipCode: String
	let country: Country
	let state: State
	let displayAddress: [String]
	
	enum CodingKeys: String, CodingKey {
		case address1, address3, city
		case zipCode = "zip_code"
		case country, state
		case displayAddress = "display_address"
	}
}

enum State: String, Codable {
	case ca = "CA"
	case ny = "NY"
}
enum Country: String, Codable {
	case us = "US"
}
