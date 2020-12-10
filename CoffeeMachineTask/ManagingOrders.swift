//
//  ManagingOrders.swift
//  Coffee Machine
//
//  Created by Asal 2 on 08/12/2020.
//  Copyright © 2020 Asal 2. All rights reserved.
//

import Foundation

struct server {
    
    var myDrink : DrinkCup?
    var Quantity: Int?
    
    init(drinkName: DrinkCup, Quantity: Int) {
              self.myDrink = drinkName
              self.Quantity = Quantity
          }
    
    mutating func serve() {
        
    
    }
    
    
    
}
