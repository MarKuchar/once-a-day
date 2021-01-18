//
//  DoneViewController.swift
//  MMM
//
//  Created by Martin Kuchar on 2021-01-13.
//  Copyright © 2021 Martin Kuchar. All rights reserved.
//

import UIKit

class DoneViewController: UIViewController {
    
    private let container = CoreDataManager.shared.persistentContainer
    
    @IBOutlet var countLb: UILabel!
    
    @IBOutlet var timeLb: UILabel!
    
    private var counter: ManagedCounter! {
        didSet {
            self.countLb.text = String(counter.currentCount)
            if counter.currentCount < 2 {
                timeLb.text = "time."
            } else {
                timeLb.text = "times."
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: false)
        let _ = self.navigationController?.translucentNavController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let context = container.viewContext
        self.counter = ManagedCounter.saveOrGet(context: context)
    }
    
    @IBAction func visitWeb(_ sender: Any) {
        UIApplication.shared.open(URL(string: "http://once-a-day.xyz")!)
    }
}
