//
//  ViewController.swift
//  FreedomWithFinance
//
//  Created by Spencer Adams on 9/17/19.
//  Copyright © 2019 Spencer Adams. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var number1: UITextField!
    @IBOutlet weak var number2: UITextField!
    @IBOutlet weak var calculate: UIButton!
   
    @IBOutlet weak var CalculatedLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label1.text = "Freedom With Finance"
        CalculatedLabel.text = ""
        

        // Do any additional setup after loading the view.
    }


    @IBAction func calculateNumber(_ sender: Any) {
        let number1field = number1.text
        let number2field = number2.text
        
        
        let intField1 = Int(number1field!) ?? 0
        let intField2 = Int(number2field!) ?? 0
        
        CalculatedLabel.text = String(intField1 + intField2)
        let outputString = String(intField1 + intField2)
        let outputString1 = String(intField1)
        let outputString2 = String(intField2)
        
        
        var logArray = UserLogController.loggingList()
        logArray.append(outputString)
        logArray.append(outputString1)
        logArray.append(outputString2)
        
        print(UserLogController.loggingList())
        UserLogController.logNewEvent(newEventToLog: outputString)
        UserLogController.logNewEvent(newEventToLog: outputString1)
        UserLogController.logNewEvent(newEventToLog: outputString2)
        
        
        
    }
}

