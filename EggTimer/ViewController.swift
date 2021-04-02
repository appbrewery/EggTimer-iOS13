//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    
    var seconds = 60
    var timer = Timer()
    var isTimerRunning = false
    var resumeTapped = false
    // create a dictionary with a key and a value
    // let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    let eggTimes : [String: Int] = ["Soft": 5, "Medium": 7, "Hard": 12]
    
    // This method call initializes the timer.
    // It specifies the timeInterval (how often the a method will be called)
    // and the selector (the method being called).
    // The interval is measured seconds so for it to perform like a standard clock
    // we should set this argument to 1.
    //
    func runTimer() {
         timer = Timer.scheduledTimer(timeInterval: 1, target: self,
          selector: (#selector(ViewController.updateTimer)),
           userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        seconds -= 1     //This will decrement(count down)the seconds.
        countdownTimer.text = String(seconds) //This will update the label.
    }
   

    @IBOutlet weak var countdownTimer: UILabel!
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        runTimer()
    }
    
    @IBAction func pauseButtonTapped(_ sender: UIButton) {
        if resumeTapped == false {
             timer.invalidate()
             resumeTapped = true
        } else {
             runTimer()
             resumeTapped = false
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        seconds = 60
        countdownTimer.text = String(seconds)
    }
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        // print(sender.currentTitle!)
        
        let hardness = sender.currentTitle!
        
       // the questions marks are stripped out with the ?? ""
        print(eggTimes[hardness] ?? "")
        
       // alternatively, the longer way is use an IF Statement
    }
    
    
    
}
