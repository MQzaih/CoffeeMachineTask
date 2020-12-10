//
//  User.swift
//  Coffee Machine
//
//  Created by Asal 2 on 09/12/2020.
//  Copyright © 2020 Asal 2. All rights reserved.
//

import Foundation


struct User {
    var name : String?
    var CustomerID : Int?
    var order : Order?
    init(name:String,ID:Int,order1:Order){
        self.name = name
        self.CustomerID = ID
        self.order = order1
        CoffeeMachine.makeOrder(newOrder:self.order!)
        
    }
    
    
    
}
