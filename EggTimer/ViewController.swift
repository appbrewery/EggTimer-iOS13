//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    
    let eggTime = ["Soft": 300, "Medium": 420, "Hard": 720]
    var secondsRemaining = 60
    let timer = Timer()
    
    @IBAction func hardEgg(_ sender: UIButton) {
        let hardness = sender.currentTitle
        
        secondsRemaining = eggTime[hardness!]!
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        
        switch hardness {
        case "Soft":
            print(eggTime[hardness!]!)
        case "Medium":
            print(eggTime[hardness!]!)
        case "Hard":
            print(eggTime[hardness!]!)
        default:
            print("Error")
        }
    }
    
    @objc func updateTimer(){
        if secondsRemaining > 0 {
            print("\(secondsRemaining) seconds")
            secondsRemaining -= 1 
        }
    }
    
}
