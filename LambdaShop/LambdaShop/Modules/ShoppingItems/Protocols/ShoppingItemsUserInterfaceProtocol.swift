//
//  ShoppingItemsUserInterfaceProtocol.swift
//  LambdaShop
//
//  Created by Eric Stroh on 12/7/18.
//  Copyright © 2018 com.strohtennis. All rights reserved.
//

import Foundation

internal protocol ShoppingItemsUserInterfaceProtocol: class {
    func presentAlert(message: String)
    func showItemsInTable()
    func updateCartWith(cartItemCount: Int)
}
