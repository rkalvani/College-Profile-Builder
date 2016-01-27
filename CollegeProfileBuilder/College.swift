//
//  College.swift
//  CollegeProfileBuilder
//
//  Created by rkalvani on 1/27/16.
//  Copyright © 2016 rkalvani. All rights reserved.
//

import UIKit

class College: NSObject {
    
    var name = ""
    var location = ""
    var numberOfStudents = 0
    var image = UIImage(named: "default")
    
    convenience init(name: String, location: String, numberOfStudents: Int, image: UIImage) {
        self.init()
        self.name = name
        self.location = location
        self.numberOfStudents = numberOfStudents
        self.image = image
    }
   
    convenience init(name: String){
        self.init()
        self.name = name
    }
    
}
