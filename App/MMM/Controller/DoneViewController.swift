//
//  DoneViewController.swift
//  MMM
//
//  Created by Martin Kuchar on 2021-01-13.
//  Copyright © 2021 Martin Kuchar. All rights reserved.
//

import UIKit
import SafariServices

class DoneViewController: UIViewController, SFSafariViewControllerDelegate, UIAdaptivePresentationControllerDelegate {
    
    private let container = CoreDataManager.shared.persistentContainer
    
    @IBOutlet var countLb: UILabel!
    
    @IBOutlet var timeLb: UILabel!
    
    private var counter: ManagedCounter! {
        didSet {
            self.countLb.text = String(counter.currentCount)
            if counter.currentCount == 1 {
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
        self.setBackground()
        let context = container.viewContext
        self.counter = ManagedCounter.saveOrGet(context: context)
    }
    
    @IBAction func visitWeb(_ sender: Any) {
        let webVC = SFSafariViewController(url: URL(string: "http://once-a-day.xyz")!)
        webVC.delegate = self
        webVC.preferredBarTintColor = .yBgColor
        webVC.modalPresentationStyle = .overCurrentContext
        self.navigationController?.present(webVC, animated: true, completion: nil)
    }
    
    @IBAction func toTipVC(_ sender: Any) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "DonateViewController") as! TipViewController
        let nav = UINavigationController(rootViewController: vc)
        let _ = nav.translucentNavController()
        self.present(nav, animated: true, completion: nil)
    }
    
    @IBAction func toSetNotification(_ sender: Any) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "NotificationViewController") as! SettingsViewController
        let nav = UINavigationController(rootViewController: vc)
        let _ = nav.translucentNavController()
        self.present(nav, animated: true, completion: nil)
    }
    
}
