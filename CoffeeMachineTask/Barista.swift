//
//  Barista.swift
//  Coffee Machine
//
//  Created by Asal 2 on 09/12/2020.
//  Copyright © 2020 Asal 2. All rights reserved.
//

import Foundation

struct Barista  {
    public var name = ""
    private var id : Int?
    public  static var orderToDeliver :Order?
    
    
    public func isAvailable(){
        
    }
    
    
    func DeliverOrder(){
        if CoffeeMachine.orders?.isEmpty == true {
            return
        }
        else{
            print("delivered ordered")
        }
    }
}
