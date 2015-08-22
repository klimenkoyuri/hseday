//
//  ViewController.swift
//  HSE Day
//
//  Created by Anton Scherbakov on 04/08/15.
//  Copyright (c) 2015 StyleRU. All rights reserved.
//

import UIKit
import MapKit

@objc class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var try: UIView!
    
    @IBOutlet var viewToZoom: UIView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var scrollView: UIScrollView?
    @IBOutlet weak var imageView: UIImageView?
    
    @IBOutlet var barButton: UIBarButtonItem!
    @IBOutlet var check: UIButton!
    var yey: Bool = false
    var button: Bool = false
    var coordinatesX: [String] = []
    var coordinatesY: [String] = []
    var status: [String] = []
    var pins: NSArray?
    var names: [String] = []
    var finished: NSInteger = 0
    let defaults = NSUserDefaults.standardUserDefaults()
    @IBOutlet var map: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(defaults.objectForKey("Done")==nil)
        {
            defaults.setInteger(0, forKey: "Done")
        }
        if(defaults.valueForKey("Done") as! Int >= 10)
        {
            barButton?.image = UIImage(named: "done")
        }
        
        if(defaults.valueForKey("Done") as! Int >= 10  && defaults.valueForKey("winner") == nil)
        {
            defaults.setInteger(1, forKey: "winner")
            performSegueWithIdentifier("Winner", sender: nil)
        }
        
        
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.hidden = true
        
        
        
        try?.hidden = true
        
//        check.addTarget(self, action: "goToPin", forControlEvents: UIControlEvents.TouchUpInside)
        
        let path = NSBundle.mainBundle().pathForResource("quest", ofType: "plist")
        let arrayOfItems: NSArray? = NSArray(contentsOfFile: path!)
        var x: [Int] = arrayOfItems?.valueForKey("X") as! NSArray? as! [Int]
        var y: [Int] = arrayOfItems?.valueForKey("Y") as! NSArray? as! [Int]
        
        //self.setupPins()
        
        scrollView?.delegate = self
        scrollView?.showsVerticalScrollIndicator = true
        scrollView?.flashScrollIndicators()
        
        scrollView?.minimumZoomScale = 1.0
        scrollView?.maximumZoomScale = 10.0
        
        imageView?.layer.cornerRadius = 11.0
        imageView?.clipsToBounds = false
        scrollView?.addSubview(imageView!)
        
        
    
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func close(sender: AnyObject) {
        try?.hidden = true
        yey = true
    }
    
    override func viewDidAppear(animated: Bool) {
        //self.setupPins()
        
        
        self.scrollToCenter(true)
        
        
        
        for i in 0...19 {
            let path = NSBundle.mainBundle().pathForResource("quest", ofType: "plist")
            let arrayOfItems: NSArray? = NSArray(contentsOfFile: path!)
            var x: [Int] = arrayOfItems?.valueForKey("X") as! NSArray? as! [Int]
            var y: [Int] = arrayOfItems?.valueForKey("Y") as! NSArray? as! [Int]
            
            addButton(x[i], y: y[i], i: i)
        }
        
        println(yey)
        if (!yey){
            if (defaults.objectForKey("Done") as! NSInteger == 11){
                try.hidden = false
            }
        }
        
        /*if(defaults.objectForKey("Done") != nil && defaults.objectForKey("Done") as! Int == 10)
        {
            //что-то спрятать
        }*/
        println(defaults.objectForKey("Done"))

    }
    
    func addButton(x: NSInteger, y: NSInteger, i: NSInteger){
        
        let button = UIButton()
        button.frame = CGRectMake(CGFloat(x), CGFloat(y), 32, 32)
        button.addTarget(self, action: "goToPin:", forControlEvents: .TouchUpInside)
        button.tag = i + 1
        var btnImg: UIImage?
        if (defaults.objectForKey("\(i+1)") as? NSInteger == 1){
            btnImg = UIImage(named:"\(i+1)g.png")!
        }
        else{
            btnImg = UIImage(named:"\(i+1)b.png")!
        }
        button.setImage(btnImg, forState: .Normal)
        imageView?.addSubview(button)
        
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }

    @IBAction func showTable(sender: AnyObject) {
        if(defaults.valueForKey("Done") as! Int >= 0) //если победил
        {
            performSegueWithIdentifier("Winner", sender: nil)
        }
        else
        {
        if (!button){
            barButton.image = UIImage(named: "x")
            tableView.hidden = false
            button = true
        }
        else {
             barButton.image = UIImage(named: "more")
            tableView.hidden = true
            button = false
        }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        scrollView?.contentSize = imageView!.frame.size
        scrollView?.showsVerticalScrollIndicator = true
        scrollView?.showsHorizontalScrollIndicator = true
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        var cell: InfoCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! InfoCell
        
        let path = NSBundle.mainBundle().pathForResource("quest", ofType: "plist")
        let arrayOfItems: NSArray? = NSArray(contentsOfFile: path!)
        names = arrayOfItems!.valueForKey("Name") as! NSArray? as! [String]
            
            cell.number?.text = "\(indexPath.row+1)"
            cell.name?.text = names[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

    }
    
    func scrollToCenter(animated: Bool) {
        var frame: CGRect? = self.viewToZoom?.frame
        self.scrollView?.scrollRectToVisible(CGRectMake(500, 500, 250, 250), animated: animated)
    }
    
//    func setupPins() {
//        let path = NSBundle.mainBundle().pathForResource("quest", ofType: "plist")
//        let arrayOfItems: NSArray? = NSArray(contentsOfFile: path!)
//        
//        coordinatesX = arrayOfItems!.valueForKey("X") as! NSArray? as! [String]
//        coordinatesY = arrayOfItems!.valueForKey("Y") as! NSArray? as! [String]
//        status = arrayOfItems!.valueForKey("Nailed") as! NSArray? as! [String]
//        
////        for pin: AnyObject in arrayOfItems!
////        {
////            if let data = pin as? NSDictionary
////            {
////                var pinView: PinView = PinView(dict: data as [NSObject : AnyObject])
////                var vc: ViewController = self
////                pinView.addTarget(self, action: "goToPin:", forControlEvents: UIControlEvents.TouchUpInside)
////                scrollView?.addSubview(pinView)
////                 println("fuckfirst")
////            }
////        }
//        
//    }
    
    func goToPin(sender:UIButton!){
//        var qv: QuestView = QuestView.alloc()
        
        defaults.setInteger(sender.tag, forKey: "temp")
        
        self.performSegueWithIdentifier("toQuest", sender: nil)
    }
    
    
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        return true;
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        
        
    }
}

