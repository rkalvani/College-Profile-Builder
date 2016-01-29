//
//  DetailViewController.swift
//  CollegeProfileBuilder
//
//  Created by rkalvani on 1/28/16.
//  Copyright © 2016 rkalvani. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var locationTextField: UITextField!

    @IBOutlet weak var studentTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var college : College!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = college.name
        locationTextField.text = college.location
        studentTextField.text = String(college.numberOfStudents)
        imageView.image = college.image
        
    }

    @IBAction func onTappedSaveButton(sender: UIButton) {
        college.name = nameTextField.text!
        college.location = locationTextField.text!
        college.numberOfStudents = Int(studentTextField.text!)!
        nameTextField.resignFirstResponder()
        locationTextField.resignFirstResponder()
        studentTextField.resignFirstResponder()
    
    }
   
    


}
