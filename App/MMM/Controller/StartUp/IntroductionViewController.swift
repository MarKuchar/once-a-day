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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.animate(withDuration: 2.5, animations: {
            self.introLb.alpha = 1
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = .yBtnColor
    }
    
    @IBAction func setTimeForNotification(_ sender: Any) {
    }
}
