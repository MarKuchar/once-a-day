//
//  Constants.swift
//  MMM
//
//  Created by Martin Kuchar on 2021-01-15.
//  Copyright © 2021 Martin Kuchar. All rights reserved.
//

import UIKit

enum UIConstants {
    static let btnColor = UIColor(red: 39/255, green: 96/255, blue: 64/255, alpha: 1)
    
    enum Button {
        static let buttonIconSize = CGSize.init(width: 44, height: 44)
        static let buttonSize = CGSize.init(width: 44, height: 44)
        static let cornerRadius = CGFloat.init(20.0)
    }
    
    enum TemplateComponent {
        static let editableCornerRadius = CGFloat.init(10.0)
        static let editableColor = UIColor(red: 0.743, green: 0.772, blue: 0.779, alpha: 0.44).cgColor
    }
}

extension CGSize {

    public static var buttonIconSize: CGSize { get { return UIConstants.Button.buttonIconSize } }

}

extension UIColor {
    public static var yBtnColor: UIColor { get { return UIConstants.btnColor } }
}
