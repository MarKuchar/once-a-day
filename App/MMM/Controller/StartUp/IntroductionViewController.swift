//
//  ViewController.swift
//  MMM
//
//  Created by Martin Kuchar on 2020-11-07.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import UIKit
import CoreData

class IntroductionViewController: UIViewController {
    
    
    @IBOutlet var introLb: UILabel!
    
    @IBOutlet var startBtn: yButton!
    
    @IBOutlet var imageBottom: UIImageView!
    
    @IBOutlet var imageTop: UIImageView!
    
    var isRevaled: Bool!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = .yBtnColor
        self.isRevaled = false
        self.introLb.text = "For those who want to contribute to protecting our environment, and would not hesitate to pick up any rubbish and put it in the appropriate bin..."
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 2.5, animations: {
            self.introLb.alpha = 1
            self.imageTop.alpha = 1
        })
    }
    
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        if !isRevaled {
            animateNextParagraph()
        } else {
            UIView.animate(withDuration: 2.2, delay: 0, options: .allowAnimatedContent) {
                self.introLb.alpha = 0
                self.imageBottom.alpha = 0
            } completion: { _ in
                self.toReminder()
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    private func animateNextParagraph() {
        UIView.animate(withDuration: 2.2, delay: 0, options: .allowAnimatedContent) {
            self.introLb.alpha = 0
            self.imageTop.alpha = 0
        } completion: { _ in
            UIView.animate(withDuration: 2.2) {
                self.introLb.text = "... this app will remind you to do so once a day, every single day."
                self.introLb.alpha = 1
                self.imageBottom.alpha = 1
                self.isRevaled = true
            }
       }
    }
    
    private func toReminder() {
        performSegue(withIdentifier: "toReminder", sender: nil)
    }
}
