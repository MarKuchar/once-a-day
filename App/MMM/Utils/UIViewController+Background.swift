//
//  UIViewController+Background.swift
//  MMM
//
//  Created by Martin Kuchar on 2021-01-20.
//  Copyright © 2021 Martin Kuchar. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setBackground() {
        let background = UIImage(named: "AppIcon_3")
        let width = self.view.bounds.width
        let imageView = UIImageView(
            frame: CGRect(x: width / 2, y: width / 2, width: width * 0.9, height: width * 0.9))
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.alpha = 0.08
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
}

