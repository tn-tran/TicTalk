//
//  SearchCell.swift
//  TicTalk
//
//  Created by Tien Tran on 10/27/18.
//  Copyright © 2018 Tien-Enterprise. All rights reserved.
//

import Foundation
import UIKit
class SearchCell: UICollectionViewCell {
	var business: Business! {
		didSet {
			nameLabel.text = business.name
			guard let imageUrl = URL(string: business.imageURL) else { return }
			searchResultImage.loadImage(url: imageUrl)
			
			for text in business.location.displayAddress {
				locationlabel.text = text
			}
			
		}
	}
	var searchResultImage: UIImageView = {
		var imageView = UIImageView()
		
		
		imageView.clipsToBounds = true
		imageView.layer.cornerRadius = 2.0
		imageView.contentMode = .scaleAspectFill
		imageView.layer.borderWidth = 1
		imageView.layer.borderColor = UIColor.yellow.cgColor
		return imageView
	}()
	var nameLabel: UILabel = {
		let label = UILabel()
		label.text = "Name"
		label.font = UIFont.systemFont(ofSize: 16)
		return label
	}()
	var locationlabel: UILabel = {
		let label = UILabel()
		label.text = "Location"
		label.textColor = .lightGray
		label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(searchResultImage)
		addSubview(nameLabel)
		addSubview(locationlabel)
		searchResultImage.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 4, paddingLeft: 12, paddingBottom: 0, paddingRight: 0, width: 40, height: 40)
		nameLabel.anchor(top: searchResultImage.topAnchor, left: searchResultImage.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
		locationlabel.anchor(top: nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nil, paddingTop: 4, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
