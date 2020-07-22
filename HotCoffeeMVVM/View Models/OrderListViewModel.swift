//
//  OrderListViewModel.swift
//  HotCoffeeMVVM
//
//  Created by mohamed  habib on 22/07/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation

class OrderListViewModel {
    
    var ordersViewModel : [OrderViewModel]
    
    init() {
        self.ordersViewModel = [OrderViewModel]()
    }
}

extension OrderListViewModel {
    
    func orderViewModel(at index : Int) -> OrderViewModel {
        
        return self.ordersViewModel[index]
    }
}
