//
//  Order.swift
//  HotCoffeeMVVM
//
//  Created by mohamed  habib on 22/07/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation

enum CoffeeType : String, Codable, CaseIterable{
    case cappuccino
    case Latte
    case Lattee
    case espressino
    case cortado
    
}

enum CoffeeSize: String, Codable, CaseIterable {
    case small
    case meduim
    case large
}

struct Order : Codable {
    
    let name : String
    let email : String
    let type : CoffeeType
    let size : CoffeeSize
}

// post order : Populating Order Model using AddCoffeeOrderViewModel ViewModel

extension Order {
    init?(_ vm: AddCoffeeOrderViewModel) {
        guard let name = vm.name,
            let email = vm.email,
            let selectedType = CoffeeType(rawValue: vm.selectedType!.lowercased()),
            let selectedSize = CoffeeSize(rawValue: vm.selectedSize!.lowercased())
        else { return nil }
        
        
        self.name = name
        self.email = email
        self.type = selectedType
        self.size = selectedSize
    }
}
