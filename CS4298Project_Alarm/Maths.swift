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
    
    let alarm = ViewController()
    
    var num1: Int = 0
    var num2: Int = 0
    var symbolController: Int = 0
    var answer1: Int?
    var answer2: Int?
    var answer3: Int?
    var completeAns: Int = 0
    
    var isPlus: Bool = true
    var inputController: Int = 0
    
    @IBOutlet weak var showNum1: UILabel!
    @IBOutlet weak var showNum2: UILabel!
    @IBOutlet weak var showSymbol: UILabel!
    @IBOutlet weak var showAnswer1: UILabel!
    @IBOutlet weak var showAnswer2: UILabel!
    @IBOutlet weak var showAnswer3: UILabel!
    
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
        
        initialLabel()
    }
    @IBAction func submit(_ sender: Any) {
        if(answer3 == nil){
            if(answer2 == nil){
                completeAns = answer1!
            }
            else{
                completeAns = answer1!*10 + answer2!
            }
        }
        else{
            completeAns = answer1!*100 + answer2!*10 + answer3!
        }
        
        print("My ans", completeAns)
        if(isCorrect(ans: completeAns) == true){
            print("Correct")
            initialPara()
            self.present(alarm.stopAlarm(), animated: true, completion: nil)
        }
        else{
            print("Wrong")
            let alert2 = UIAlertController(title: "Wrong!", message: "Please try again to stop the alarm", preferredStyle: UIAlertControllerStyle.alert)
            alert2.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                    
                case .cancel:
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                    
                    
                }}))
            self.present(alert2, animated: true, completion: nil)
        }
    }
    
    func isCorrect(ans:Int) -> Bool {
        var realAns:Int
        if (isPlus == true){
            realAns = num1+num2
            print("The real sum ans", realAns)
            if (ans == realAns){
                return true
            }
        }
        else{
            realAns = num1-num2
            print("The real minus ans", realAns)
            if (ans == realAns){
                return true
            }
        }
        return false
    }
    
    func addAns(sub:Int) -> Void {
        switch inputController {
        case 0:
            answer1 = sub
            showAnswer1.text = String(answer1!)
            inputController += 1
            break
        case 1:
            answer2 = sub
            showAnswer2.text = String(answer2!)
            inputController += 1
            break
        case 2:
            answer3 = sub
            showAnswer3.text = String(answer3!)
            inputController += 1
            break
        
        default: break
            
        }
    }
    
    func initialLabel() {
        //Initialize
        if showAnswer1.text != nil {
            showAnswer1.text = nil
            showAnswer2.text = nil
            showAnswer3.text = nil
            answer3 = nil
        }
    }
    
    func initialPara() {
        //Generate random number
        num1 = 0
        num2 = 0
        
        repeat {
            num1 = Int(arc4random_uniform(100))
            num2 = Int(arc4random_uniform(100))
        } while num2>num1
        
        symbolController = Int(arc4random_uniform(2))
        
        showNum1.text = String(num1)
        showNum2.text = String(num2)
        
        if symbolController==0 {
            showSymbol.text = "+"
            isPlus = true
        }
        else {
            showSymbol.text = "-"
            isPlus = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialLabel()
        initialPara()
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
