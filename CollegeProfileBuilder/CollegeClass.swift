//
//  College.swift
//  CollegeProfileBuilder
//
//  Created by Phammel on 1/25/16.
//  Copyright © 2016 Phammel. All rights reserved.
//

import UIKit

class CollegeClass: NSObject
{
    
    //. The name, location and number of students
    
    
    
    var collegeName = ""
    var location = ""
    var numberOfStudents = 0
    var image = UIImage(named: "default")
    
    
    init(CollegeName: String, Location: String, NumberOfStudents: Int, Image: UIImage)
    {
        super.init()
        collegeName = CollegeName
        location = Location
        numberOfStudents = NumberOfStudents
        image = Image
        
    }
    init(CollegeName: String, Location: String, NumberOfStudents: Int)
    {
        super.init()
        collegeName = CollegeName
        location = Location
        numberOfStudents = NumberOfStudents
        
    }
    
    
    

    
    
    
    

}
