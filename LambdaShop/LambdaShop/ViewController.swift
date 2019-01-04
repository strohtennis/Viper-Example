//
//  ViewController.swift
//  LambdaShop
//
//  Created by Eric Stroh on 12/7/18.
//  Copyright © 2018 com.strohtennis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func shoppingItemsPressed(_ sender: Any) {
        let services = MockServices()
        let shoppingItemsViewController = ShoppingItemsRouter.configureShoppingItemsFlow(services: services)
        self.navigationController?.pushViewController(shoppingItemsViewController, animated: true)
    }
}

