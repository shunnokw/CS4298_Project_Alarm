//
//  ViewController.swift
//  testAlarm
//
//  Created by YEUNG Ching on 13/4/2018.
//  Copyright © 2018 YEUNG Ching. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var datePicker: UIDatePicker!
    let center = UNUserNotificationCenter.current()
    let content = UNMutableNotificationContent()
    let dateFormatter = DateFormatter()
    var date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.date = Date()
        let options: UNAuthorizationOptions = [.alert, .sound];
        center.requestAuthorization(options: options) {
            (granted, error) in
            if granted {
                self.setNotification()
            }
            if !granted {
                print("Something went wrong")
            }
        }
        center.getNotificationSettings { (settings) in
            if settings.authorizationStatus != .authorized {
                // Notifications not allowed
            }
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func setAlarm(_ sender: Any) {
        
        dateFormatter.timeZone = NSTimeZone.default
        dateFormatter.timeStyle = .short
        dateFormatter.dateStyle = .short
        dateFormatter.locale = NSLocale.system
        
        date = datePicker.date
        
        content.title = "Alarm"
        content.badge = 1
        content.sound = UNNotificationSound(named: "bell.wav")
        
        
        var triggerDate = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second,], from: date)
        triggerDate.second = 0
        print(triggerDate)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        
        let identifier = "UYLLocalNotification"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        
        
        
        center.add(request, withCompletionHandler: { (error) in
            if error != nil {
                // Something went wrong
            }
        })
        
        let tvc = TimeViewController()
        tvc.timeString = dateFormatter.string(from: date)
        
        let alert = UIAlertController(title: "Set alarm successsfully!", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("success")
            self.performSegue(withIdentifier: "segue", sender: self)
        }))
        
        self.present(alert, animated: true, completion: nil)
    
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "segue") {
            let tvc : TimeViewController = segue.destination as! TimeViewController
            tvc.timeString = dateFormatter.string(from: date)
        }
    }
    
    
    func setNotification() {
        let snoozeAction = UNNotificationAction(identifier: "Snooze",
                                                title: "Snooze", options: [.destructive])
        let deleteAction = UNNotificationAction(identifier: "UYLDeleteAction",
                                                title: "Stop Alarm", options: [.foreground])
        let category = UNNotificationCategory(identifier: "UYLReminderCategory",
                                              actions: [snoozeAction,deleteAction],
                                              intentIdentifiers: [], options: [])
        center.setNotificationCategories([category])
        content.categoryIdentifier = "UYLReminderCategory"
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}





