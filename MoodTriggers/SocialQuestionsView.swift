//
//  SocialQuestionsView.swift
//  MoodTriggers
//
//  Created by Daniel Levine on 3/28/16.
//  Copyright © 2016 PSU Dan. All rights reserved.
//

import UIKit

class SocialQuestionsView: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
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
    let questions: [String] = ["In social situations where it is possible that you will be noticed or evaluated by other people, do you feel excessively nervous, fearful, or uncomfortable?",
                               "Do you tend to be overly worried that you may act in a way that might embarrass or humiliate yourself in front of other people, or that others may not think well of you?",
                               "Do you try to avoid social situations?",
                               "?????",
                               "How often do you avoid parties?",
                               "?????",
                               "How often do you avoid meetings?",
                               "?????",
                               "How often do you avoid becoming the focus of attention?",
                               "?????",
                               "How often do you avoid dating circumstances?",
                               "?????",
                               "How often do you avoid meeting people in authority?",
                               "?????",
                               "How often do you avoid speaking with people in authority?",
                               "?????",
                               "How often do you avoid saying no to unreasonable requests?",
                               "?????",
                               "How often do you avoid a first date?",
                               "?????",
                               "How often do you avoid of asking others to do something differently",
                               "?????",
                               "How often do you avoid being introduced?",
                               "?????",
                               "How often do you avoid initiating a conversation?",
                               "?????",
                               "How often do you avoid keeping a conversation going?",
                               "?????",
                               "How often do you avoid giving a speech?",
                               "?????",
                               "How often do you avoid others judging you?",
                               "?????",
                               "How often do you avoid being under observation by others?",
                               "?????",
                               "How often do you avoid being teased?",
                               "Do you tend to experience fear each time you are in feared social situations?",
                               "Does the fear come on as soon as you encounter feared social situations?",
                               "Would you say that your social fear is excessive or unreasonable?",
                               "To whay degree does your social fear inter fere with your life, work, social activites, family, etc.?",
                               "How distressing do you find your social fear?",
                               "Has what you have been able to achieve in your job or in school been negatively affected by your social fear?",
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