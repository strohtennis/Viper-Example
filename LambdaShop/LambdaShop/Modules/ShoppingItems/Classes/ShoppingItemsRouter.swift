//
//  ShoppingItemsRouter.swift
//  LambdaShop
//
//  Created by Eric Stroh on 12/7/18.
//  Copyright © 2018 com.strohtennis. All rights reserved.
//

import Foundation
import UIKit

internal class ShoppingItemsRouter {
    weak var viewController: UIViewController?
    weak var presenter: ShoppingItemsPresenterProtocol?
}

extension ShoppingItemsRouter: ShoppingItemsRouterProtocol {
    
    static func configureShoppingItemsFlow(services: ServicesProtocol) -> UIViewController {
        let interactor = ShoppingItemsInteractor(services: services)
        let router = ShoppingItemsRouter()
        let presenter = ShoppingItemsPresenter(router: router, interactor: interactor)
        let viewController = ShoppingItemsViewController(eventHandler: presenter)
        
        router.viewController = viewController
        router.presenter = presenter
        presenter.userInterface = viewController
        
        return viewController
    }
    
    func goToCart() {
        
    }
}
