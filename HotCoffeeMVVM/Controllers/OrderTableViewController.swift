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
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
         populateOrders()
        
    }
    
    private func populateOrders(){
        
                guard let coffeeOrdersUrl = URL(string: "Https://guarded-retreat-82533.herokuapp.com/orders") else {
                    fatalError("URL was not correct")
                }
         let ressource = Resource<[Order]>(url: coffeeOrdersUrl)
        
        WebService().load(resource: ressource) { [weak self](result) -> (Void) in
                  
                  switch result {
                  case .success(let orders) :
                      print(orders)
                      
                  case .failure(let error) :
                      print(error)
                  }
              }
    }
}
