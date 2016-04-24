//
//  Consent To Participate.swift
//  1
//
//  Created by Keshav Aggarwal on 05/03/16.
//  Copyright © 2016 University College London. All rights reserved.
//

import UIKit

class Consent_To_Participate: UIViewController {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var done: UIBarButtonItem!
    @IBOutlet weak var pageView: UIView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    
    
    @IBOutlet weak var check1: UIButton!
    @IBOutlet weak var check2: UIButton!
    @IBOutlet weak var check3: UIButton!
    @IBOutlet weak var check4: UIButton!
    @IBOutlet weak var check5: UIButton!
    @IBOutlet weak var check6: UIButton!
    @IBOutlet weak var check7: UIButton!
    @IBOutlet weak var check8: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageView.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundImage.png")!)

        
        scrollView.contentSize = CGSizeMake(self.view.frame.width, 650)
        
        label1.text = "I have read all the information provided in the last two screens"
        
        label2.text = "Participation is voluntary and I can stop answering at any given time."
        
        label3.text = "I can delete my account in the Settings menu."
        
        label4.text = "I will not respond to this app while driving or taking part in any activity that puts me at risk."
        
        label5.text = "My data will be stored on secure servers in line with data protection laws."
        
        label6.text = "There are no costs associated with participation in this app but accept that it is my responsibility that I remain within the limits of my mobile data plan."
        
        label7.text = "All the information that I provide will remain confidential."
        
        label8.text = "Accumulated data (combined from groups of users) may be published or presented at scientific meetings (my personal information will never be included in this and I will never be identifiable from the results presented)."
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (userData.integerForKey(Keys.AGE)>=18)
        {
                let over18 = ["Resting or sleeping", "Walking", "Watching TV, film, online videos", "News watching", "Listening to music", "Listening to a radio program", "Gaming", "Playing board games", "Childcare", "Playing Sport", "Working", "Studying", "Intimate relations", "Exercising", "Eating", "Reading (books, paper, online)", "Cooking", "Praying/meditating", "Online Chatting", "Email", "Surfing the net", "Engaging with family member", "Engaging with friends", "Shopping, running errands", "Household admin", "Travelling"]
            var activitycount = [Int]()
            var focuscount = [Int]()
            var distractedcount = [Int]()
            for var i=0;i<over18.count;i++
            {
                activitycount.append(0);
                focuscount.append(0);
                distractedcount.append(0)
            }
            userData.setObject(over18, forKey: Keys.ACTIVITIES)
            userData.setObject(activitycount, forKey: Keys.ACTIVITYCOUNT)
            userData.setObject(focuscount, forKey: Keys.ACTIVITYFOCUSLEVEL)
            userData.setObject(distractedcount, forKey: Keys.DISTRACTEDCOUNT)
            userData.setInteger(0, forKey: Keys.TOTALFOCUS)
            userData.synchronize()
        }
        else
        {
                let below18 = ["Resting or sleeping", "Walking", "Watching TV, film, online videos", "News watching", "Listening to music", "Listening to a radio program or podcast", "Gaming", "Playing board games", "Childcare", "Playing Sport", "Working", "Studying/ homework", "Exercising", "Eating", "Reading (books, paper, online)", "Cooking", "Praying/meditating", "Online Chatting", "Email", "Surfing the net", "Engaging with family member", "Engaging with friends", "Shopping, running errands", "Household chores", "Travelling"]
            var activitycount = [Int]()
            var focuscount = [Int]()
            var distractedcount = [Int]()
            for var i=0;i<below18.count;i++
            {
                activitycount.append(0);
                focuscount.append(0);
                distractedcount.append(0)
            }
            userData.setObject(below18, forKey: Keys.ACTIVITIES)
            userData.setObject(activitycount, forKey: Keys.ACTIVITYCOUNT)
            userData.setObject(focuscount, forKey: Keys.ACTIVITYFOCUSLEVEL)
            userData.setObject(distractedcount, forKey: Keys.DISTRACTEDCOUNT)
            userData.setInteger(0, forKey: Keys.TOTALFOCUS)
            userData.synchronize()
        }
    }

    @IBAction func click(sender: UIButton) {
        
        if(sender.currentImage! != UIImage(named:"Checkbox Full.png")) {
            
            sender.setImage(UIImage(named: "Checkbox Full.png"), forState: UIControlState.Normal)
            
        } else {
            
            sender.setImage(UIImage(named: "Checkbox Empty.png"), forState: UIControlState.Normal)
            
        }
        
        if(check1.currentImage == UIImage(named:"Checkbox Full.png")
        && check2.currentImage == UIImage(named:"Checkbox Full.png")
        && check3.currentImage == UIImage(named:"Checkbox Full.png")
        && check4.currentImage == UIImage(named:"Checkbox Full.png")
        && check5.currentImage == UIImage(named:"Checkbox Full.png")
        && check6.currentImage == UIImage(named:"Checkbox Full.png")
        && check7.currentImage == UIImage(named:"Checkbox Full.png")
        && check8.currentImage == UIImage(named:"Checkbox Full.png")) {
                done.enabled = true
        } else {
            done.enabled = false
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
