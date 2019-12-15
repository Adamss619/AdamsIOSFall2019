//
//  ViewControllerPlan.swift
//  FreedomWithFinance
//
//  Created by Spencer Adams on 12/15/19.
//  Copyright © 2019 Spencer Adams. All rights reserved.
//

import UIKit

class ViewControllerPlan: UIViewController {

    @IBOutlet var planAge: UILabel!
    @IBOutlet var retirementgoal: UILabel!
    @IBOutlet var yearsLabel: UILabel!
    @IBOutlet var totalValue: UILabel!
    @IBOutlet var posttax: UITextField!
    @IBOutlet var pretax: UITextField!
    @IBOutlet var taxable: UITextField!
    @IBOutlet var interest: UILabel!
    var total = 0.0
    var years = 0
    var age = ""
    var retireage = ""
    var posttaxvalue = ""
    var pretaxvalue = ""
    var taxablevalue = ""
    var annualexpenses = ""
    var withdraw = ""
    var contribution = ""
    var interestString = ""
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculatehit(_ sender: Any) {
        var posttaxInt = Double(posttaxvalue) ?? 0.0
        var pretaxInt = Double(pretaxvalue) ?? 0.0
        var taxableInt = Double(taxablevalue) ?? 0.0
        var annualInt = Double(annualexpenses) ?? 0.0
        var withdrawInt = Double(withdraw) ?? 0.0
        var contributionInt = Double(contribution) ?? 0.0
        var retireAgeInt = Int(retireage) ?? 0
        var ageInt = Int(age) ?? 0
        var interestInt = Double(interestString) ?? 0.0
                while(total*withdrawInt < annualInt){
                        total+=contributionInt
                        var inside = pow((Double(1 + interestInt)),1)-1
                        total += total * inside
                    years+=1
        
        
                }
        
        let y = Double(round(1000*(total))/1000);
        totalValue.text = "$"+String(y);
        
//        totalValue.text = String(total)
        interest.text = String(interestInt)
        planAge.text = String(ageInt+years)
        retirementgoal.text = String(retireAgeInt)
        //posttax.text = String(posttaxInt)
        //pretax.text = String(pretaxInt)
        //taxable.text = String(taxableInt)
        yearsLabel.text = String(years)
        
        if(years > retireAgeInt - ageInt){
            planAge.textColor = UIColor.red
        }else{
            planAge.textColor = UIColor.green
        }
        
    }
    //for loop that caluclates interest on all the accounts
    //needs to check the total of all accounts mutliplied by the savings rate
    //if that values is more than the annual expenses retirement has been reached.

    
    override func viewDidAppear(_ animated: Bool) {
        if let a = UserDefaults.standard.object(forKey: "Age") as? String {
            age = a
        }
        if let b = UserDefaults.standard.object(forKey: "Retire") as? String {
            retireage = b
        }
        if let c = UserDefaults.standard.object(forKey: "posttax") as? String {
            posttaxvalue = c
        }
        if let d = UserDefaults.standard.object(forKey: "pretax") as? String {
            pretaxvalue = d
        }
        if let e = UserDefaults.standard.object(forKey: "taxable") as? String {
            taxablevalue = e
        }
        if let f = UserDefaults.standard.object(forKey: "annual") as? String {
            annualexpenses = f
        }
        if let g = UserDefaults.standard.object(forKey: "withdraw") as? String {
            withdraw = g
        }
        if let h = UserDefaults.standard.object(forKey: "contribution") as? String {
            contribution = h
        }
        if let i = UserDefaults.standard.object(forKey: "interest") as? String {
            interestString = i
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
