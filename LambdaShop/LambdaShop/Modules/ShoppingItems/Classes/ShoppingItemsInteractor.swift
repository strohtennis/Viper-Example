//
//  ShoppingItemsInteractor.swift
//  LambdaShop
//
//  Created by Eric Stroh on 12/7/18.
//  Copyright © 2018 com.strohtennis. All rights reserved.
//

import Foundation

internal class ShoppingItemsInteractor {
    
    fileprivate let services: ServicesProtocol
    fileprivate var allItems: [ShoppingItem]?
    
    init(services: ServicesProtocol) {
        self.services = services
    }
    
    func serviceGetAllItems(_ completion: @escaping ([ShoppingItem]?) -> ()) {
        services.getItems { [weak self] (result) in
            switch result {
            case .success:
                do {
                    let items = try result.unwrap()
                    self?.allItems = items
                    completion(items)
                } catch {
                    completion(nil)
                }
            case .failure(_):
                completion(nil)
            }
        }
    }
    
    func serviceItemWasSelected(item: ShoppingItem, _ completion: @escaping (Int) -> ()) {
        services.addItemToCart(item: item) { (result) in
            switch result {
            case .success:
                do {
                    let cartCount = try result.unwrap()
                    completion(cartCount)
                } catch {
                    completion(0)
                }
            case .failure(_):
                completion(0)
            }
        }
    }
}

extension ShoppingItemsInteractor: ShoppingItemsInteractorProtocol {
    func getAllItems(_ completion: @escaping (Bool) -> ()) {
        serviceGetAllItems { (itemArray) in
            completion(itemArray != nil)
        }
    }
    
    func numberOfItems() -> Int {
        return allItems?.count ?? 0
    }
    
    func itemAt(indexPath: IndexPath) -> ShoppingItem {
        if let allItems = allItems {
            return allItems[indexPath.row]
        }
        return ShoppingItem(name: "", cost: 0)
    }
    
    func itemWasSelected(item: ShoppingItem, _ completion: @escaping (Bool, Int) -> ()) {
        serviceItemWasSelected(item: item) { (numberCartItems) in
            if numberCartItems > 0 {
                completion(true, numberCartItems)
            } else {
                completion(false, 0)
            }
        }
    }
}
