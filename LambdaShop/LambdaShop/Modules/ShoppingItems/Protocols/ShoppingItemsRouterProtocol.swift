//
//  ShoppingItemsRouterProtocol.swift
//  LambdaShop
//
//  Created by Eric Stroh on 12/7/18.
//  Copyright © 2018 com.strohtennis. All rights reserved.
//

import Foundation
import UIKit

internal protocol ShoppingItemsRouterProtocol {
    static func configureShoppingItemsFlow(services: ServicesProtocol) -> UIViewController
    func goToCart()
}
