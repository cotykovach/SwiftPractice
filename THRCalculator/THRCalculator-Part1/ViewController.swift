//
//  ViewController.swift
//  THRCalculator-Part1
//
//  Created by crkovach on 9/30/15.
//  Copyright (c) 2015 crkovach. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var restingHeartRate: UITextField!
    
    @IBOutlet var age: UITextField!
    
    @IBOutlet var trainingHeartRate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateTHR(sender: UIButton) {
        var rhrValue = (restingHeartRate.text as NSString).doubleValue
        var ageValue = (age.text as NSString).doubleValue
        
        var finalValue = ((((220 - ageValue) - rhrValue) * 0.60)) + rhrValue
        
        
        trainingHeartRate.text = ("THR: "+String(format:"%.2f", finalValue))
        


        

    }

}
