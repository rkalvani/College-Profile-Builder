//
//  DetailViewController.swift
//  CollegeProfileBuilder
//
//  Created by rkalvani on 1/28/16.
//  Copyright © 2016 rkalvani. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController, SFSafariViewControllerDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
    @IBOutlet weak var locationTextField: UITextField!

    @IBOutlet weak var studentTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var websiteTextField: UITextField!
    
    var college : College!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate =  self
        nameTextField.text = college.name
        locationTextField.text = college.location
        studentTextField.text = String(college.numberOfStudents)
        imageView.image = college.image
        websiteTextField.text = String(college.url!)
        
    }

    @IBAction func onTappedSaveButton(sender: UIButton) {
        college.name = nameTextField.text!
        college.location = locationTextField.text!
        college.numberOfStudents = Int(studentTextField.text!)!
        college.url = NSURL(string: websiteTextField.text!)
        college.image = imageView.image
        nameTextField.resignFirstResponder()
        locationTextField.resignFirstResponder()
        studentTextField.resignFirstResponder()
        websiteTextField.resignFirstResponder()
    
    }
   
    @IBAction func goToWebsite(sender: AnyObject) {
        let url = college.url
        let svc = SFSafariViewController(URL: url!)
        svc.delegate = self
        self.presentViewController(svc, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imagePicker.dismissViewControllerAnimated(true) { () -> Void in
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.imageView.image = selectedImage
        }
    }

    
    @IBAction func onTappedLibraryButton(sender: AnyObject) {
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }

    @IBAction func onTappedCameraButton(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.Camera){
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! MapViewController
        dvc.college = self.college
    }

}
