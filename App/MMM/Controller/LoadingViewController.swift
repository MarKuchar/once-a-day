//
//  LoadingViewController.swift
//  MMM
//
//  Created by Martin Kuchar on 2020-11-20.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import UIKit

class LoadingViewController: UINavigationController {
    
    private let container = CoreDataManager.shared.persistentContainer

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let context = container.viewContext
        let counter = ManagedCounter.saveOrGet(context: context)
        
        let date = Date()
        let calendar = Calendar.current
        let today = calendar.dateComponents([.month, .day], from: date)
        if Int(counter.currentCount) == 0 {
            performSegue(withIdentifier: "toIntro", sender: self)
        } else {
            if let lastDateDone = counter.todayDone,
               calendar.dateComponents([.month, .day], from: lastDateDone) == today {
                performSegue(withIdentifier: "alreadyDone", sender: self)
            } else {
                performSegue(withIdentifier: "toCounter", sender: self)
            }
        }
    }
}
