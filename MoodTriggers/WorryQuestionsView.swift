//
//  WorryQuestionView.swift
//  MoodTriggers
//
//  Created by Daniel Levine on 3/28/16.
//  Copyright © 2016 PSU Dan. All rights reserved.
//

import UIKit

class WorryQuestionsView: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
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
    let questions: [String] = ["Do you experience excessive worry?",
                               "Is your worry excessive in intensity, frequency, or amount of distress it causes?",
                               "Do you find it difficult to control your worry (or stop worrying) once it starts?",
                               "Do you worry excessively and uncontrollably about minor things such as being late for an appointment, minor repairs, homework, etc.?",
                               "Please list the most frequent topics about which you worry excessively and uncontrollably:",
                               "During the last six months, have you often been bothered by excessive and uncontrollable worries more days than not?",
                               "During the last six months, have you often been bothered by restlessness or feeling keyed up or on edge more days than not?",
                               "During the last six months, have you often been bothered by difficulty falling/staying asleep or restless/unsatisfying sleep more days than not?",
                               "During the last six months, have you often been bothered by difficulty concentrating or your mind going blank more days than not?",
                               "During the last six months, have you often been bothered by irritability more days than not?",
                               "During the last six months, have you often been bothered by being easily fatigues more days than not?",
                               "During the last six months, have you often been bothered by muscle tension more days than not?",
                               "How much do worry and physical symptoms interfere with your life, work, social activities, family, etc.?",
                               "How much are you bothered by worry and physical symptoms (how much distress does it cause you)?",
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
        if(currentQIndex == 14)
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