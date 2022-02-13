//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    
    let eggTime = ["Soft": 10, "Medium": 420, "Hard": 720]
    var totalTime = 0;
    var secondsPassed = 0
    let timer = Timer()
    var player = AVAudioPlayer()
    
    @IBAction func hardEgg(_ sender: UIButton) {
        
        let hardness = sender.currentTitle
        
        totalTime = eggTime[hardness!]!
        
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
        if secondsPassed < totalTime {
            
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            print("\(percentageProgress)")
            progressBar.progress = percentageProgress
            
            secondsPassed += 1
        } else {
            timer.invalidate()
            textLabel.text = "DONE BC!"
            let path = Bundle.main.path(forResource: "alarm_sound", ofType : "mp3")!
                let url = URL(fileURLWithPath : path)
                do {
                    player = try AVAudioPlayer(contentsOf: url)
                    player.play()
                } catch {
                    print ("There is an issue with this code!")
                }
        }
    }
    
}
