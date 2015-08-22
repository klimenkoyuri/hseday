//
//  HSEOrg.swift
//  HSE Day
//
//  Created by Anton Scherbakov on 04/08/15.
//  Copyright (c) 2015 StyleRU. All rights reserved.
//

import UIKit

class HSEOrg: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet var tableView: UITableView!
    var names: [String] = []
    var descr: [String] = []
    var sites: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 31
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: OrgCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! OrgCell
        
        let path = NSBundle.mainBundle().pathForResource("org", ofType: "plist")
        let arrayOfItems: NSArray? = NSArray(contentsOfFile: path!)
        names = arrayOfItems!.valueForKey("Name") as! NSArray? as! [String]
        descr = arrayOfItems!.valueForKey("Desc") as! NSArray? as! [String]
    
            
            cell.img?.image = UIImage(named: "org\(indexPath.row+1)")
            cell.descr?.text = descr[indexPath.row]
            cell.name?.text = names[indexPath.row]
    
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let path = NSBundle.mainBundle().pathForResource("org", ofType: "plist")
        let arrayOfItems: NSArray? = NSArray(contentsOfFile: path!)
        
        sites = arrayOfItems!.valueForKey("Site") as! NSArray? as! [String]
        var forUrl = sites[indexPath.row]
        
        var stringURL: NSString = "http://\(forUrl)"
        var url: NSURL = NSURL(string: stringURL as String)!
        UIApplication.sharedApplication().openURL(url)
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
