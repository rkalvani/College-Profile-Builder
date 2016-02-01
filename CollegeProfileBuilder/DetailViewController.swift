//
//  DetailViewController.swift
//  CollegeProfileBuilder
//
//  Created by rkalvani on 1/28/16.
//  Copyright © 2016 rkalvani. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController, SFSafariViewControllerDelegate
{
    @IBOutlet weak var locationTextField: UITextField!

    @IBOutlet weak var studentTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var websiteTextField: UITextField!
    
    var college : College!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = college.name
        locationTextField.text = college.location
        studentTextField.text = String(college.numberOfStudents)
        imageView.image = college.image
        //NSURL(string: websiteTextField.text!) = college.url
        
    }

    @IBAction func onTappedSaveButton(sender: UIButton) {
        college.name = nameTextField.text!
        college.location = locationTextField.text!
        college.numberOfStudents = Int(studentTextField.text!)!
        college.url = NSURL(string: websiteTextField.text!)
        nameTextField.resignFirstResponder()
        locationTextField.resignFirstResponder()
        studentTextField.resignFirstResponder()
        websiteTextField.resignFirstResponder()
    
    }
   
    @IBAction func goToWebsite(sender: AnyObject) {
    }
    


}
