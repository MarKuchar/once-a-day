//
//  SettingsViewController.swift
//  MMM
//
//  Created by Martin Kuchar on 2020-11-28.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var timePicker: UIDatePicker!
    
    @IBOutlet var timeLb: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let date = timePicker.date
        self.setTimeLb(date: date)
        setupNavVC()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func setNotification(_ sender: Any) {
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        
        let date = timePicker.date
        self.setTimeLb(date: date)
        let components = Calendar.current.dateComponents([.hour, .minute], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
        
        let content = UNMutableNotificationContent()
        content.title = "Your Once A Day reminder"
        content.body = "Did you contribute to cleanliness today?"
        content.categoryIdentifier = "customIdentifier"
        content.sound = UNNotificationSound.default
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
        
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
    
}
