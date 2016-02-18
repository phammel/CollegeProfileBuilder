//
//  ViewControllerTwo.swift
//  CollegeProfileBuilder
//
//  Created by Phammel on 1/26/16.
//  Copyright © 2016 Phammel. All rights reserved.
//

import UIKit
import SafariServices


class ViewControllerTwo: UIViewController, SFSafariViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate


{
    
    
    
    @IBOutlet weak var myImage: UIImageView!
    
    @IBOutlet weak var collegeTextFeild: UITextField!
    @IBOutlet weak var locationTextFeild: UITextField!
    @IBOutlet weak var numberTextFeild: UITextField!
    @IBOutlet weak var webtextfeild: UITextField!
    
    var college : CollegeClass!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        super.viewDidLoad()
        collegeTextFeild.text = college.collegeName
        locationTextFeild.text = college.location
        numberTextFeild.text = "\(college.numberOfStudents)"
        myImage.image = college.image
        webtextfeild.text = college.webPage
        imagePicker.delegate = self

    }
    
    @IBAction func CamerabuttonTapped(sender: AnyObject)
    {
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    
    @IBAction func cameraTapped(sender: AnyObject)
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
        {
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            presentViewController(imagePicker, animated: true, completion: nil)
        }
        else
        {
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            presentViewController(imagePicker, animated: false, completion: nil)
        }
        
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        imagePicker.dismissViewControllerAnimated(true) { () -> Void in
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.myImage.image = selectedImage
            self.college.image = selectedImage
        }
    }
    
   
    
    
    
    
    
    
    
    
    
    
    @IBAction func gobuttontapped(sender: AnyObject)
    {
        let myurl = NSURL(string: "https://" + webtextfeild.text!)
        let SVC = SFSafariViewController(URL: myurl!)
        SVC.delegate = self
        presentViewController(SVC, animated: true, completion: nil)
        
    }
    
    func safariViewControllerDidFinish(controller: SFSafariViewController)
    {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }

    
    
    
    @IBAction func saveButtonTapped(sender: AnyObject)
    {
        college.collegeName = collegeTextFeild.text!
        college.location = locationTextFeild.text!
        college.numberOfStudents = (numberTextFeild.text! as NSString).integerValue
        college.webPage = webtextfeild.text!
    }
    

    
}
