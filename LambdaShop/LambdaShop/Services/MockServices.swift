//
//  MockServices.swift
//  LambdaShop
//
//  Created by Eric Stroh on 12/7/18.
//  Copyright © 2018 com.strohtennis. All rights reserved.
//

import Foundation

internal class MockServices {
    static var cartCount: Int = 0
}

struct AllItems: Codable {
    let items: [ShoppingItem]
}

extension MockServices: ServicesProtocol {
    func getItems(_ completion: @escaping ((Result<[ShoppingItem]>) -> Void)) {
        
        let url = Bundle.main.url(forResource: "response", withExtension: "json")
        
        guard let jsonData = url else{
            completion(.failure(TestError.defaultError))
            return
        }
        
        guard let data = try? Data(contentsOf: jsonData) else {
            completion(.failure(TestError.defaultError))
            return
        }

        let decoder = JSONDecoder()
        
        do {
            let itemList = try decoder.decode(AllItems.self, from: data)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3)) {
                completion(.success(itemList.items))
            }
        } catch {
            completion(.failure(TestError.defaultError))
        }
    }
    
    func addItemToCart(item: ShoppingItem, _ completion: @escaping ((Result<Int>) -> Void)) {
        MockServices.cartCount += 1
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(1)) {
            completion(.success(MockServices.cartCount))
        }
    }
}
