//
//  ShoppingItem.swift
//  LambdaShop
//
//  Created by Eric Stroh on 12/7/18.
//  Copyright © 2018 com.strohtennis. All rights reserved.
//

import Foundation

struct ShoppingItem: Codable {
    let name: String
    let cost: Decimal
    
    init(name: String, cost: Decimal) {
        self.name = name
        self.cost = cost
    }
}
extension ShoppingItem {
    func defaultPriceFormatted() -> String {
        return CurrencyFormatter.decimalToCurrencyString(decimal: cost) ?? "$0.00"
    }
}
