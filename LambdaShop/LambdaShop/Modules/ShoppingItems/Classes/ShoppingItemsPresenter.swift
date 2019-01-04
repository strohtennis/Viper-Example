//
//  ShoppingItemsPresenter.swift
//  LambdaShop
//
//  Created by Eric Stroh on 12/7/18.
//  Copyright © 2018 com.strohtennis. All rights reserved.
//

import Foundation

class ShoppingItemsPresenter: ShoppingItemsPresenterProtocol {
    /// Shopping Items Presenter will be responsible to present the UI and gather the user input
    
    let router: ShoppingItemsRouterProtocol
    let interactor: ShoppingItemsInteractorProtocol
    
    weak var userInterface: ShoppingItemsUserInterfaceProtocol?
    
    init(router: ShoppingItemsRouterProtocol, interactor: ShoppingItemsInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
}

extension ShoppingItemsPresenter: ShoppingItemsEventHandlerProtocol {
    func initializeItems() {
        interactor.getAllItems { [weak self] (success) in
            if success {
                self?.userInterface?.showItemsInTable()
            } else {
                self?.userInterface?.presentAlert(message: "Could not load items")
            }
        }
    }
    
    func numberOfItems() -> Int {
        return interactor.numberOfItems()
    }
    
    func itemAt(indexPath: IndexPath) -> ShoppingItem {
        return interactor.itemAt(indexPath: indexPath)
    }
    
    func itemWasSelected(item: ShoppingItem) {
        interactor.itemWasSelected(item: item) { [weak self] (success, numberItemsInCart) in
            if success {
                self?.userInterface?.updateCartWith(cartItemCount: numberItemsInCart)
            } else {
                self?.userInterface?.presentAlert(message: "Could not add item to cart")
            }
        }
    }
    
    func cartButtonSelected() {
        router.goToCart()
    }
}
