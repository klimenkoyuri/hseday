//
//  FirstViewController.swift
//  HSE Day
//
//  Created by Юрий on 21.08.15.
//  Copyright (c) 2015 StyleRU. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, BWWalkthroughViewControllerDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(animated: Bool) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        if(defaults.valueForKey("firstTime") == nil)
        {
            
            defaults.setInteger(1, forKey: "firstTime")
            goWalk(self)
            
        }
        else
        {
            
            performSegueWithIdentifier("main", sender: nil)
        }
    }

    @IBAction func goWalk(sender: AnyObject) {
        // Get view controllers and build the walkthrough
        let stb = UIStoryboard(name: "Walkthrough", bundle: nil)
        let walkthrough = stb.instantiateViewControllerWithIdentifier("walk") as! BWWalkthroughViewController
        let page_zero = stb.instantiateViewControllerWithIdentifier("walk0") as! UIViewController
        let page_one = stb.instantiateViewControllerWithIdentifier("walk1") as! UIViewController
        let page_two = stb.instantiateViewControllerWithIdentifier("walk2")as! UIViewController
        
        // Attach the pages to the master
        walkthrough.delegate = self
        walkthrough.addViewController(page_zero)
        walkthrough.addViewController(page_one)
        walkthrough.addViewController(page_two)
        
        self.presentViewController(walkthrough, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func tap() {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(1, forKey: "firstTime")
        performSegueWithIdentifier("main", sender: nil)
        
    }
    
    func walkthroughPageDidChange(pageNumber: Int) {
        println("Current Page \(pageNumber)")
    }
    
    func walkthroughCloseButtonPressed() {
        self.dismissViewControllerAnimated(true, completion: nil)
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
