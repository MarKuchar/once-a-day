//
//  ReminderViewController.swift
//  MMM
//
//  Created by Martin Kuchar on 2021-01-15.
//  Copyright © 2021 Martin Kuchar. All rights reserved.
//

import UIKit
import CoreData

class ReminderViewController: UIViewController {
    
    private let container = CoreDataManager.shared.persistentContainer
    
    private let center = NotificationCenter.shared
    
    private var counter: ManagedCounter!
    
    @IBOutlet var topLb: UILabel!
    @IBOutlet var secondLb: UILabel!
    @IBOutlet var timeLb: UILabel!
    @IBOutlet var imageBellow: UIImageView!
    
    @IBOutlet var timePicker: UIDatePicker!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let _ = self.navigationController?.translucentNavController()
        let date = timePicker.date
        self.setTimeLb(date: date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animations()
        setupCounter()
        askForPermission()
    }
    
    private func setupCounter() {
        let context = container.viewContext
        self.counter = ManagedCounter.saveOrGet(context: context)
        do {
            self.counter.setValue(false, forKey: "isFirstLaunch")
            try? context.save()
        }
    }
    
    private func animations() {
        UIView.animate(withDuration: 2.5, animations: {
            self.topLb.alpha = 1
            self.secondLb.alpha = 1
            self.timeLb.alpha = 1
            self.timePicker.alpha = 1
            self.imageBellow.alpha = 1
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = .yBtnColor
    }
    
    
    
    @IBAction func setNotification(_ sender: Any) {
        self.center.removeAllPendingNotificationRequests()
        let date = timePicker.date
        let components = Calendar.current.dateComponents([.hour, .minute], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
        
        let content = UNMutableNotificationContent()
        content.title = "Your Once A Day reminder"
        content.body = "Did you contribute to cleanliness today?"
        content.categoryIdentifier = "customIdentifier"
        content.sound = UNNotificationSound.default
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
    }
    
    @IBAction func setTimeForNotification(_ sender: Any) {
        let date = timePicker.date
        self.setTimeLb(date: date)
    }
    
    private func setTimeLb(date: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        let timeString = formatter.string(from: date)
        
        self.timeLb.text = timeString
    }
    
    
    private func askForPermission() {
        self.center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                debugPrint(error)
            }
        }
    }
}
