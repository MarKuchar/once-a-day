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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func setNewTime(_ sender: Any) {
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        
        let date = timePicker.date
        let components = Calendar.current.dateComponents([.hour, .minute], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
        
        let content = UNMutableNotificationContent()
        content.title = "One step reminder"
        content.body = "Did you do another step today?"
        content.categoryIdentifier = "customIdentifier"
        content.sound = UNNotificationSound.default
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
        
        dismiss(animated: true, completion: nil)
    }
}
