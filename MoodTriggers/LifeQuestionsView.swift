//
//  LifeQuestionsView.swift
//  MoodTriggers
//
//  Created by Daniel Levine on 3/28/16.
//  Copyright © 2016 PSU Dan. All rights reserved.
//

import UIKit

class LifeQuestionsView: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    //OUTLET FOR THE MAIN LABEL AND NEXT BUTTON IN THE VIEW
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerPicker: UIPickerView!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var textAnswer: UITextField!
    @IBOutlet var finishButton: UIButton!
    
    //FUNC DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        answerPicker.dataSource = self
        answerPicker.delegate = self
    }
    
    //QUESITONS FOR THE INTIAL SURVEY
    let questions: [String] = ["I found myself getting upset by quite trivial things",
                               "I was aware of dryness of my mouth",
                               "I couldn't seem to experience any positive feeling at all",
                               "I experienced breathing difficulty (eg. excessively rapid breathing, breathlessness in the absence of physical exertion).",
                               "I just couldn't seem to get going",
                               "I tended to over-react to situations",
                               "I had a feeling of shakiness (eg. legs going to give away).",
                               "I found myself in situations that made me so anxious I was relieved when they ended",
                               "I felt that I had nothing to look forward to",
                               "I found myself getting upset rather easily",
                               "I felt that I was using a lot of nervous energy",
                               "I felt sad and depressed",
                               "I found myself getting impatient when I was delayed in any way(eg. lifts, traffic lights, being kept waiting)",
                               "I had a feeling of faintness",
                               "I felt that I had lost interest in just about everything",
                               "I felt that I was rather touchy",
                               "I perspired noticeably (eg. hands sweaty) in absence of high temperatures or physical exertion",
                               "I felt scared without any good reason",
                               "I felt that life wasn't worthwhile",
                               "Finished!"]
    
    var answerOne: [String] = ["", "Male", "Female"]
    let allAnswers: [[String]] = [["", "Male", "Female"],
                                  [],
                                  ["", "Caucasian", "African American", "Hispanic/Lation", "Asian American", "Native American", "Multiracial/MultiEthnic", "Other"],
                                  ["", "Yes", "No"]]
    
    var currentQIndex: Int = 0
    
    //STARTS AND PROGESSES THE SURVEY
    @IBAction func startSurvey(sender: AnyObject)
    {
        //MAKE THE ANSWER PICKER NOT HIDDEN FOR Qs 1, 3, 4
        if(currentQIndex == 0 || currentQIndex == 2 || currentQIndex == 3)
        {
            answerPicker.hidden = false
            
            //UPDATE THE ANSWERS
            answerOne = allAnswers[currentQIndex]
        }
        else
        {
            answerPicker.hidden = true
        }
        //MAKE THE TEXTFIELD VISIBLE FOR Q 2
        if(currentQIndex == 1)
        {
            textAnswer.hidden = false
        }
        else
        {
            textAnswer.hidden = true
        }
        //IF THE SURVEY IS DONE THEN DISPLAY THE FINISHED BUTTON
        if(currentQIndex == 15)
        {
            nextButton.hidden = true
            finishButton.hidden = false
        }
        
        //UPDATE THE QUESTION TEXT
        answerPicker.reloadAllComponents()
        questionLabel.text = questions[currentQIndex]
        currentQIndex += 1
    }
    
    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return answerOne.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return answerOne[row]
    }
}