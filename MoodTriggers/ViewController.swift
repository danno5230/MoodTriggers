//
//  ViewController.swift
//  MoodTriggers
//
//  Created by Daniel Levine on 3/26/16.
//  Copyright © 2016 PSU Dan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //outlet for the main label
    @IBOutlet var questionLabel: UITextView!
    @IBOutlet var participateButton: UIButton!
    @IBOutlet var doNotParticipateButton: UIButton!
    @IBOutlet var startSurvey: UIButton!

    //actions for the participate buttons
    @IBAction func participate(sender: AnyObject)
    {
        //MAKE THE LABEL ASK THE USER TO START THE SURVEY
        /*
        questionLabel.text = "The following questions are going to ask you information about yourself and your sleeping patterns"
        participateButton.hidden = true
        doNotParticipateButton.hidden = true
        startSurvey.hidden = false
 */
        
    }
    @IBAction func doNotParticipate(sender: AnyObject)
    {
        //CREATE AN ALERT TO TELL THE USER THEY NEED TO ACCEPT ON THIS SCREEN IF THEY WANT TO CONTINUE
        let alert = UIAlertController(title: "Alert", message: "You must accept if you want to continue with the survey.", preferredStyle:UIAlertControllerStyle.Alert)
        alert.message = "You must accept if you want to continue with the survey."
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated:true, completion:nil)
    }
    
    //ACTIONS FOR THE START BUTTON
    @IBAction func startSurvey(sender:AnyObject)
    {
     
    }
}

