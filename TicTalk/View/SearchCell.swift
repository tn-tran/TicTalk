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
			guard let businessCount = business.review_count else { return }
			reviewLabel.text = String(businessCount) + " Reviews"
			
			switch business.rating {
			case 5.0:
				reviewsImageView.image = #imageLiteral(resourceName: "small_5").withRenderingMode(.alwaysOriginal)
			case 4.5:
				reviewsImageView.image = #imageLiteral(resourceName: "small_4_half").withRenderingMode(.alwaysOriginal)
			case 4.0:
				reviewsImageView.image = #imageLiteral(resourceName: "small_4").withRenderingMode(.alwaysOriginal)
			case 3.5:
				reviewsImageView.image = #imageLiteral(resourceName: "small_3_half").withRenderingMode(.alwaysOriginal)
			case 3.0:
				reviewsImageView.image = #imageLiteral(resourceName: "small_3").withRenderingMode(.alwaysOriginal)
			case 2.5:
				reviewsImageView.image = #imageLiteral(resourceName: "small_2_half").withRenderingMode(.alwaysOriginal)
			case 2.0:
				reviewsImageView.image = #imageLiteral(resourceName: "small_2").withRenderingMode(.alwaysOriginal)
			case 1.5:
				reviewsImageView.image = #imageLiteral(resourceName: "small_1_half").withRenderingMode(.alwaysOriginal)
			case 1.0:
				reviewsImageView.image = #imageLiteral(resourceName: "small_1").withRenderingMode(.alwaysOriginal)
			default:
				reviewsImageView.image = #imageLiteral(resourceName: "small_0").withRenderingMode(.alwaysOriginal)
			}
		}
		
	}
	var searchResultImage: UIImageView = {
		var imageView = UIImageView()
		imageView.clipsToBounds = true
		imageView.layer.cornerRadius = 2.0
		imageView.contentMode = .scaleAspectFill
		imageView.layer.borderWidth = 1
		imageView.layer.borderColor = UIColor.black.cgColor
		return imageView
	}()
	var reviewLabel: UILabel = {
		let label = UILabel()
		label.text = "1 Reviews"
		return label
	}()

	var nameLabel: UILabel = {
		let label = UILabel()
		label.text = "Name"
		label.font = UIFont.systemFont(ofSize: 16)
		label.numberOfLines = 0
		return label
	}()
	var locationlabel: UILabel = {
		let label = UILabel()
		label.text = "Location"
		label.textColor = .lightGray
		label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
		return label
	}()
	var distanceLabel: UILabel = {
		let label = UILabel()
		label.text = "mi"
		label.textColor = .lightGray
		return label
	}()
	var separatorView: UIImageView = {
		let view = UIImageView()
		view.backgroundColor = .lightGray
		return view
	}()
	var reviewsImageView: UIImageView = {
		let imageView = UIImageView()
		return imageView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(searchResultImage)
		addSubview(nameLabel)
		addSubview(locationlabel)
		addSubview(separatorView)
		addSubview(distanceLabel)
		addSubview(reviewLabel)
		addSubview(reviewsImageView)
		searchResultImage.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 12, paddingBottom: 0, paddingRight: 0, width: 140, height: 140)
		nameLabel.anchor(top: searchResultImage.topAnchor, left: searchResultImage.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 4, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
		locationlabel.anchor(top: reviewLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nil, paddingTop: 4, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
		separatorView.anchor(top: self.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: self.frame.width, height: 0.5)
		distanceLabel.anchor(top: nameLabel.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
		reviewLabel.anchor(top: nameLabel.bottomAnchor, left: reviewsImageView.rightAnchor, bottom: nil, right: nil, paddingTop: 1, paddingLeft: 2, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
		reviewsImageView.anchor(top: nameLabel.bottomAnchor, left: searchResultImage.rightAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 4, paddingBottom: 0, paddingRight: 0, width: 100, height: 15)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
