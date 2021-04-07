//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Initialising a dictionary
//    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    let eggTimes = ["Soft": 5, "Medium": 10, "Hard": 15]
    var count = 0
    var totalTimerDuration = 0
    var timer = Timer()
    
    @IBOutlet weak var timerStatus: UILabel!
    @IBOutlet weak var timerProgress: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        count = 0
        timerProgress.progress = 0.0
        
        let hardness = sender.currentTitle! // Converting from Optional to String
        timerStatus.text = hardness
        
        totalTimerDuration = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)

    }
    
    @objc func update() {
        if(count <= totalTimerDuration) {
            timerProgress.progress = Float(count)/Float(totalTimerDuration)
            count += 1
        } else {
            timer.invalidate()
            timerStatus.text = "Done!"
        }
    }
    

}
