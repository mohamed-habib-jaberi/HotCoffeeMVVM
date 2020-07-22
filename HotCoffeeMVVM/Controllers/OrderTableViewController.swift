//
//  OrderTableViewController.swift
//  HotCoffeeMVVM
//
//  Created by mohamed  habib on 20/07/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation
import UIKit

class OrderTableViewController: UITableViewController {
    
    var orderListViewModel = OrderListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateOrders()
        
    }
    
    private func populateOrders(){
        
        //        guard let coffeeOrdersUrl = URL(string: "Https://guarded-retreat-82533.herokuapp.com/orders") else {
        //            fatalError("URL was not correct")
        //        }
        // let ressource = Resource<[Order]>(url: coffeeOrdersUrl) == Order.all
        
        WebService().load(resource: Order.all) { [weak self](result) -> (Void) in
            
            switch result {
            case .success(let orders) :
                print(orders)
                
                self?.orderListViewModel.ordersViewModel = orders.map(OrderViewModel.init)
                self?.tableView.reloadData()
                
            case .failure(let error) :
                print(error)
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.orderListViewModel.ordersViewModel.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath)
        
        let vm = self.orderListViewModel.orderViewModel(at: indexPath.row)
        
        cell.textLabel?.text = vm.type
        cell.detailTextLabel?.text = vm.size
        
        return cell
    }
}
