//
//  ServicesProtocol.swift
//  LambdaShop
//
//  Created by Eric Stroh on 12/7/18.
//  Copyright © 2018 com.strohtennis. All rights reserved.
//

import Foundation

internal protocol ServicesProtocol {
    func getItems(_ completion: @escaping ((Result<[ShoppingItem]>) -> Void))
    func addItemToCart(item: ShoppingItem, _ completion: @escaping ((Result<Int>) -> Void))
}
