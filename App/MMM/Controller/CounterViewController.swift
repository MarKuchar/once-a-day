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
import SafariServices

class CounterViewController: UIViewController, SFSafariViewControllerDelegate {
    
    @IBOutlet var countLb: UILabel!
    
    @IBOutlet var timeLb: UILabel!
    
    private let container = CoreDataManager.shared.persistentContainer
    
    let refTotalCount = Database.database().reference().child("totalCount")
    
    private var counter: ManagedCounter! {
        didSet {
            countLb.text = String(counter.currentCount)
            if counter.currentCount == 1 {
                timeLb.text = "time."
            } else {
                timeLb.text = "times."
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let _ = self.navigationController?.translucentNavController()
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
    
    @IBAction func btnNoPressed(_ sender: Any) {
        let context = container.viewContext
        let date = Date()
        do {
            counter.setValue(date, forKey: "todayDone")
            try? context.save()
        }
    }
    
    @IBAction func visitWeb(_ sender: Any) {
        let webVC = SFSafariViewController(url: URL(string: "http://once-a-day.xyz")!)
        webVC.delegate = self
        webVC.preferredBarTintColor = .yBgColor
        webVC.modalPresentationStyle = .overCurrentContext
        self.navigationController?.present(webVC, animated: true, completion: nil)
    }
    
    @IBAction func toSetupNotification(_ sender: Any) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "NotificationViewController") as! SettingsViewController
        let nav = UINavigationController(rootViewController: vc)
        let _ = nav.translucentNavController()
        self.present(nav, animated: true, completion: nil)
    }
}
