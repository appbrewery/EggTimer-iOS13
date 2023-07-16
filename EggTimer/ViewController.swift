//
//  ViewController.swift
//  EggTimer
//
//  Created by Prasshant Shanmugalingam on 08/07/2019.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    // A property to store the audio player
    var alarm: AVAudioPlayer?
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var ProgressBar: UIProgressView!
    @IBOutlet weak var TitleLabel: UILabel!
    let HARDNESS_TIME: [String : Int] = ["Soft": 320, "Medium": 420, "Hard": 720]
    var timer = Timer()
    var increment: Float = 0
    var progress: Float = 0.0
    @IBAction func EggHardness(_ sender: UIButton) {
        if let HARDNESS = sender.currentTitle {
            TitleLabel.text = "Timer started for \(HARDNESS) egg."
            timer.invalidate()
            if let time: Int = HARDNESS_TIME[HARDNESS] {
                increment = Float(100) / Float(time) / 100
                progress = 0.0
                timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            }
        }
    }
    @objc func updateTimer() {
        if progress < 1.0{
            progress += increment
            ProgressBar.progress = progress
        } else {
            playAlarm(fileName: "alarm_sound")
            TitleLabel.text = "Done"
            timer.invalidate()
        }
    }
    
    // A function that takes a sound file name as a parameter and plays the sound using AVAudioPlayer
    func playAlarm(fileName: String) {
      // Load the sound file from the app bundle with extension "wav"
      if let soundURL = Bundle.main.url(forResource: fileName, withExtension: "mp3") {
        do {
          // Initialize the audio player with the sound file URL
          alarm = try AVAudioPlayer(contentsOf: soundURL)
          // Set the delegate to self if you want to implement any of the AVAudioPlayerDelegate methods
          alarm?.delegate = self
          // Prepare to play
          alarm?.prepareToPlay()
          // Play the sound
          alarm?.play()
        } catch {
          // Handle any errors
          print(error.localizedDescription)
        }
      }
    }
    
    
}
