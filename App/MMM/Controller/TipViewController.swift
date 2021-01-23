//
//  TipViewController.swift
//  MMM
//
//  Created by Martin Kuchar on 2021-01-23.
//  Copyright © 2021 Martin Kuchar. All rights reserved.
//

import UIKit
import Purchases

class TipViewController: UIViewController {
    
    @IBOutlet var oneDollarBtn: UIButton!
    
    var packages = [Purchases.Package]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPurchases()
    }
    
    
//    https://www.youtube.com/watch?v=Bmzbdt8ldMQ
    private func fetchPurchases() {
        Purchases.shared.offerings { (offerings, error) in
            if let offerings = offerings {
              // Display current offering with offerings.current
                let offer = offerings.current
                if let fechedPackages = offer?.availablePackages {
                    let _ = fechedPackages.map { (package) in
                        
                        self.packages.append(package)
                        
                        let product = package.product
                        let title = product.localizedTitle
                        let price = product.price
                        self.oneDollarBtn.setTitle("\(title) \(price)", for: .normal)
                    }
                }
          }
        }
    }
    
    
    @IBAction func makePurchase(_ sender: Any) {
        //        Purchases.shared.purchasePackage(package) { (transaction, purchaserInfo, error, userCancelled) in
        //            if purchaserInfo?.entitlements.all["your_entitlement_id"]?.isActive == true {
        //                // Unlock that great "pro" content
        //            }
        //        })
    }

}
