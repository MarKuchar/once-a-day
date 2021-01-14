//
//  IntroViewController.swift
//  MMM
//
//  Created by Martin Kuchar on 2020-11-16.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import UIKit
import CoreData
import FirebaseDatabase

class CounterViewController: UIViewController {
    
    @IBOutlet var countLb: UILabel!
    
    @IBOutlet var missCountBtn: UIButton!
    
    private let container = CoreDataManager.shared.persistentContainer
    
    let refTotalCount = Database.database().reference().child("totalCount")
    
    private var counter: ManagedCounter! {
        didSet {
            countLb.text = String(counter.currentCount)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let context = container.viewContext
        self.counter = ManagedCounter.saveOrGet(context: context)
        registerLocal()
    }

    
    @IBAction func btnPressed(_ sender: Any) {
        if let txt = countLb.text {
            let current = Int(txt)! + 1
            countLb.text = String(current)
        }
        updateLocalDb()
        updateCloudDb()
    }
    
    
    private func updateLocalDb() {
        let context = container.viewContext
        let num = Int64(countLb.text!)!
        let date = Date()
        do {
            counter.setValue(num, forKey: "currentCount")
            counter.setValue(date, forKey: "todayDone")
            try? context.save()
        }
    }
    
    private func registerLocal() {
        let center = UNUserNotificationCenter.current()

        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Notification is granted!")
            } else {
                print("Notification is not granted")
            }
        }
    }
    
    private func updateCloudDb() {
        refTotalCount.observeSingleEvent(of: .value) { (snapshot) in
            if let currentTotal = snapshot.value as? Int {
                self.refTotalCount.setValue(currentTotal + 1)
            }
        }
    }
}
