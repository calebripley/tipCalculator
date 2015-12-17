//
//  ViewController.swift
//  Tipsy
//
//  Created by Caleb Ripley on 12/5/15.
//  Copyright © 2015 Caleb Ripley. All rights reserved.
//

import UIKit
import CoreGraphics

class ViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipsyButtonLabel: UILabel!
    @IBOutlet weak var tipsySwitch: UISwitch!
    @IBOutlet weak var billFieldVerticalSpaceConstraint: NSLayoutConstraint!
    @IBOutlet weak var tipControlVerticalSpaceConstraint: NSLayoutConstraint!
    @IBOutlet weak var tipsyButtonLabelVerticalSpaceConstraint: NSLayoutConstraint!
    @IBOutlet weak var tipsySwitchVerticalSpaceConstraint: NSLayoutConstraint!
    @IBOutlet weak var tipLabelVerticalSpaceConstraint: NSLayoutConstraint!
    @IBOutlet weak var totalLabelVerticalSpaceConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        totalLabel.text = "$0.00"
        tipLabel.text = "$0.00"
        
        let defaults = NSUserDefaults.standardUserDefaults()
        tipControl.selectedSegmentIndex = defaults.integerForKey("defaultTipPercentage")
        
        billField.becomeFirstResponder()
        
        totalLabelVerticalSpaceConstraint.constant -= self.view.bounds.height
        
        tipLabelVerticalSpaceConstraint.constant -= self.view.bounds.height
        
        tipsySwitchVerticalSpaceConstraint.constant -= self.view.bounds.height
    
        tipsyButtonLabelVerticalSpaceConstraint.constant -= self.view.bounds.height
        
        tipControlVerticalSpaceConstraint.constant -= self.view.bounds.height
        
        self.billFieldVerticalSpaceConstraint.constant = 350
        
        navigationController!.navigationBar.barTintColor = UIColor.orangeColor()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        tipControl.selectedSegmentIndex = defaults.integerForKey("defaultTipPercentage")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.1, 0.15, 0.2]
        var billAmount = NSString(string: billField.text!).doubleValue
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        if billField.text == "" {
            totalLabelVerticalSpaceConstraint.constant -= self.view.bounds.height
            UIView.animateWithDuration(0.3, delay: 0.0, options: [], animations: { self.totalLabel.layoutIfNeeded()
                }, completion: nil)
            
            tipLabelVerticalSpaceConstraint.constant -= self.view.bounds.height
            UIView.animateWithDuration(0.3, delay: 0.0, options: [], animations: { self.tipLabel.layoutIfNeeded()
                }, completion: nil)
            
            tipsySwitchVerticalSpaceConstraint.constant -= self.view.bounds.height
            UIView.animateWithDuration(0.3, delay: 0.0, options: [], animations: { self.tipsySwitch.layoutIfNeeded()
                }, completion: nil)
            
            tipsyButtonLabelVerticalSpaceConstraint.constant -= self.view.bounds.height
            UIView.animateWithDuration(0.3, delay: 0.0, options: [], animations: { self.tipsyButtonLabel.layoutIfNeeded()
                }, completion: nil)
            
            tipControlVerticalSpaceConstraint.constant -= self.view.bounds.height
            UIView.animateWithDuration(0.3, delay: 0.0, options: [], animations: { self.tipControl.layoutIfNeeded()
                }, completion: nil)
            
            self.billFieldVerticalSpaceConstraint.constant = 350
            UIView.animateWithDuration(0.3, delay: 0.0, options: [], animations: { self.billField.layoutIfNeeded()
                }, completion: nil)
        } else {
            
            totalLabelVerticalSpaceConstraint.constant = 237.5
            UIView.animateWithDuration(0.3, delay: 0.0, options: [], animations: { self.totalLabel.layoutIfNeeded()
                }, completion: nil)
            
            tipLabelVerticalSpaceConstraint.constant = 300
            UIView.animateWithDuration(0.3, delay: 0.0, options: [], animations: { self.tipLabel.layoutIfNeeded()
                }, completion: nil)
            
            tipsySwitchVerticalSpaceConstraint.constant = 375
            UIView.animateWithDuration(0.3, delay: 0.0, options: [], animations: { self.tipsySwitch.layoutIfNeeded()
                }, completion: nil)
            
            tipsyButtonLabelVerticalSpaceConstraint.constant = 375
            UIView.animateWithDuration(0.3, delay: 1.0, options: [], animations: { self.tipsyButtonLabel.layoutIfNeeded()
                }, completion: nil)
            
            tipControlVerticalSpaceConstraint.constant = 450
            UIView.animateWithDuration(0.3, delay: 0.0, options: [], animations: { self.tipControl.layoutIfNeeded()
                }, completion: nil)
            
            self.billFieldVerticalSpaceConstraint.constant = 500
            UIView.animateWithDuration(0.3, delay: 0.0, options: [], animations: {
                self.billField.layoutIfNeeded()
                }, completion: nil)
        }
        
        if tipsySwitch.on == true {
            billAmount = NSString(string: billField.text!).doubleValue
            tipPercentage = 0.3
            tip = billAmount * tipPercentage
            total = billAmount + tip
            
            tipLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
        } else {
            tipPercentages = [0.1, 0.15, 0.2]
            billAmount = NSString(string: billField.text!).doubleValue
            tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
            tip = billAmount * tipPercentage
            total = billAmount + tip
            
            tipLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
        }
    }
   
    @IBAction func feelinTipsy(sender: UISwitch) {
        if tipsySwitch.on == true {
            var billAmount = NSString(string: billField.text!).doubleValue
            var tipPercentage = 0.3
            var tip = billAmount * tipPercentage
            var total = billAmount + tip
            
            tipLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
        } else {
            var tipPercentages = [0.1, 0.15, 0.2]
            var billAmount = NSString(string: billField.text!).doubleValue
            var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
            var tip = billAmount * tipPercentage
            var total = billAmount + tip
            
            tipLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
        }
    }
}

