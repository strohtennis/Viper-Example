//
//  Utility.swift
//  LambdaShop
//
//  Created by Eric Stroh on 12/7/18.
//  Copyright © 2018 com.strohtennis. All rights reserved.
//

import Foundation
import UIKit

enum TestError: Error {
    case defaultError
}

public enum Result<T> {
    case success(T)
    case failure(Error)
}

extension Result {
    func unwrap() throws -> T {
        switch self {
        case let .success(value):
            return value
        case let .failure(error):
            throw error
        }
    }
}

internal class CurrencyFormatter: NumberFormatter {

    class func decimalToCurrencyString(decimal: Decimal,
                                       currencyCode: String = "USD",
                                       languageCode: String = "en") -> String? {
        let components = [ NSLocale.Key.currencyCode.rawValue: currencyCode,
                           NSLocale.Key.languageCode.rawValue: languageCode]
        let localeIdentifier = NSLocale.localeIdentifier(fromComponents: components)
        let localeForCurrencyCode = NSLocale(localeIdentifier: localeIdentifier)

        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.formatterBehavior = .default
        
        formatter.locale = localeForCurrencyCode as Locale
        return formatter.string(from: decimal as NSDecimalNumber)
    }
}

extension UIView {
    public class func loadFromNib<T>(_ nibName: String, bundle: Foundation.Bundle) -> T {
        return bundle.loadNibNamed(nibName, owner: self, options: nil)!.first as! T
    }
}

