//
//  StartQuestionView.swift
//  MoodTriggers
//
//  Created by Daniel Levine on 3/28/16.
//  Copyright © 2016 PSU Dan. All rights reserved.
//

import UIKit

class StartQuesitonView: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    //OUTLET FOR THE MAIN LABEL AND NEXT BUTTON IN THE VIEW
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerPicker: UIPickerView!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var textAnswer: UITextField!
    @IBOutlet var timePicker: UIDatePicker!
    @IBOutlet var finishButton: UIButton!
    
    //FUNC DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        answerPicker.dataSource = self
        answerPicker.delegate = self
    }
    
    //QUESITONS FOR THE INTIAL SURVEY
    let questions: [String] = ["What is your sex?",
                               "What is your age?",
                               "What is your ethnicity?",
                               "Does anyone or any pet regularly sleep with you in your bed?",
                               "What time do you wake up on the weekdays?",
                               "What time do you wake up on the weekends?",
                               "What time do you go to bed on weekdays?",
                               "What time do you go to bed on weekends?",
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
        //MAKE THE DATE PICKER VISIBLE FOR Q 5- 8
        if(currentQIndex == 4 || currentQIndex == 5 || currentQIndex == 6 || currentQIndex == 7)
        {
            timePicker.hidden = false
        }
        else
        {
            timePicker.hidden = true
        }
        //IF THE SURVEY IS DONE THEN DISPLAY THE FINISHED BUTTON
        if(currentQIndex == 8)
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