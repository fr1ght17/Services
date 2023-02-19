//
//  UIImageView+SetImage.swift
//  Trajectory-of-the-future
//
//  Created by Степан Потапов on 19.02.2023.
//

import Kingfisher
import UIKit

extension UIImageView {
    func setImage(with url: URL?, placeholder: Placeholder?, options: KingfisherOptionsInfo?) {
        kf.setImage(with: url, placeholder: placeholder, options: options)
    }
}
