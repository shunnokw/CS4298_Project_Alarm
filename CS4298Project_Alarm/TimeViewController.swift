//
//  TimeViewController.swift
//  CS4298Project_Alarm
//
//  Created by YEUNG Ching on 20/4/2018.
//  Copyright © 2018 CS5-MAC1. All rights reserved.
//

import UIKit

class TimeViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    var timeString = ""
    weak var delegate: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = timeString
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