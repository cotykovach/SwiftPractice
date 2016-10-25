//
//  ViewController.swift
//  ConsultingShop-Part3
//
//  Created by crkovach on 9/30/15.
//  Copyright (c) 2015 crkovach. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate  {

    @IBOutlet var discountPickerView: UIPickerView!
    @IBOutlet var servicePickerView: UIPickerView!
   
    @IBOutlet var totalCostLabel: UILabel!
    
    var selectedViewPickerValueDiscount = 0
    var selectedViewPickerValueService = 0
    
    
    
    var discounts = ["10% Off", "20% Off", "No Discount"]
    var services = ["Makeover: $125", "Hair Styling: $60", "Manicure: $35", "Perm. Make Up: $200"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func calculateServiceCost(sender: UIButton) {
        var totalCost = 0.0
        var discountMulti = 0.0
        var selectedDiscount = selectedViewPickerValueDiscount
        var selectedService = selectedViewPickerValueService
        
        if selectedDiscount == 0 {
            discountMulti = 0.90
        } else if selectedDiscount == 1 {
            discountMulti = 0.80
        } else {
            discountMulti = 1.00
        }
        
        
        if selectedService == 0 {
            totalCost = 125.00 * discountMulti
            totalCostLabel.text = "Total Cost: $"+String(format:"%.2f",totalCost)
        }
        else if selectedService == 1 {
            totalCost = 60.00 * discountMulti
            totalCostLabel.text = "Total Cost: $"+String(format:"%.2f",totalCost)
        }
        else if selectedService == 2 {
            totalCost = 35.00 * discountMulti
            totalCostLabel.text = "Total Cost: $"+String(format:"%.2f",totalCost)
        }
        else {
            totalCost = 200.00 * discountMulti
            totalCostLabel.text = "Total Cost: $"+String(format:"%.2f",totalCost)
        }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if (pickerView.tag == 1){
        return discounts.count
        }
        return services.count
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
        if (pickerView.tag == 1){
            return discounts[row]
        }
        return services[row]
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        
        if (pickerView.tag == 1){
            selectedViewPickerValueDiscount = row
        }
        else
        {
            selectedViewPickerValueService = row
        }
        
    }

}

