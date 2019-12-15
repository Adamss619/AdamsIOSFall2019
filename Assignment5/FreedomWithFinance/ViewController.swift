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
    
    @IBOutlet weak var number1: UITextField! //starting amount
    @IBOutlet weak var number2: UITextField! //years
    @IBOutlet var interest: UITextField!
    @IBOutlet var contribution: UITextField!
    @IBOutlet weak var calculate: UIButton!
   
    @IBOutlet weak var CalculatedLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //label1.text = "Freedom With Finance"
        CalculatedLabel.text = ""
        

        // Do any additional setup after loading the view.
    }


    @IBAction func calculateNumber(_ sender: Any) {
        
        let starting = number1.text
        let years = number2.text
        let interest1 = interest.text
        let contribution1 = contribution.text
        
        var startingInt = Double(starting!) ?? 0
        let yearsInt = Int(years!) ?? 0
        let interestInt = Double(interest1!) ?? 0
        let contributionInt = Double(contribution1!) ?? 0
        
        var count = 0.0;
        //$10,000 [(1 + 0.05)3 – 1]
        //principle [(1 + interest)^years -1]
        var i = 0
        while(i<yearsInt) {
            startingInt+=contributionInt
            var inside = pow((Double(1 + interestInt)),1)-1
            count += startingInt * inside
            i+=1;
        }
        
        let y = Double(round(1000*(count+startingInt))/1000);
        CalculatedLabel.text = "$"+String(y);

    }
}

