//
//  ShoppingItemTableViewCell.swift
//  LambdaShop
//
//  Created by Eric Stroh on 12/8/18.
//  Copyright © 2018 com.strohtennis. All rights reserved.
//

import UIKit

protocol ShoppingItemCellProtocol: class {
    func itemSelected(item: ShoppingItem)
}

class ShoppingItemTableViewCell: UITableViewCell {
    
    static let reuseIdentifier: String = String(describing: ShoppingItemTableViewCell.self)
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    weak var delegate: ShoppingItemCellProtocol?
    var item: ShoppingItem?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func assignLabelValues(item: ShoppingItem) {
        self.item = item
        nameLabel.text = item.name
        priceLabel.text = item.defaultPriceFormatted()
    }
    
    @IBAction func addToCartPressed(_ sender: Any) {
        if let item = item {
            delegate?.itemSelected(item: item)
        }
    }
}

extension ShoppingItemTableViewCell {
    
    class var nibName: String {
        return String(describing: ShoppingItemTableViewCell.self)
    }
    
    class var nib: UINib {
        return UINib(nibName: nibName, bundle: Bundle.main)
    }
    
    class func loadFromNib() -> Self {
        return loadFromNib(ShoppingItemTableViewCell.nibName, bundle: Bundle.main)
    }
}
