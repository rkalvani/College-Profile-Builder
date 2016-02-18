//
//  MapViewController.swift
//  CollegeProfileBuilder
//
//  Created by rkalvani on 2/17/16.
//  Copyright © 2016 rkalvani. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var mapTextField: UITextField!
    
    @IBOutlet weak var mapView: MKMapView!
    
    var college : College!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapTextField.text = college.name
        findLocation("\(college.name), \(college.location)")
        mapTextField.delegate = self
        
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let location = mapTextField.text!
        mapTextField.resignFirstResponder()
        findLocation(location)
        return true
    }
    
    func findLocation(locationName: String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(locationName) { (placemarks , error) -> Void in
            if error != nil {
                print(error)
            }
            else {
                if placemarks!.count > 1 {
                    let alert = UIAlertController(title: "Select a Location", message: nil, preferredStyle: .ActionSheet)
                    for placemark in placemarks! {
                        let locationAction =  UIAlertAction(title: placemark.name, style: .Default, handler: { (action) -> Void in
                            self.displayMap(placemark)
                        })
                        alert.addAction(locationAction)
                    }
                    let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
                    alert.addAction(cancelAction)
                    self.presentViewController(alert, animated: true, completion: nil)
                }
                else if placemarks?.count == 1 {
                    let placemark = placemarks!.first as CLPlacemark!
                    self.displayMap(placemark)
                }
            }
        }
        
    }

    func displayMap(placemark: CLPlacemark) {
        
        mapTextField.text = placemark.name
        let center = placemark.location!.coordinate
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(center, span)
        let pin = MKPointAnnotation()
        pin.coordinate = center
        pin.title = placemark.name
        mapView.addAnnotation(pin)
        mapView.setRegion(region, animated: true)
        
    }

}
