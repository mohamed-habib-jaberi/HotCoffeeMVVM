//
//  OrderViewModel.swift
//  HotCoffeeMVVM
//
//  Created by mohamed  habib on 22/07/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation

struct OrderViewModel {
    
    let order : Order
}

extension OrderViewModel {
    
    var name : String {
        return self.order.name
    }
    var email : String {
        return self.order.email
    }
    var size : String {
        return self.order.size.rawValue.capitalized
    }
    var type : String {
        return self.order.type.rawValue.capitalized
    }
}
