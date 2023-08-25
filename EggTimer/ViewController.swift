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
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timerProgressView: UIProgressView!
    
    let eggTimerDic = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer: Timer?
    var countdown = 0
    var selectedCookingMethod = ""
    var alarm: AVAudioPlayer?
    
    override func viewDidLoad() {
        self.timerProgressView.isHidden = true
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        self.selectedCookingMethod = sender.currentTitle!
        self.titleLabel.text = self.selectedCookingMethod
        self.countdown = eggTimerDic[self.selectedCookingMethod]!
        self.startTimer()
        self.timerProgressView.isHidden = false
    }
    
}


// MARK: - TIMER
extension ViewController {
    
    func startTimer() {
        self.timerProgressView.progress = 0.0
        self.stopTimer()
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        self.timer?.invalidate()
        self.timer = nil
    }
    
    @objc func updateTime() {
        if self.countdown > 0 {
            print(countdown)
            self.countdown -= 1
            let totalTime = eggTimerDic[self.selectedCookingMethod]!
            let progress = Float(totalTime - countdown) / Float(totalTime)
            self.timerProgressView.progress = progress
        } else {
            self.stopTimer()
            self.titleLabel.text = "DONE!"
            self.timerProgressView.isHidden = true
            
            // PLAY ALARM
            guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }
            do {
                self.alarm = try AVAudioPlayer(contentsOf: url)
                self.alarm?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.titleLabel.text = "How do you like you like your eggs?"
                self.alarm?.stop()
            }
        }
    }
}
