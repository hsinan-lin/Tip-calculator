//
//  ViewController.swift
//  Tip calculator
//
//  Created by Christian Gesty on 19.05.20.
//  Copyright © 2020 codingenieur. All rights reserved.
//
//  Edited by HsinAn Lin.
//  1. UI improvements, including implementing auto layout and stack views, changing button design.
//  2. Tip and cost calculations.
//  3. Percent label can now reflect the values of the percent slider or the percentage buttons
//  4. Numbers are rounded to 2 decimal places.

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var personsCountTextField: UITextField!
    
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var percentSlider: UISlider!
    
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var centerButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    @IBOutlet weak var tipCostLabel: UILabel!
    @IBOutlet weak var totalCostLabel: UILabel!
    @IBOutlet weak var costPerPersonLabel: UILabel!
    
    var foodCost = 0.0
    var numOfPersons = 0.0
    var tipPercent = 0.1
    var tipCost = 0.0
    var totalCost = 0.0
    var costPerPerson = 0.0
    
    func buttonStyle(button: UIButton){
        //Make button border round
        button.layer.cornerRadius = 5
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Make button border round
        buttonStyle(button: leftButton)
        buttonStyle(button: centerButton)
        buttonStyle(button: rightButton)
        
        //Close keyboard by tapping anywhere
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
    }
    
    @IBAction func percentSlider(_ sender: UISlider) {
        //round value to 2 decimal places
        let roundValue = roundTo2Decimal(number: Double(sender.value))
        //Set tip percentage
        tipPercent = roundValue
        //Update percent label text
        percentLabel.text = "\(Int(tipPercent*100))%"
    }
    
    
    @IBAction func precentButton_Tapped(_ sender: UIButton) {
        //Set tip percentage
        if sender.titleLabel?.text == "10%"{
            tipPercent = 0.1
        }else if sender.titleLabel?.text == "15%"{
            tipPercent = 0.15
        }else if sender.titleLabel?.text == "20%"{
            tipPercent = 0.2
        }
        //Update percent slider value
        percentSlider.value = Float(tipPercent)
        //Update percent label text
        percentLabel.text = "\(Int(tipPercent*100))%"
        
    }
    
    func roundTo2Decimal(number: Double) -> Double{
        //Round values to 2 decimal places
        return Double(round(100*number)/100)
    }
    
    func calculate() {
        if (amountTextField.text != "") && (personsCountTextField.text != ""){
            //Do the math
            foodCost = Double(amountTextField.text!) ?? 0.0
            numOfPersons = Double(personsCountTextField.text!) ?? 0.0
            tipCost = foodCost * tipPercent
            totalCost = tipCost + foodCost
            costPerPerson = totalCost / numOfPersons
            
            //Round values to 2 decimal places
            tipCost = roundTo2Decimal(number: tipCost)
            totalCost = roundTo2Decimal(number: totalCost)
            costPerPerson = roundTo2Decimal(number: costPerPerson)
            
            //Update labels with calculated values
            tipCostLabel.text = "Tip:\t \(String((tipCost)))"
            totalCostLabel.text = "Total cost:\t \(String(totalCost))"
            costPerPersonLabel.text = "Cost per person:\t   \(String(costPerPerson))"
        }else{
            //print("Text fileds are empty!")
        }
    }
    
    @IBAction func valueChanged(_ sender: Any) {
        calculate()
    }
    
    func createAMessageWindow(message: String) {
        
    }
    
    func printUIElements() {
        
    }
    
}

