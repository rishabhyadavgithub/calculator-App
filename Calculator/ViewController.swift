//
//  ViewController.swift
//  Calculator
//
//  Created by rishabh.yadav on 6/26/17.
//  Copyright © 2017 rishabh.yadav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var performingMath = false
    var operation = 0
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: Any) {
        
        if performingMath == true{
            label.text = String((sender as AnyObject).tag-1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
        }else{
        
        label.text = label.text! + String((sender as AnyObject).tag-1)
        numberOnScreen = Double(label.text!)!
        
        }
    }
    
    @IBAction func buttons(_ sender: Any) {
        
        if label.text != "" && (sender as AnyObject).tag != 11 && (sender as AnyObject).tag != 16
        {
            previousNumber = Double(label.text!)!
            
            if (sender as AnyObject).tag == 12 //Divide
            {
              label.text = "%"
            }
            else if (sender as AnyObject).tag == 13 //Multiply
            {
              label.text = "x"
            }
            else if (sender as AnyObject).tag == 14 //Minus
            {
                label.text = "-"
            }
            else if (sender as AnyObject).tag == 15 //Plus
            {
               label.text = "+"
            }
            operation = (sender as AnyObject).tag
            performingMath = true
            
        }
        else if (sender as AnyObject).tag == 16{
            if operation == 12{
                
                label.text = String(previousNumber / numberOnScreen)
                
            }
            else if operation == 13{
                
                label.text = String(previousNumber * numberOnScreen)
                
            }
            else if operation == 14{
                
                label.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15{
                
                label.text = String(previousNumber + numberOnScreen)
                
            }
        }
        else if (sender as AnyObject).tag == 11
        {
            label.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

  

}

