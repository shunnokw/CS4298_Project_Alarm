//
//  Maths.swift
//  CS4298Project_Alarm
//
//  Created by Jason Wong on 25/4/2018.
//  Copyright © 2018 CS5-MAC1. All rights reserved.
//

import UIKit
import Darwin

class Maths: UIViewController {
    
    var num1: Int = 0
    var num2: Int = 0
    var symbolController: Int = 0
    var answer1: Int = 0
    var answer2: Int = 0
    var answer3: Int = 0
    var answer4: Int = 0
    
    var inputController: Int = 0
    
    @IBOutlet weak var showNum1: UILabel!
    @IBOutlet weak var showNum2: UILabel!
    @IBOutlet weak var showSymbol: UILabel!
    @IBOutlet weak var showAnswer1: UILabel!
    @IBOutlet weak var showAnswer2: UILabel!
    @IBOutlet weak var showAnswer3: UILabel!
    @IBOutlet weak var showAnswer4: UILabel!
    
    @IBAction func onClick0(_ sender: Any) {
        addAns(sub: 0)
    }
    @IBAction func onClick1(_ sender: Any) {
        addAns(sub: 1)
    }
    @IBAction func onClick2(_ sender: Any) {
        addAns(sub: 2)
    }
    @IBAction func onClick3(_ sender: Any) {
        addAns(sub: 3)
    }
    @IBAction func onClick4(_ sender: Any) {
        addAns(sub: 4)
    }
    @IBAction func onClick5(_ sender: Any) {
        addAns(sub: 5)
    }
    @IBAction func onClick6(_ sender: Any) {
        addAns(sub: 6)
    }
    @IBAction func onClick7(_ sender: Any) {
        addAns(sub: 7)
    }
    @IBAction func onClick8(_ sender: Any) {
        addAns(sub: 8)
    }
    @IBAction func onClick9(_ sender: Any) {
        addAns(sub: 9)
    }
    @IBAction func onClickDel(_ sender: Any) {
        inputController = 0
        answer1 = 0
        answer2 = 0
        answer3 = 0
        answer4 = 0
        initial()
  
    }
    @IBAction func submit(_ sender: Any) {
        let alertController =
    }
    
    func addAns(sub:Int) -> Void {
        switch inputController {
        case 0:
            answer1 = sub
            showAnswer1.text = String(answer1)
            inputController += 1
            break
        case 1:
            answer2 = sub
            showAnswer2.text = String(answer2)
            inputController += 1
            break
        case 2:
            answer3 = sub
            showAnswer3.text = String(answer3)
            inputController += 1
            break
        case 3:
            answer4 = sub
            showAnswer4.text = String(answer4)
            inputController += 1
            break
        default: break
            
        }
    }
    
    func initial() {
        //Initialize
         showAnswer1.text = ""
         showAnswer2.text = ""
         showAnswer3.text = ""
         showAnswer4.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initial()
        
        // Do any additional setup after loading the view.
        
        //Generate random number
        repeat {
            num1 = Int(arc4random_uniform(100))
            num2 = Int(arc4random_uniform(100))
        } while num2>num1
        
        symbolController = Int(arc4random_uniform(2))
        
        showNum1.text = String(num1)
        showNum2.text = String(num2)
        
        if symbolController==0 {
            showSymbol.text = "+"
        }
        else {
            showSymbol.text = "-"
        }
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
