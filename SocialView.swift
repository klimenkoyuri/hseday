//
//  SocialView.swift
//  HSE Day
//
//  Created by Anton Scherbakov on 11/08/15.
//  Copyright (c) 2015 StyleRU. All rights reserved.
//

import UIKit

class SocialView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func vk(sender: AnyObject) {
        var stringURL: NSString = "http://vk.com/hse_university"
        var url: NSURL = NSURL(string: stringURL as String)!
        UIApplication.sharedApplication().openURL(url)
    }

    @IBAction func fb(sender: AnyObject) {
        var stringURL: NSString = "http://facebook.com/hse.ru"
        var url: NSURL = NSURL(string: stringURL as String)!
        UIApplication.sharedApplication().openURL(url)
    }
    
    @IBAction func insta(sender: AnyObject) {
        var stringURL: NSString = "http://instagram.com/hse_live"
        var url: NSURL = NSURL(string: stringURL as String)!
        UIApplication.sharedApplication().openURL(url)
    }
    
    @IBAction func twi(sender: AnyObject) {
        var stringURL: NSString = "https://twitter.com/SU_HSE"
        var url: NSURL = NSURL(string: stringURL as String)!
        UIApplication.sharedApplication().openURL(url)
    }
    
    @IBAction func you(sender: AnyObject) {
        var stringURL: NSString = "http://youtube.com/user/hse"
        var url: NSURL = NSURL(string: stringURL as String)!
        UIApplication.sharedApplication().openURL(url)
    }
    
    @IBAction func hse(sender: AnyObject) {
        var stringURL: NSString = "http://hse.ru"
        var url: NSURL = NSURL(string: stringURL as String)!
        UIApplication.sharedApplication().openURL(url)
    }
    
    @IBAction func link(sender: AnyObject) {
        var stringURL: NSString = "http://linkedin.com/edu/school?id=17073"
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
