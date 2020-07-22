//
//  Order.swift
//  HotCoffeeMVVM
//
//  Created by mohamed  habib on 22/07/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation

enum CoffeeType : String, Codable{
    case cappuccino
    case Latte
    case Lattee
    case espressino
    case cortado
    
}

enum CoffeeSize: String, Codable {
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
