//
//  Shake2Stop.swift
//  CS4298Project_Alarm
//
//  Created by Jason Wong on 26/4/2018.
//  Copyright © 2018 CS5-MAC1. All rights reserved.
//

import UIKit

class Shake2Stop: UIViewController {
    
    let alarm = ViewController()
    var shakeCount: Int = 0
    
    @IBOutlet weak var showShakeCount: UILabel!
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEventSubtype.motionShake
        {
            if shakeCount < 10 {
                shakeCount += 1
                showShakeCount.text = String(shakeCount)
            }
            if shakeCount == 10{
                self.present(alarm.stopAlarm(), animated: true, completion: nil)
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Enter viewDidAppear")
        let alert = UIAlertController(title: "Shake!", message: "Please shake 10 times to stop the alarm", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
            }}))
        self.present(alert, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
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
