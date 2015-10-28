//
//  CustomPickerViewController.swift
//  7 Pickers Application
//
//  Created by Andrew Phommathep on 10/23/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import UIKit

class CustomPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    private var images:[UIImage]!
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var winLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        images = [
            UIImage(named: "seven")!,
            UIImage(named: "bar")!,
            UIImage(named: "crown")!,
            UIImage(named: "cherry")!,
            UIImage(named: "lemon")!,
            UIImage(named: "apple")!
        ]
        winLabel.text = " " // Note the space between the quotes
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func spin(sender: AnyObject) {
        var win = false
        var numInRow = -1
        var lastVal = -1
        
        for i in 0..<5 {
            let newValue = Int(arc4random_uniform(UInt32(images.count)))
            if newValue == lastVal {
                numInRow++
            } else {
                numInRow = 1
            }
            lastVal = newValue
            
            picker.selectRow(newValue, inComponent: i, animated: true)
            picker.reloadComponent(i)
            if numInRow >= 3 {
                win = true
            }
        }
        
        winLabel.text = win ? "WINNER!" : " "
        // Note the space between the quotes
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK:-
    // MARK: Picker Data Source Methods
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 5
    }
    
    func pickerView(pickerView: UIPickerView,
                numberOfRowsInComponent component: Int) -> Int {
        return images.count
    }
    
    // MARK:-
    // MARK: Picker Delegate Methods
    func pickerView(pickerView: UIPickerView, viewForRow row: Int,
        forComponent component: Int,
        reusingView view: UIView!) -> UIView {
        let image = images[row]
        let imageView = UIImageView(image: image)
        return imageView
    }
    
    func pickerView(pickerView: UIPickerView,
                rowHeightForComponent component: Int) -> CGFloat {
        return 64
    }
}
