//
//  yButtonTip.swift
//  MMM
//
//  Created by Martin Kuchar on 2021-01-24.
//  Copyright © 2021 Martin Kuchar. All rights reserved.
//

import UIKit

class yButtonTip: UIButton {
    
    let text: String
    
    required init(text: String) {
        
        self.text = text
        
        super.init(frame: .zero)
        self.setTitle(text, for: .normal)
        self.tintColor = .white
        self.setTitleColor(.yBtnColor, for: .normal)
        self.titleLabel?.font = UIFont(name: "NewYorkMedium-Semibold", size: 20)
        self.contentEdgeInsets = UIEdgeInsets(top: 4.0, left: 8.0, bottom: 4.0, right: 8.0)
        
        self.heightAnchor.constraint(equalToConstant: 48).isActive = true
        self.layer.cornerRadius = 22
        self.layer.shadowColor = UIColor(red: 0.176, green: 0.278, blue: 0.314, alpha: 1).cgColor
        self.layer.borderColor = UIColor(red: 57/255, green: 150/255, blue: 100/255, alpha: 1).cgColor
        self.layer.shadowRadius = 10
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        self.layer.borderWidth = 1.5
        self.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.titleLabel?.minimumScaleFactor = 0.5
        self.startAnimatingPressActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
