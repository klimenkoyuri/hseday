//
//  Posvyat.swift
//  HSE Day
//
//  Created by Anton Scherbakov on 09/08/15.
//  Copyright (c) 2015 StyleRU. All rights reserved.
//

import UIKit

class Posvyat: ViewController {
    

    

    @IBOutlet var inputCode: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        inputCode.layer.cornerRadius = 1.5
                
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func go(sender: AnyObject) {
        if (inputCode.text == "1") {
            performSegueWithIdentifier("next", sender: nil)
        }
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        if let touch = touches.first as? UITouch {
            if inputCode.isFirstResponder() && touch.view != inputCode {
                inputCode.resignFirstResponder();
            }
        }
        super.touchesBegan(touches , withEvent:event)
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
