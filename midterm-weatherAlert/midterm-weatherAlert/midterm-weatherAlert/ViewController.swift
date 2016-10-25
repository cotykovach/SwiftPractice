//
//  ViewController.swift
//  cs320-midterm-weatherAlert
//
//  Created by crkovach on 10/15/15.
//  Copyright (c) 2015 crkovach. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NSXMLParserDelegate, UIPickerViewDelegate {
    var expiresFound:Bool = false
    var eventFound:Bool = false
    var severityFound:Bool = false
    var summaryFound:Bool = false
    var effectiveFound:Bool = false
    var urgencyFound:Bool = false
    var certaintyFound:Bool = false
    var linkFound:Bool = false
    var polygonFound:Bool = false
    
    var newsStories:[String] = []
    var expires:[String] = []
    var severity:[String] = []
    var summary:[String] = []
    var effective:[String] = []
    var urgency:[String] = []
    var certainty:[String] = []
    var link:[String] = []
    
    var states = ["fl","ca"]
    var statesAbrv = ["fl", "ca"]
    var statesDictionary: [String:String] = ["Alabama":"AL","Alaska":"AK","Arizona":"AZ","Arkansas":"AR","California":"CA","Colorado":"CO","Connecticut":"CT","Delaware":"DE","District Of Columbia":"DC","Florida":"FL","Georgia":"GA","Hawaii":"HI","Idaho":"ID","Illinois":"IL","Indiana":"IN","Iowa":"IA","Kansas":"KS","Kentucky":"KY","Louisiana":"LA","Maine":"ME","Maryland":"MD","Massachusetts":"MA","Michigan":"MI","Minnesota":"MN","Mississippi":"MS","Missouri":"MO","Montana":"MT","Nebraska":"NE","Nevada":"NV","New Hampshire":"NH","New Jersey":"NJ","New Mexico":"NM","New York":"NY","North Carolina":"NC","North Dakota":"ND","Ohio":"OH","Oklahoma":"OK","Oregon":"OR","Pennsylvania":"PA","Rhode Island":"RI","South Carolina":"SC","South Dakota":"SD","Tennessee":"TN","Texas":"TX","Utah":"UT","Vermont":"VT","Virginia":"VA","Washington":"WA","West Virginia":"WV","Wisconsin":"WI","Wyoming":"WY"]
    
    @IBOutlet var statePickerView: UIPickerView!
    
    @IBOutlet var stateWarningTableView: UITableView!
    var selectedViewPickerValue = 0
    var cellSelected = 0
    var stateSelected = ""
    @IBOutlet var selectedState: UILabel!
    
    
    func statesArrayAssignFromDictionary(){
        states = Array(statesDictionary.keys)
        statesAbrv = Array(statesDictionary.values)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statesArrayAssignFromDictionary()
    }
    
    func stateWarningDisplay(){
        newsStories = []
        severity = []
        expires = []
        summary = []
        effective = []
        urgency = []
        certainty = []
        link = []
        var url = NSURL(string:"http://alerts.weather.gov/cap/"+stateSelected+".php?x=0")
        var xmlParser = NSXMLParser(contentsOfURL: url)
        xmlParser?.delegate = self
        xmlParser?.parse()
        self.stateWarningTableView.reloadData()
        
    }
    
    func parser(parser:NSXMLParser, didStartElement elementName:String, namespaceURI:String?, qualifiedName qName: String?, attributes attributeDict:[NSObject:AnyObject])
    {
        if(elementName == "cap:event")
        {
            eventFound = true
        }
        if(elementName == "cap:expires")
        {
            expiresFound = true
        }
        if(elementName == "cap:severity")
        {
            severityFound = true
        }
        if(elementName == "summary")
        {
            summaryFound = true
        }
        if(elementName == "cap:effective")
        {
            effectiveFound = true
        }
        if(elementName == "cap:urgency")
        {
            urgencyFound = true
        }
        if(elementName == "cap:certainty")
        {
            certaintyFound = true
        }
        if(elementName == "link")
        {
            linkFound = true
        }
        if(elementName=="cap:polygon"){
            polygonFound = true
        }
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if(elementName == "cap:event")
        {
            eventFound = false
        }
        if(elementName == "cap:expires")
        {
            expiresFound = false
        }
        if(elementName == "cap:severity")
        {
            severityFound = false
        }
        if(elementName == "summary")
        {
            summaryFound = false
        }
        if(elementName == "cap:effective")
        {
            effectiveFound = false
        }
        if(elementName == "cap:urgency")
        {
            urgencyFound = false
        }
        if(elementName == "cap:certainty")
        {
            certaintyFound = false
        }
        if(elementName == "link")
        {
            linkFound = false
        }
        if(elementName == "cap:polygon")
        {
            polygonFound = false
        }
    }
    
    
    
    func parser(parser: NSXMLParser, foundCharacters string: String?) {
        if(eventFound)
        {
            newsStories.append(string!)
        }
        if(expiresFound)
        {
            expires.append(string!)
        }
        if(severityFound)
        {
            severity.append(string!)
        }
        if(summaryFound)
        {
            summary.append(string!)
        }
        if(effectiveFound)
        {
            effective.append(string!)
        }
        if(urgencyFound)
        {
            urgency.append(string!)
        }
        if(certaintyFound)
        {
            certainty.append(string!)
        }
        if(linkFound)
        {
            link.append(string!)
        }
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return self.newsStories.count
    }
    
    func tableView(tableView: UITableView!,
        cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        
        let cell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.Default, reuseIdentifier:"cell")
        
        cell.textLabel?.text = newsStories[indexPath.row] + " " + expires[indexPath.row]
        
        if severity[indexPath.row] == "Extreme"{
        cell.backgroundColor =  UIColor.redColor();
        }
        else if severity[indexPath.row] == "Severe"{
            cell.backgroundColor =  UIColor.orangeColor();
        }
        else if severity[indexPath.row] == "Moderate"{
            cell.backgroundColor =  UIColor.yellowColor();
        }
        else {
            cell.backgroundColor =  UIColor.whiteColor();
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
        cellSelected = indexPath.row
        self.performSegueWithIdentifier("ToDetailedView", sender: nil)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var DestViewController : DetailedView = segue.destinationViewController as! DetailedView
        
        DestViewController.EventLabelText = ""
        DestViewController.EffectiveLabelText = ""
        DestViewController.ExpiresLabelText = ""
        DestViewController.UrgencyLabelText = ""
        DestViewController.SeverityLabelText = ""
        DestViewController.CertaintyLabelText = ""
        //DestViewController.LinkLabelText = ""
        DestViewController.SummaryLabelText = ""
        
        DestViewController.EventLabelText = newsStories[cellSelected]

        DestViewController.EffectiveLabelText = effective[cellSelected]
 
        DestViewController.ExpiresLabelText = expires[cellSelected]
        
        DestViewController.UrgencyLabelText = urgency[cellSelected]
            
        DestViewController.SeverityLabelText = severity[cellSelected]
        
        DestViewController.CertaintyLabelText = certainty[cellSelected]
            
        //DestViewController.LinkLabelText = link[cellSelected]

        DestViewController.SummaryLabelText = summary[cellSelected]

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return states.count
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
        
        return states[row]
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        stateSelected = statesAbrv[row]
        selectedViewPickerValue = row
        stateWarningDisplay()
        
        
    }
    
    
}


