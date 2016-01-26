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
        
        
       
        colleges.append(CollegeClass(CollegeName: "Yale", Location: "New Haven, Connecticut", NumberOfStudents: 12336, Image: UIImage(named: "Yale")!))
        colleges.append(CollegeClass(CollegeName: "Harvard", Location: "Cambridge, Massachusetts", NumberOfStudents: 21000, Image: UIImage(named: "Harvard")!))
        
        colleges.append(CollegeClass(CollegeName: "Oxford", Location: "Oxford, England", NumberOfStudents: 22348, Image: UIImage(named: "oxford")!))
   
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
    
    

   


}

