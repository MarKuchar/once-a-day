//
//  yButtonApp.swift
//  MMM
//
//  Created by Martin Kuchar on 2021-01-15.
//  Copyright © 2021 Martin Kuchar. All rights reserved.
//

import Foundation

import UIKit

class yButtonApp: UIButton {
    
    required init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.tintColor = .white
        self.setTitleColor(.yBtnColor, for: .normal)
        self.contentEdgeInsets = UIEdgeInsets(top: 4.0, left: 8.0, bottom: 4.0, right: 8.0)
        
        self.layer.cornerRadius = self.bounds.height / 2
        self.layer.shadowColor = UIColor(red: 0.176, green: 0.278, blue: 0.314, alpha: 1).cgColor
        self.layer.borderColor = UIColor(red: 57/255, green: 150/255, blue: 100/255, alpha: 1).cgColor
        self.layer.shadowRadius = 10
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        self.layer.borderWidth = 1.5
        self.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.titleLabel?.minimumScaleFactor = 0.5

        self.startAnimatingPressActionsForDone()
    }
}
