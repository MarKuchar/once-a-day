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
    
    var isRevaled = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = .yBtnColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.animate(withDuration: 2.5, animations: {
            self.introLb.alpha = 1
        })
    }
    
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        if !isRevaled {
            animateNextParagraph()
        } else {
            toReminder()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    private func animateNextParagraph() {
        UIView.animate(withDuration: 4,
                       delay: 0,
                       animations: {
                        self.introLb.alpha = 0
                        self.introLb.text = ""
                        self.introLb.text = "... this app will remind you to do so once a day, every single day."
                        self.introLb.alpha = 1
                        self.isRevaled = true
                       }, completion: {_ in })
    }
    
    private func toReminder() {
        performSegue(withIdentifier: "toReminder", sender: nil)
    }
}
