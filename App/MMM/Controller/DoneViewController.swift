//
//  DoneViewController.swift
//  MMM
//
//  Created by Martin Kuchar on 2021-01-13.
//  Copyright © 2021 Martin Kuchar. All rights reserved.
//

import UIKit
import SafariServices
import WidgetKit

class DoneViewController: UIViewController, SFSafariViewControllerDelegate, UIAdaptivePresentationControllerDelegate {
    
    private let flowers = Flowers.flowers
    
    private let container = CoreDataManager.shared.persistentContainer
    
    @IBOutlet var flowerImage: UIImageView!
    
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
        self.updateWidget()
        self.animateFlower()
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
    
    private func animateFlower() {
        UIView.animate(withDuration: 1.5, animations: {
            if let flowerString = self.flowers.randomElement() {
                print(flowerString)
                self.flowerImage.image = UIImage(named: flowerString)
                self.flowerImage.alpha = 1
            }
        })
    
    }
    
    private func updateWidget() {
        WidgetCenter.shared.getCurrentConfigurations { result in
            guard case .success(let widgets) = result else { return }
            for widget in widgets {
                if widget.kind == "OAD_widget_personal_count" {
                    WidgetCenter.shared.reloadTimelines(ofKind: widget.kind)
                }
            }
        }
    }
}
