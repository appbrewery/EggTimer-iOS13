//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    let eggTimes : [String : Int] = ["Soft": 3, "Medium": 4, "Hard": 7]
    var remainingTime: Int = 60
    var totalTime: Int = 0
    var timer = Timer()
    
    @IBOutlet weak var pageTitle: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        progressBar.progress = 0
        let hardness = sender.currentTitle!
        remainingTime = eggTimes[hardness]!
        totalTime = eggTimes[hardness]!
        pageTitle.text = hardness

        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
        }
    
    @objc func update() {
        if remainingTime > 0 {
            print(remainingTime)
            remainingTime -= 1
       
            progressBar.progress = Float(totalTime - remainingTime) / Float(totalTime)
        } else {
            timer.invalidate()
            pageTitle.text = "DONE!"
            progressBar.progress = 1

        }
        
}
    

    

}
