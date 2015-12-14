//
//  UserHomepageVC.swift
//  BibleBooks
//
//  Created by Brennan Linse on 12/14/15.
//  Copyright © 2015 cuw. All rights reserved.
//

import UIKit
import Parse

class UserHomepageVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var theTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let query = PFQuery(className: "Attempt")
        query.whereKey("owner_id", equalTo: PhoneCore.currentUser)
        query.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
            if(objects != nil)
            {
                PhoneCore.rowData = objects!
                self.theTable.reloadData()
            }
            else
            {
                print("None found")
            }
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PhoneCore.rowData.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell
        
        // Configure the cell...
        //update this code to fill the labels with the proper values
        cell.textLabel!.text = "\((PhoneCore.rowData[indexPath.row])["numGuesses"]) guesses"
        return cell
    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
