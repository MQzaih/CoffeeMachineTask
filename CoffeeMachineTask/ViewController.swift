//
//  ViewController.swift
//  Coffee Machine
//
//  Created by Asal 2 on 07/12/2020.
//  Copyright © 2020 Asal 2. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    var levelOfSweetness = 0
    
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet var picker :UIPickerView!
    let drinks = ["Coffee", "Cappuccino", "Latté" , "Nescafé", "Iced Latté", "Frappé", "Mocha", "Espresso"]
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
    }

    @IBAction func stepper(_ sender: UIStepper) {
        quantity.text = String(Int(sender.value))
    }
    
    @IBAction func checkSugar(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            levelOfSweetness = 3
        }
        else if sender.selectedSegmentIndex == 1
        {
            levelOfSweetness = 2
        }
        else if sender.selectedSegmentIndex == 2 {
            levelOfSweetness = 1
        }
        else {
            levelOfSweetness = 0
        }
        
    }
    
    @IBAction func placeOrder(_ sender: Any) {
        
        
    }
    
    
}


extension ViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return drinks.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return drinks[row];
    }
    
    
    
}

