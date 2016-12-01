//
//  FirstViewController.swift
//  ResistorCalculator
//
//  Created by David Wang on 11/27/16.
//  Copyright © 2016 DW. All rights reserved.
//
// To do: Change the color of each of the rows

import UIKit

// exponent function
infix operator ^^ { associativity left precedence 160 }
func ^^ (radix: Int, power: Int) -> Int {
    return Int(pow(Double(radix), Double(power)))
}


class FirstViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {
    
    


    @IBOutlet weak var picker1: UIPickerView!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    let pickerData = ["Black", "Brown", "Red", "Orange", "Yellow", "Green", "Blue", "Violet", "Grey", "White", "Gold", "Silver"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        super.viewDidLoad()
        picker1.dataSource = self
        picker1.delegate = self
        
        
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 4
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
            {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //myLabel.text = pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        // LOOK AGAIN AT THIS CODE
        let pickerLabel = UILabel()
        let titleData = pickerData[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 14.0)!,NSForegroundColorAttributeName:UIColor.black])
        pickerLabel.attributedText = myTitle
        pickerLabel.textAlignment = .center
        //pickerLabel.backgroundColor = UIColor(hue: 1, saturation: 1.0, brightness:1.0, alpha: 1.0)
        return pickerLabel

    }
    
    /*func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        var attributedString: NSAttributedString!
        
        switch component {
        case 0:
            attributedString = NSAttributedString(string: pickerData[row], attributes: [NSForegroundColorAttributeName : UIColor.red])
        case 1:
            attributedString = NSAttributedString(string: pickerData[row], attributes: [NSForegroundColorAttributeName : UIColor.blue])
        case 2:
            attributedString = NSAttributedString(string: pickerData[row], attributes: [NSForegroundColorAttributeName : UIColor.yellow])
        default:
            attributedString = nil
        }
        
        return attributedString
    }
    
    func pickerView(_: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            println(pickerData[row])
        case 1:
            println(pickerData[row])
        case 2:
            println(pickerData[row])
        default:
            break
        }*/
    
    
    @IBAction func calculateButton(_ sender: Any) {
        
        // code for the calculation
        
        let firstColor = picker1.selectedRow(inComponent: 0)
        let secondColor = picker1.selectedRow(inComponent: 1)
        let thirdColor = 10^^picker1.selectedRow(inComponent: 2)
        
        var resistorValue: Int
        
        resistorValue = Int(String(firstColor) + String(secondColor))!
        resistorValue = resistorValue * thirdColor
        
        print(resistorValue)
        
        if resistorValue < 999
        
        {
            resultLabel.text = String(resistorValue) + "\u{2126}"
            
        } else if resistorValue < 99999 {
            
            resistorValue /= 1000
            resultLabel.text = String(resistorValue) + "k\u{2126}"
            
        } else {
            
            resistorValue /= 1000000
            resultLabel.text = String(resistorValue) + "M\u{2126}"
            
        }
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

