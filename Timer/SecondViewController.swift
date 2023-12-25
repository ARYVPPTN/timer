//
//  SecondViewController.swift
//  Timer
//
//  Created by Alvar Yussupov on 18/12/23.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var time = 0
    
    var startTime = 0
    
    var timer = Timer()
    
    var isTimerRunning = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = timeToString(intTime: time)
        
        startTime = time
    }
    
    @objc func countTime() {
        time -= 1
        
        label.text = timeToString(intTime: time)
        
        if time == 0 {
            timer.invalidate()
//            isTimerRunning = false
        }
    }
    
    @IBAction func startTimer(_ sender: Any) {
        if isTimerRunning {
            return
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1 , target: self, selector: #selector(countTime), userInfo: nil, repeats: true)
        isTimerRunning = true 
    }
    
    @IBAction func pauseTimer(_ sender: Any) {
        timer.invalidate()
        isTimerRunning = false
    }
     
    @IBAction func restartTimer(_ sender: Any) {
        timer.invalidate()
        time = startTime
        isTimerRunning = false
        label.text = timeToString(intTime: time)
    }
    
    func timeToString(intTime: Int) -> String {
        let seconds = intTime % 60
        let minutes = (intTime / 60) % 60
        let hours = intTime / 3600
        return String(format: "%0.2d:%0.2d:%0.2d", hours, minutes, seconds)
    }
}
