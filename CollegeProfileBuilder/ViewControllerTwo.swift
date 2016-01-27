//
//  ViewControllerTwo.swift
//  CollegeProfileBuilder
//
//  Created by Phammel on 1/26/16.
//  Copyright © 2016 Phammel. All rights reserved.
//

import UIKit

class ViewControllerTwo: UIViewController
{
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var collegeTextFeild: UITextField!
    @IBOutlet weak var locationTextFeild: UITextField!
    @IBOutlet weak var numberTextFeild: UITextField!
    
    var college : CollegeClass!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        super.viewDidLoad()
        collegeTextFeild.text = college.collegeName
        locationTextFeild.text = college.location
        numberTextFeild.text = "\(college.numberOfStudents)"
        myImage.image = college.image

    }
    
    
    @IBAction func saveButtonTapped(sender: AnyObject)
    {
        college.collegeName = collegeTextFeild.text!
        college.location = locationTextFeild.text!
        college.numberOfStudents = (numberTextFeild.text! as NSString).integerValue
    }
    

    
}
