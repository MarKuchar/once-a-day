//
//  NavController+NavBar.swift
//  MMM
//
//  Created by Martin Kuchar on 2021-01-15.
//  Copyright © 2021 Martin Kuchar. All rights reserved.
//

import UIKit

extension UINavigationController {
    func translucentNavController() -> Self {
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        self.navigationItem.backBarButtonItem?.tintColor = .black
        return self
    }
}
