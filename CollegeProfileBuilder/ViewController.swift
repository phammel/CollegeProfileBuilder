//
//  ViewController.swift
//  CollegeProfileBuilder
//
//  Created by Phammel on 1/21/16.
//  Copyright © 2016 Phammel. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var edditButton: UIBarButtonItem!
    

    var colleges : [CollegeClass] = []
//------------------view did------------------------
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        edditButton.tag = 0
        
        //Yale  New Haven, Connecticut  12336
        
        
       
        colleges.append(CollegeClass(CollegeName: "Yale", Location: "New Haven, Connecticut", NumberOfStudents: 12336, Image: UIImage(named: "Yale")!, WebPage: "www.yale.edu/"))
        colleges.append(CollegeClass(CollegeName: "Harvard", Location: "Cambridge, Massachusetts", NumberOfStudents: 21000, Image: UIImage(named: "Harvard")!, WebPage: "www.harvard.edu/"))
        
        colleges.append(CollegeClass(CollegeName: "Oxford", Location: "Oxford, England", NumberOfStudents: 22348, Image: UIImage(named: "oxford")!, WebPage: "www.ox.ac.uk/"))
        
   
    }
//--------------------view did----------------------
//-----------------cell for row---------------------
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        
        myCell.textLabel?.text = colleges[indexPath.row].collegeName
        myCell.detailTextLabel?.text = colleges[indexPath.row].location
    
        return myCell
    }
//---------------cell for row--------------------------
    //-----------number of rows---------------------
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return colleges.count
    }
//-----------------number of rows----------------------
//-----------------eddit tapped------------------------
    @IBAction func edditTapped(sender: UIBarButtonItem)
    {
        if (edditButton.tag == 0)
            {
                
                myTableView.editing = true
                edditButton.tag = 1
        }
        else
        {
            myTableView.editing = false
            edditButton.tag = 0
        }
    }
//-----------------eddit tapped---------------------------
//------------------addTapped-------------------
    @IBAction func addTapped(sender: UIBarButtonItem)
    {
        
        
            let myAlert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
            myAlert.addTextFieldWithConfigurationHandler { (alertTextfeild) -> Void in
                alertTextfeild.placeholder = "Add College Name" // add place holder text
            }
            
            myAlert.addTextFieldWithConfigurationHandler { (realTextfeild) -> Void in
                realTextfeild.placeholder = "Add Location" // add place holder text
            }
       
            myAlert.addTextFieldWithConfigurationHandler { (realTextfeild) -> Void in
            realTextfeild.placeholder = "Add Number of Students" // add place holder text
            }
            myAlert.addTextFieldWithConfigurationHandler { (realTextfeild) -> Void in
            realTextfeild.placeholder = "Add webpage" // add place holder text
            }
        
            
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
            myAlert.addAction(cancelAction)
            
            let addAction = UIAlertAction(title: "Add", style: .Default) { (addAction) -> Void in
                let name = myAlert.textFields![0] as UITextField
                let location = myAlert.textFields![1] as UITextField
                let number = myAlert.textFields![2] as UITextField
                let webpagew = myAlert.textFields![3] as UITextField
                
                
                
                
                self.colleges.append(CollegeClass(CollegeName: name.text!, Location: location.text!, NumberOfStudents: (Int)(number.text!)!, Image: UIImage(named: "College")!, WebPage: webpagew.text!))
                    
                    
                   
                self.myTableView.reloadData()
                
                
            }
            myAlert.addAction(addAction)
            
            
            self.presentViewController(myAlert, animated: true, completion: nil)//presents the alert view
        }
//---------------addTapped--------------------------------
    
//--------------------commitEditingStyle------------------
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if (editingStyle == .Delete)
        {
            
            colleges.removeAtIndex(indexPath.row)
            myTableView.reloadData() // reload table view
        }

    }
//--------------commitEditingStyle----------------------
//--------------canmove---------------------------------
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    
    }
//--------------canmove---------------------------------
//----------------moveatrow----------------------------
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
        let collegew = colleges[sourceIndexPath.row]
        colleges.removeAtIndex(sourceIndexPath.row)
        colleges.insert(collegew, atIndex: destinationIndexPath.row)

    }
//----------------moveatrow---------------------------------
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let detailview = segue.destinationViewController as! ViewControllerTwo
        let selectedrow = myTableView.indexPathForSelectedRow?.row
        
        detailview.college = colleges[selectedrow!]
    }
    
    
    

}

