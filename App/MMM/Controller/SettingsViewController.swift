//
//  SettingsViewController.swift
//  MMM
//
//  Created by Martin Kuchar on 2020-11-28.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private let container = CoreDataManager.shared.persistentContainer
    
    private let center = NotificationCenter.shared
    
    private var counter: ManagedCounter!
    
    @IBOutlet var timePicker: UIDatePicker!
    
    @IBOutlet var timeLb: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupNavVC()
        self.getCurrentNotificationDate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func datePickerValueChanged(_ sender: Any) {
        let date = timePicker.date
        self.setTimeLb(date: date)
    }
    
    
    @IBAction func setNotification(_ sender: Any) {
        self.center.getNotificationSettings(completionHandler: { settings in
            switch settings.authorizationStatus {
                case .authorized, .provisional:
                    self.registerNotification()
                case .denied:
                    self.requestAuth()
                default :
                    self.requestAuth()
            }
        })
        dismiss(animated: true, completion: nil)
    }
    
    private func setTimeLb(date: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        let timeString = formatter.string(from: date)
        self.timeLb.text = timeString
    }
    
    private func setupNavVC() {
        let attributes = [NSAttributedString.Key.font: UIFont(name: "NewYorkMedium-Semibold", size: 20)]
        self.navigationItem.rightBarButtonItem?.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)
    }
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    private func getCurrentNotificationDate() {
        self.center.getPendingNotificationRequests { (requests) in
            guard let trigger = requests.first?.trigger as? UNCalendarNotificationTrigger else {
                DispatchQueue.main.async {
                    self.setTimeLb(date: self.timePicker.date)
                }
                return
            }
            guard let date = trigger.nextTriggerDate() else {
                return
            }
            DispatchQueue.main.async {
                self.setTimeLb(date: date)
                self.timePicker.date = date
            }
        }
    }
    
    private func requestAuth() {
        self.center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                self.registerNotification()
            }
        }
    }
    
    private func registerNotification() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.center.removeAllPendingNotificationRequests()
            let date = self.timePicker.date
            let components = Calendar.current.dateComponents([.hour, .minute], from: date)
            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
            
            let content = UNMutableNotificationContent()
            content.title = "Your Once A Day reminder"
            content.body = "Did you contribute to cleanliness today?"
            content.categoryIdentifier = "customIdentifier"
            content.sound = UNNotificationSound.default
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            self.center.add(request)
        }
    }
}

