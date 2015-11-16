//
//  ViewController.swift
//  8 Table Cells
//
//  Created by Andrew Phommathep on 11/4/15.
//  Copyright © 2015 Apress. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    let cellTableIdentifier = "CellTableIdentifier"
    @IBOutlet var tableView:UITableView!
    let computers = [
        ["Name" : "MacBook Air", "Color" : "Silver"],
        ["Name" : "MacBook Pro", "Color" : "Silver"],
        ["Name" : "iMac", "Color" : "Silver"],
        ["Name" : "Mac Mini", "Color" : "Silver"],
        ["Name" : "Mac Pro", "Color" : "Black"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
 
        tableView.registerClass(NameAndColorCell.self,
            forCellReuseIdentifier: cellTableIdentifier)
        
        let nib = UINib(nibName: "NameAndColorCell", bundle: nil)
        tableView.registerNib(nib,
            forCellReuseIdentifier: cellTableIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView,
            numberOfRowsInSection section: Int) -> Int {
        return computers.count
    }

    func tableView(tableView: UITableView,
            cellForRowAtIndexPath indexPath: NSIndexPath)
                -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier(
            cellTableIdentifier, forIndexPath: indexPath)
            as! NameAndColorCell

        let rowData = computers[indexPath.row]
        cell.name = rowData["Name"]!
        cell.color = rowData["Color"]!
        return cell
    }
}

