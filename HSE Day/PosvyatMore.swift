//
//  PosvyatMore.swift
//  HSE Day
//
//  Created by Anton Scherbakov on 21/08/15.
//  Copyright (c) 2015 StyleRU. All rights reserved.
//

import UIKit

class PosvyatMore: ViewController {
    
    @IBOutlet var quePosvyat: UITextView!
    @IBOutlet var done: UIButton!
    @IBOutlet var imgView: UIImageView!
    
    @IBOutlet var bg: UIImageView!
    
    
    @IBOutlet var yeap: UIButton!
    @IBOutlet var frontView: UIView!
    var questions: [String] = []
    var number = 0
    var image: NSInteger = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgView.clipsToBounds = true
        let path = NSBundle.mainBundle().pathForResource("posvyat", ofType: "plist")
        let arrayOfItems: NSArray? = NSArray(contentsOfFile: path!)
        
        questions = arrayOfItems!.valueForKeyPath("Question") as! NSArray? as! [String]
        
        quePosvyat?.tintColor = UIColor.whiteColor()
        quePosvyat?.text = questions[number]
        
        /*imgView = UIImageView(frame: CGRectMake(0, 0, self.frontView.frame.width, self.frontView.frame.width))*/
        /*self.frontView.insertSubview(imgView, atIndex: 0)*/
        
        frontView.layer.borderColor = UIColor.blackColor().CGColor
        
        var fadeView: UIView = UIView(frame: self.view.frame)
        fadeView.backgroundColor = UIColor.blackColor()
        fadeView.alpha = 0.55
        self.view.insertSubview(fadeView, atIndex: 0)
        
        bg = UIImageView(frame: self.view.frame)
        self.view.insertSubview(bg, atIndex: 0)
        
        yeap.backgroundColor = UIColor(red: 80.0/255.0, green: 127.0/255.0, blue: 182.0/255.0, alpha: 1.0)
        yeap.layer.cornerRadius = 3.0
        yeap.layer.shadowColor = UIColor.grayColor().CGColor
        yeap.layer.shadowOffset = CGSizeMake(3, 3)
        yeap.layer.shadowRadius = 1.0
        yeap.layer.shadowOpacity = 1.0
        
        animateImage(image)
        
        //UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(animated: Bool) {
 
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func yes(sender: AnyObject) {
        if (number < 11){
            number += 1
            quePosvyat?.text = questions[number]
            image++
            animateImage(image)
        }
        else {
            performSegueWithIdentifier("ura", sender: nil)
        }
    }

    func animateImage(no:Int)
    {
        var imgNumber:Int = no
        let t:NSTimeInterval = 1;
        let t1:NSTimeInterval = 0;
        var name:String = "\(imgNumber).jpg"
        var name2:String = "\(imgNumber)b.jpg"
        imgView!.alpha = 0.4
        imgView!.image = UIImage(named:name);
        bg!.image = UIImage(named: name2)
        bg!.contentMode = UIViewContentMode.ScaleAspectFill
        imgView!.contentMode = UIViewContentMode.Redraw
        
        
        //code to animate bg with delay 2 and after completion it recursively calling animateImage method
        UIView.animateWithDuration(2.0, delay: 0, options:UIViewAnimationOptions.CurveEaseOut, animations: {() in
            self.imgView!.alpha = 1.0;
            },
            completion: nil)
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
