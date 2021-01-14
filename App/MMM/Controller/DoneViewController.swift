//
//  DoneViewController.swift
//  MMM
//
//  Created by Martin Kuchar on 2021-01-13.
//  Copyright © 2021 Martin Kuchar. All rights reserved.
//

import UIKit

class DoneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func visitWeb(_ sender: Any) {
        UIApplication.shared.open(URL(string: "http://y-pinyourday.com")!)
    }
}
