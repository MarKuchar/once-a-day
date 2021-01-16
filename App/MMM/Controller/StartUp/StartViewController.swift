//
//  StartViewController.swift
//  MMM
//
//  Created by Martin Kuchar on 2021-01-15.
//  Copyright © 2021 Martin Kuchar. All rights reserved.
//

import UIKit
import CoreData

class StartViewController: UIViewController {
    
    @IBOutlet var startLb: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let _ = self.navigationController?.translucentNavController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.animate(withDuration: 2.5, animations: {
            self.startLb.alpha = 1
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = .yBtnColor
    }
}
