//
//  ViewController.swift
//  Control Fun
//
//  Created by Andrew Phommathep on 10/17/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var numberField: UITextField!
    
    @IBOutlet weak var sliderLabel: UILabel!
    
    @IBOutlet weak var leftSwitch: UISwitch!
    
    @IBOutlet weak var rightSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        sliderLabel.text = "50"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func textFieldDoneEditing(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func backgroundTap(sender: UIControl) {
        nameField.resignFirstResponder()
        numberField.resignFirstResponder()
    }
    
    @IBAction func sliderChanged(sender: UISlider) {
        let progress = lroundf(sender.value)
        sliderLabel.text = "\(progress)"
    }
    
    @IBAction func switchChanged(sender: UISwitch) {
    }
    
    @IBAction func toggleControls(sender: UISegmentedControl) {
    }
}

