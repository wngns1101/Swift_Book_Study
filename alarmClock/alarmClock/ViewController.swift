//
//  ViewController.swift
//  alarmClock
//
//  Created by juhoon lee on 2023/02/17.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var currentTime: UILabel!
    @IBOutlet var date: UIDatePicker!
    @IBOutlet var selectTime: UILabel!
    
    var alarmTime = ""
    var clickAlert = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let pickerDate = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        selectTime.text = formatter.string(from: pickerDate.date)
        
        let alarmFormatter = DateFormatter()
        formatter.dateFormat = "hh:mm:aaa"
        alarmTime = formatter.string(from: pickerDate.date)
    }
    
    @objc func updateTime(){
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        currentTime.text = formatter.string(from: date as Date)
        
        if clickAlert == true{
            return
        }
        
        let currentFormatter = DateFormatter()
        formatter.dateFormat = "hh:mm:aaa"
        let updateTime = formatter.string(from: date as Date)
        
        if alarmTime == updateTime{
            let alarm = UIAlertController(title: "알림", message: "설정된 시간입니다!!", preferredStyle: UIAlertController.Style.alert)
            let pass = UIAlertAction(title: "네 알겠습니다.", style: UIAlertAction.Style.default){UIAlertAction in
                self.clickAlert = true
            }
            alarm.addAction(pass)
            present(alarm, animated: true, completion: nil)
        }
    }
}

