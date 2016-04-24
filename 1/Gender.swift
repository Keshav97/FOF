//
//  Gender.swift
//  1
//
//  Created by Keshav Aggarwal on 06/03/16.
//  Copyright © 2016 University College London. All rights reserved.
//

import UIKit
import Firebase

var isMale : Bool = true


class Gender: UIViewController {

    @IBOutlet weak var maleRadio: UIButton!
    @IBOutlet weak var femaleRadio: UIButton!
    @IBOutlet weak var next: UIBarButtonItem!
    var ref = Firebase(url: "https://testyourfocus.firebaseio.com")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundImage.png")!)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        //var uid : String
        var gender : [ String : String]
        if (isMale)
        {
            gender = ["gender" : "male"]
        }
        else  { gender = ["gender" : "female"] }
        self.ref.childByAppendingPath("Users").childByAppendingPath(userData.stringForKey(Keys.UID)).childByAppendingPath("Data").updateChildValues(gender)
    }


    @IBAction func maleClicked(sender: UIButton) {
        
        maleRadio.setImage(UIImage(named: "radio_active.png"), forState: UIControlState.Normal)
        
        femaleRadio.setImage(UIImage(named: "radio_inactive.png"), forState: UIControlState.Normal)
        
        isMale = true
        
        next.enabled = true
        
    }
    
    
    @IBAction func femaleClicked(sender: UIButton) {
        
        femaleRadio.setImage(UIImage(named: "radio_active.png"), forState: UIControlState.Normal)
        
        maleRadio.setImage(UIImage(named: "radio_inactive.png"), forState: UIControlState.Normal)
        
        isMale = false
        
        next.enabled = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
