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
    
    @IBOutlet var vStackView: UIStackView!
    
    var packages = [Purchases.Package]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let attributes = [NSAttributedString.Key.font: UIFont(name: "NewYorkMedium-Semibold", size: 20)]
        self.navigationItem.rightBarButtonItem?.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)
    }
    
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
                    for i in 0..<fechedPackages.count {
                        let package = fechedPackages[i]
                        self.packages.append(package)
                        
                        let product = package.product
                        let title = product.localizedTitle
                        let price = product.price
                        self.makeBtn(with: "\(title) - \(price)", andTag: i)
                    }
                }
          }
        }
    }
    
    private func makeBtn(with title: String, andTag: Int) {
        let btn = yButtonTip(text: title)
        btn.tag = andTag
        btn.addTarget(self, action: #selector(makePurchase(_:)), for: .touchUpInside)
        vStackView.addArrangedSubview(btn)
        btn.widthAnchor.constraint(equalTo: vStackView.widthAnchor).isActive = true
    }
    
    @objc func makePurchase(_ sender: UIButton) {
        Purchases.shared.purchasePackage(packages[sender.tag]) { (transaction, purchaserInfo, error, userCancelled) in
            if let error = error {
                debugPrint(error.localizedDescription)
            }
        }
    }

    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
