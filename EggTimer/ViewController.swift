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
    
    // create a dictionary with a key and a value
    // let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    let eggTimes : [String: Int] = ["Soft": 5, "Medium": 7, "Hard": 12]
    

    @IBAction func hardnessSelected(_ sender: UIButton) {
        // print(sender.currentTitle!)
        
    
        
    
        let hardness = sender.currentTitle

        if (hardness == "Soft") {
            print(softTime)
        } else if (hardness == "Medium") {
            print(mediumTime)
        } else if (hardness == "Hard") {
            print(hardTime)
        }
        
    }
    
}
