//
//  ViewController.swift
//  RentalCarCalculator-Part2
//
//  Created by crkovach on 9/30/15.
//  Copyright (c) 2015 crkovach. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {

    
    
    var cars = ["Economy: 24.99/Day", "Compact: 29.99/Day", "Intermediate: 39.99/Day", "Standard: 44.99/Day", "Full Size: 49.99/Day"]
    
    
    
    
    @IBOutlet var selectedCarPickerView: UIPickerView!
    
    @IBOutlet var pickerViewDelegate: UIPickerViewDelegate!
    
    @IBOutlet var totalDaysTxtBox: UITextField!
    
    @IBOutlet var totalCostLabel: UILabel!
    
    var selectedViewPickerValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateRent(sender: UIButton) {
        var rentalCost = 0.0
        var selectedRow = selectedViewPickerValue
        
        if selectedRow == 0 {
            rentalCost = 24.99 * (totalDaysTxtBox.text as NSString).doubleValue
            totalCostLabel.text = String(format:"%.2f",rentalCost)
        }
        else if selectedRow == 1 {
            rentalCost = 29.99 * (totalDaysTxtBox.text as NSString).doubleValue
            totalCostLabel.text = String(format:"%.2f",rentalCost)
        }
        else if selectedRow == 2 {
            rentalCost = 39.99 * (totalDaysTxtBox.text as NSString).doubleValue
            totalCostLabel.text = String(format:"%.2f",rentalCost)
        }
        else if selectedRow == 3 {
            rentalCost = 44.99 * (totalDaysTxtBox.text as NSString).doubleValue
            totalCostLabel.text = String(format:"%.2f",rentalCost)
        } else {
            rentalCost = 49.99 * (totalDaysTxtBox.text as NSString).doubleValue
            totalCostLabel.text = String(format:"%.2f",rentalCost)
        }
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return cars.count
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
    
        
        return cars[row]
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        
        selectedViewPickerValue = row
        
        
    }

    
    
    

    
    
}

