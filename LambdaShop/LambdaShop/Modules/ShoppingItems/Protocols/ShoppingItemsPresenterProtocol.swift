//
//  ShoppingItemsPresenterProtocol.swift
//  LambdaShop
//
//  Created by Eric Stroh on 12/7/18.
//  Copyright © 2018 com.strohtennis. All rights reserved.
//

import Foundation

internal protocol ShoppingItemsPresenterProtocol: class {
    var interactor: ShoppingItemsInteractorProtocol { get }
    var router: ShoppingItemsRouterProtocol { get }
    var userInterface: ShoppingItemsUserInterfaceProtocol? { get set }
}
