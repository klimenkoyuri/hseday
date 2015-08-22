//
//  WinViewController.swift
//  HSE Day
//
//  Created by Юрий on 22.08.15.
//  Copyright (c) 2015 StyleRU. All rights reserved.
//

import UIKit

class WinViewController: UIViewController {
    @IBOutlet var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        if(defaults.valueForKey("getWin") != nil)
        {
            button.enabled=false;
            button.setTitle("Приз получен!", forState: UIControlState.Normal)
            button.backgroundColor = UIColor(red: 17/255, green: 128/255, blue: 112/255, alpha: 1)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func press(sender: UIButton) {
         let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(1, forKey: "getWin")
        navigationController!.popViewControllerAnimated(true)
        
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
