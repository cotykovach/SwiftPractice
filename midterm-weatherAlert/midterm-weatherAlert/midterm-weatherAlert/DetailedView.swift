//
//  DetailedView.swift
//  cs320-midterm-weatherAlert
//
//  Created by crkovach on 10/15/15.
//  Copyright (c) 2015 crkovach. All rights reserved.
//

import Foundation
import UIKit

class DetailedView : UIViewController {
    
    @IBOutlet var EventLabel: UILabel!
    
    @IBOutlet var EffectiveLabel: UILabel!
    
    @IBOutlet var ExpiresLabel: UILabel!
    
    @IBOutlet var UrgencyLabel: UILabel!
    
    @IBOutlet var SeverityLabel: UILabel!
    
    @IBOutlet var CertaintyLabel: UILabel!
    
    @IBOutlet var LinkLabel: UILabel!
        
    @IBOutlet var SummaryText: UITextView!
    
    var EventLabelText = String()
    
    var EffectiveLabelText = String()
    
    var ExpiresLabelText = String()
    
    var UrgencyLabelText = String()
    
    var SeverityLabelText = String()
    
    var CertaintyLabelText = String()
    
    var LinkLabelText = String()
    
    var SummaryLabelText = String()
    
    
    override func viewDidLoad() {

        EventLabel.text = EventLabelText
        
        EffectiveLabel.text = EffectiveLabelText
        
        ExpiresLabel.text = ExpiresLabelText
        
        UrgencyLabel.text = UrgencyLabelText
        
        SeverityLabel.text = SeverityLabelText
        
        CertaintyLabel.text = CertaintyLabelText
        
        LinkLabel.text = LinkLabelText
        
        SummaryText.text = SummaryLabelText
        
        
    }
    
}