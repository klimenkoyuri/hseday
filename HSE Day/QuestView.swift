//
//  QuestView.swift
//  HSE Day
//
//  Created by Anton Scherbakov on 12/08/15.
//  Copyright (c) 2015 StyleRU. All rights reserved.
//

import UIKit

class QuestView: UIViewController {

    @IBOutlet var image: UIImageView!
    @IBOutlet var desc: UITextView!
    @IBOutlet var code: UITextField!
    @IBOutlet var name: UITextView!
    @IBOutlet var button: UIButton!
    
    var numberOfQuest:Int!
    let defaults = NSUserDefaults.standardUserDefaults()
    var number: NSInteger?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        numberOfQuest = defaults.objectForKey("temp") as! Int
        println(numberOfQuest)
        if(defaults.objectForKey( String(numberOfQuest) ) == nil)
        {
            //если не прошли
            println("не прошли")
            
            
        }
        else
        {
            code.hidden=true
            button.setTitle("Пройдено", forState: UIControlState.Normal)
            button.enabled = false
            println("прошли")
        }
        
        let path = NSBundle.mainBundle().pathForResource("quest", ofType: "plist")
        let arrayOfItems: NSArray? = NSArray(contentsOfFile: path!)
        
        let tasks: [String] = arrayOfItems!.valueForKey("Task") as! NSArray? as! [String]
        let names: [String] = arrayOfItems!.valueForKey("Name") as! NSArray? as! [String]
        let codes: [String] = arrayOfItems!.valueForKey("Code") as! NSArray? as! [String]
        
        
        fullInfo(defaults.objectForKey("temp") as! NSInteger - 1)
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(animated: Bool) {

    }

    @IBAction func try(sender: AnyObject) {
        
        let path = NSBundle.mainBundle().pathForResource("quest", ofType: "plist")
        let arrayOfItems: NSArray? = NSArray(contentsOfFile: path!)
        if(code.text == arrayOfItems![numberOfQuest-1].valueForKey("Code") as! String)
        {
            var done: NSInteger = defaults.objectForKey("Done") as! NSInteger
            done += 1
            defaults.setInteger(done, forKey: "Done")
            
            println("I'M HERE!!!")
            println(done)
            
            var check: NSInteger = defaults.objectForKey("temp") as! NSInteger
            
            defaults.setInteger(1, forKey: "\(check)")
            
            changeButton(defaults.objectForKey("temp") as! NSInteger)
            
            defaults.setInteger(1, forKey: String(numberOfQuest))
            
            performSegueWithIdentifier("back", sender: nil)
            
        }
        else
        {
            let alert = UIAlertController(title: "Неверный код", message: "Пройдите испытание!",
                preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "ок", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fullInfo(number: NSInteger) {
        let path = NSBundle.mainBundle().pathForResource("quest", ofType: "plist")
        let arrayOfItems: NSArray? = NSArray(contentsOfFile: path!)
        
        var description: NSString = arrayOfItems![number].valueForKey("Desc") as! NSString
        var task: NSString = arrayOfItems![number].valueForKey("Task") as! NSString
        
        desc?.text = "\(description)\n\(task)"
        name?.text = arrayOfItems![number].valueForKey("Name") as? String
        
        println(arrayOfItems![number].valueForKey("Task") as? String)
        println(arrayOfItems![number].valueForKey("Name") as? String)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        if let touch = touches.first as? UITouch {
            if code.isFirstResponder() && touch.view != code {
                code.resignFirstResponder();
            }
        }
        super.touchesBegan(touches , withEvent:event)
    }
    
    func changeButton(x: Int) {
        //var vc: ViewController = ViewController.alloc()
        
        let vc = ViewController()
        var tmpBtn = vc.imageView?.viewWithTag(x) as? UIButton
        var img : UIImage = UIImage(named:"\(x)g.png")!
        tmpBtn?.setImage(img, forState: .Normal)
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
