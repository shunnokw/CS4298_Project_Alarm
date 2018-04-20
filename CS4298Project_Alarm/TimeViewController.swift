//
//  TimeViewController.swift
//  CS4298Project_Alarm
//
//  Created by YEUNG Ching on 20/4/2018.
//  Copyright © 2018 CS5-MAC1. All rights reserved.
//

import UIKit
import UserNotifications

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
    

}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.badge, .sound, .alert])
    }
}

