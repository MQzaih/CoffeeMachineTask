//
//  CoffeeMachine.swift
//  Coffee Machine
//
//  Created by Asal 2 on 09/12/2020.
//  Copyright © 2020 Asal 2. All rights reserved.
//

import Foundation

struct CoffeeMachine {
    
    public static var orders : [Order]?
    public static var resources : [Resources]?
    private  static var order : Order?
    
    
    
    public static func makeOrder (newOrder: Order){
        order = newOrder
        CoffeeMachine.checkNewOrders()
    }
    
    private static func checkNewOrders (){
        while true{
            DispatchQueue.main.async {
                
                guard let newOrder = order else {
                    return
                    
                }
                orders?.append(newOrder)
                
            }
        }
    }
    
    private static func processOrders(){
        let semaphore = DispatchSemaphore(value: 2)
        let queue = DispatchQueue.global()
        queue.async {
            semaphore.wait()
            guard let  processingOrder = self.orders?.first else {return}
            prepare(processingOrder: processingOrder)
            guard let readyOrder = self.orders?.first else {return}
            Barista.orderToDeliver = readyOrder
            CoffeeMachine.orders?.remove(at: 0)
            semaphore.signal()
        }
        queue.async {
            semaphore.wait()
            
            guard let readyOrder = self.orders?.first else {return}
            Barista.orderToDeliver = readyOrder
            CoffeeMachine.orders?.remove(at: 0)
            semaphore.signal()
            
        }
        
    }
    
    
    
    private static func prepare (processingOrder:Order){
        let semaphore = DispatchSemaphore(value: 1)
        let queue = DispatchQueue.global()
        guard let processingOrder = self.orders?.first else {return}
        //let  resources = processingOrder.resources
        queue.async {
            semaphore.wait()
            if processingOrder.typeOfDrink.rawValue == "coffee"
            {
                processingOrder.addCoffee()
                processingOrder.addWater()
                
            }
            else if processingOrder.typeOfDrink.rawValue == "cappuccino"{
                processingOrder.addMilk()
                processingOrder.addCoffee()
                processingOrder.addWater()
                if processingOrder.LevelOfSugar != 0{
                    processingOrder.addSugar()
                }
                
            }
            semaphore.signal()
        }
        
    }
}
