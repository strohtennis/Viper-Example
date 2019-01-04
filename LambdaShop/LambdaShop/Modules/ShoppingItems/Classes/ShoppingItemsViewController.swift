//
//  ShoppingItemsViewController.swift
//  LambdaShop
//
//  Created by Eric Stroh on 12/7/18.
//  Copyright © 2018 com.strohtennis. All rights reserved.
//

import UIKit

internal class ShoppingItemsViewController: UIViewController {

    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var cartTotalLabel: UILabel!
    
    let eventHandler: ShoppingItemsEventHandlerProtocol
    
    // MARK: - Initialization
    init(eventHandler: ShoppingItemsEventHandlerProtocol) {
        self.eventHandler = eventHandler
        super.init(nibName: String(describing: ShoppingItemsViewController.self), bundle: Bundle.main)
        title = "Shopping Items"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ShoppingItemTableViewCell.nib, forCellReuseIdentifier: ShoppingItemTableViewCell.reuseIdentifier)
        activityIndicator.startAnimating()
        tableView.isHidden = true
        eventHandler.initializeItems()
    }
    
    @IBAction func cartPressed(_ sender: Any) {
        eventHandler.cartButtonSelected()
    }
}

extension ShoppingItemsViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventHandler.numberOfItems()
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = eventHandler.itemAt(indexPath: indexPath)
        guard let shoppingItemCell = self.tableView.dequeueReusableCell(
            withIdentifier: ShoppingItemTableViewCell.reuseIdentifier,
            for: indexPath) as? ShoppingItemTableViewCell else {
                return UITableViewCell()
        }
        shoppingItemCell.assignLabelValues(item: item)
        shoppingItemCell.delegate = self
        return shoppingItemCell
    }
}

extension ShoppingItemsViewController: ShoppingItemCellProtocol {
    func itemSelected(item: ShoppingItem) {
        activityIndicator.startAnimating()
        eventHandler.itemWasSelected(item: item)
    }
}

extension ShoppingItemsViewController: ShoppingItemsUserInterfaceProtocol {
    func presentAlert(message: String) {
        activityIndicator.stopAnimating()
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    func showItemsInTable() {
        activityIndicator.stopAnimating()
        tableView.reloadData()
        tableView.isHidden = false
    }
    
    func updateCartWith(cartItemCount: Int) {
        activityIndicator.stopAnimating()
        cartTotalLabel.text = "\(cartItemCount)"
    }
}
