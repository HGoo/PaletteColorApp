//
//  ViewController.swift
//  PaletteColor
//
//  Created by Николай Петров on 14.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var colorField: UIView!
    
    @IBOutlet var redTune: UISlider!
    @IBOutlet var greenTune: UISlider!
    @IBOutlet var blueTune: UISlider!
    
    @IBOutlet var redDisplayValue: UITextField!
    @IBOutlet var greenDisplayValue: UITextField!
    @IBOutlet var blueDisplayValue: UITextField!
    
    @IBOutlet var redDisplayLaible: UILabel!
    @IBOutlet var greenDisplayLaible: UILabel!
    @IBOutlet var blueDisplayLaible: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorField.layer.cornerRadius = colorField.frame.width / 12
        
        //Setup slider
        redTune.value = 0.75
        greenTune.value = 0.5
        blueTune.value = 0.25
        
        redTune.minimumValue = 0
        redTune.maximumValue = 1
        greenTune.minimumValue = 0
        greenTune.maximumValue = 1
        blueTune.minimumValue = 0
        blueTune.maximumValue = 1
    
        redDisplayValue.text = String((round(redTune.value * 100) / 100))
        greenDisplayValue.text = String((round(greenTune.value * 100) / 100))
        blueDisplayValue.text = String((round(blueTune.value * 100) / 100))
        redDisplayValue.delegate = self
        
        redDisplayLaible.text = String(redTune.value)
        greenDisplayLaible.text = String(greenTune.value)
        blueDisplayLaible.text = String(blueTune.value)
        
        let rtoolBar = UIToolbar(frame: CGRect(x: 0, y: 0,
                                              width: view.frame.size.width,
                                              height: 50))
        let gtoolBar = UIToolbar(frame: CGRect(x: 0, y: 0,
                                              width: view.frame.size.width,
                                              height: 50))
        let btoolBar = UIToolbar(frame: CGRect(x: 0, y: 0,
                                              width: view.frame.size.width,
                                              height: 50))
        
        let flexibleSpace  = UIBarButtonItem(barButtonSystemItem: .fixedSpace,
                                             target: self,
                                             action: nil)
        
        let rdoneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(inputColorValue))
        let gdoneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(greenInputColor))
        let bdoneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(blueUnputColor))
        
        
        rtoolBar.items = [flexibleSpace, rdoneButton]
        rtoolBar.sizeToFit()
        gtoolBar.items = [flexibleSpace, gdoneButton]
        gtoolBar.sizeToFit()
        btoolBar.items = [flexibleSpace, bdoneButton]
        btoolBar.sizeToFit()
        redDisplayValue.inputAccessoryView = rtoolBar
        greenDisplayValue.inputAccessoryView = gtoolBar
        blueDisplayValue.inputAccessoryView = btoolBar
        
    }
        
    @IBAction func changeRedTune() {
        let redValue = String((round(redTune.value * 100) / 100))
        
        redDisplayValue.text = redValue
        redDisplayLaible.text = redValue
        colorField.backgroundColor = UIColor(displayP3Red: CGFloat(redTune.value),
                                             green: CGFloat(greenTune.value),
                                             blue: CGFloat(blueTune.value),
                                             alpha: 1
        )
    }
    
    
    @IBAction func changeGreenTune() {
        let greenValue = String((round(greenTune.value * 100) / 100))
        
        greenDisplayLaible.text = greenValue
        greenDisplayValue.text = greenValue
        colorField.backgroundColor = UIColor(displayP3Red: CGFloat(redTune.value),
                                             green: CGFloat(greenTune.value),
                                             blue: CGFloat(blueTune.value),
                                             alpha: 1
        )
    }
    
    
    @IBAction func changeBlueTune() {
        let blueValue = String((round(blueTune.value * 100) / 100))
        
        blueDisplayLaible.text = blueValue
        blueDisplayValue.text = blueValue
        colorField.backgroundColor = UIColor(displayP3Red: CGFloat(redTune.value),
                                             green: CGFloat(greenTune.value),
                                             blue: CGFloat(blueTune.value),
                                             alpha: 1
        )
    }
        
    @IBAction func inputColorValue() {
        redDisplayValue.resignFirstResponder()
        colorField.backgroundColor = UIColor(displayP3Red: CGFloat(Double(redDisplayValue.text!)!),
                                             green: CGFloat(greenTune.value),
                                             blue: CGFloat(blueTune.value),
                                             alpha: 1)
        redTune.value = Float(redDisplayValue.text!)!
        redDisplayLaible.text = String(redDisplayValue.text!)
        
    }
    
    @IBAction func greenInputColor() {
        greenDisplayValue.resignFirstResponder()
        colorField.backgroundColor = UIColor(displayP3Red: CGFloat(redTune.value),
                                             green: CGFloat(Double(greenDisplayValue.text!)!),
                                             blue: CGFloat(blueTune.value),
                                             alpha: 1)
        greenTune.value = Float(greenDisplayValue.text!)!
        greenDisplayLaible.text = String(greenDisplayValue.text!)
    }
    
    @IBAction func blueUnputColor() {
        blueDisplayValue.resignFirstResponder()
        colorField.backgroundColor = UIColor(displayP3Red: CGFloat(redTune.value),
                                             green: CGFloat(greenTune.value),
                                             blue: CGFloat(Double(blueDisplayValue.text!)!),
                                             alpha: 1)
        blueTune.value = Float(blueDisplayValue.text!)!
        blueDisplayLaible.text = String(blueDisplayValue.text!)
    }
    
}


extension ViewController: UITextFieldDelegate {
}
//asfsd
