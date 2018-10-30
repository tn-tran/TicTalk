//
//  UIImageView+loadImage.swift
//  TicTalk
//
//  Created by Tien Tran on 10/29/18.
//  Copyright © 2018 Tien-Enterprise. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
	func loadImage(url: URL ) {
		DispatchQueue.global().async {
			[weak self] in
			if let data = try? Data(contentsOf: url) {
				if let image = UIImage(data: data) {
					DispatchQueue.main.async {
						self?.image = image
					}
					
				}
			}
		}
	}
}
