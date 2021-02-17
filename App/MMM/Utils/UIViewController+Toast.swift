//
//  UIViewController+Toast.swift
//  MMM
//
//  Created by Martin Kuchar on 2021-01-25.
//  Copyright © 2021 Martin Kuchar. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showToast(message : String, font: UIFont = UIFont()) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height/2, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.numberOfLines = 0
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        toastLabel.alpha = 0.0
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseOut, animations: {
            toastLabel.alpha = 1.0
        }, completion: {(isCompleted) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                toastLabel.removeFromSuperview()
                self.dismiss(animated: true, completion: nil)
            }
        })
    }
    
    func showToastReminder(message : String, font: UIFont = UIFont()) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 150, y: self.view.frame.size.height/2 - 75, width: 300, height: 150))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.numberOfLines = 0
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        toastLabel.alpha = 0.7
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseOut, animations: {
            toastLabel.alpha = 1.0
        }, completion: {(isCompleted) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                toastLabel.removeFromSuperview()
                self.dismiss(animated: true, completion: nil)
            }
        })
    }
}
