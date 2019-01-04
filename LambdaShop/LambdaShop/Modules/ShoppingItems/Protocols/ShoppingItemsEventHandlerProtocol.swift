//
//  ShoppingItemsEventHandlerProtocol.swift
//  LambdaShop
//
//  Created by Eric Stroh on 12/7/18.
//  Copyright © 2018 com.strohtennis. All rights reserved.
//

import Foundation

internal protocol ShoppingItemsEventHandlerProtocol {
    func initializeItems()
    func numberOfItems() -> Int
    func itemAt(indexPath: IndexPath) -> ShoppingItem
    func itemWasSelected(item: ShoppingItem)
    func cartButtonSelected()
}
