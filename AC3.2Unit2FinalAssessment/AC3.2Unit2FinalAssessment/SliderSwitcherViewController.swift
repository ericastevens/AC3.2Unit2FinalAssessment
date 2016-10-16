//
//  SliderSwitcherViewController.swift
//  AC3.2Unit2FinalAssessment
//
//  Created by Erica Y Stevens on 10/6/16.
//  Copyright © 2016 Erica Stevens. All rights reserved.
//

import UIKit

class SliderSwitcherViewController: UIViewController {

    
    // MARK: Outlets
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var userInputForSliderAdjustment: UITextField!
    
    // MARK: Actions
    
    //Target-Action method
    //When slider value changes, it syncs this value with stepper value & updates label accordingly
    //Makes it so that the stepper is able to increment/decrement from the appropriate slider value
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        self.stepper.value = Double(sender.value)
        self.label.text = String(Int(sender.value))
    }
    
    //Target-Action method
    //Increments/Decrements slider value/position & updates label accordingly
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        self.slider.value = Float(sender.value)
        self.label.text = String(Int(sender.value))
    }
    
   //Target-Action method (?)
    //Adjusts slider based on user input. Checks to see if input is a number, then checks to see if the number falls within the slider range
    //If both checks pass, the number passed as input automatically updates the position/value of the slider as well as the value of the stepper
    @IBAction func userInputToAdjustSlider(_ sender: AnyObject) {
        if let userInput = Float(sender.text!) {
            self.slider.value = userInput
            self.stepper.value = Double(userInput)
            if userInput > self.slider.maximumValue || userInput < self.slider.minimumValue {
                self.label.text = "Please enter a number between \(Int(self.slider.minimumValue)) and \(Int(self.slider.maximumValue))"
            }
            else {
            self.label.text = String(Int(userInput))
            }
        } else {
            self.label.text = "Please enter a valid number"
        }

    }
    
    // MARK: Built-In Methods
    
    override func viewDidLoad() {
        label.text = String(Int(slider.value))
        stepper.minimumValue = Double(slider.minimumValue)
        stepper.maximumValue = Double(slider.maximumValue)
        super.viewDidLoad()
   
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


    
}
