//
//  ViewController.swift
//  MMM
//
//  Created by Martin Kuchar on 2020-11-07.
//  Copyright © 2020 Martin Kuchar. All rights reserved.
//

import UIKit
import CoreData

class IntroViewController: UIViewController {
    
    private let container = CoreDataManager.shared.persistentContainer
    
    private var counter: ManagedCounter! 
    
    @IBOutlet var timePicker: UIDatePicker!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let context = container.viewContext
        self.counter = ManagedCounter.saveOrGet(context: context)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func setTimeForNotification(_ sender: Any) {
        let date = timePicker.date
        let components = Calendar.current.dateComponents([.hour, .day], from: date)
        // To test trigger
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
        
        let content = UNMutableNotificationContent()
        content.title = "One step reminder"
        content.body = "Did you do another step today?"
        content.categoryIdentifier = "customIdentifier"
        content.sound = UNNotificationSound.default
        
        let center = UNUserNotificationCenter.current()
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
    }
}
