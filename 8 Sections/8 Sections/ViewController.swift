//
//  ViewController.swift
//  8 Sections
//
//  Created by Andrew Phommathep on 11/15/15.
//  Copyright © 2015 Apress. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    let sectionsTableIdentifier = "SectionsTableIndentifier"
    var names: [String: [String]]!
    var keys: [String]!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.registerClass(UITableViewCell.self,
            forCellReuseIdentifier: sectionsTableIdentifier)
        let path = NSBundle.mainBundle().pathForResource(
            "sortednames", ofType: "plist")
        let namesDict = NSDictionary(contentsOfFile: path!)
        names = namesDict as! [String: [String]]
        keys = sorted(namesDict!.allKeys as! [String])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Table View Data Source Methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return keys.count
    }
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
        let key = keys[section]
        let nameSection = names[key]!
        return nameSection.count
    }
    
    func tableView(tableView: UITableView,
        titleForHeaderInSection section: Int) -> String? {
        return keys[section]
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(sectionsTableIdentifier, forIndexPath:
    indexPath)
                as! UITableViewCell
        let key = keys[indexPath.section]
        let nameSection = names[key]!
        cell.textLabel?.text = nameSection[indexPath.row]
        return cell
    }
}

