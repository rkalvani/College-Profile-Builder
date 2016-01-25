//
//  ViewController.swift
//  CollegeProfileBuilder
//
//  Created by rkalvani on 1/25/16.
//  Copyright © 2016 rkalvani. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var colleges = ["Harvard", "Berkeley", "Chicago"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colleges.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        cell.textLabel?.text = colleges[indexPath.row]
        return cell
    }

}

