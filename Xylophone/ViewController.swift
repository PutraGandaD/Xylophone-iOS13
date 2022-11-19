//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Studied by Putra Ganda Dewata
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        //print("I got pressed") // Debug
        //print(sender.currentTitle) // Debug
        
        playSound(soundName: sender.currentTitle!)
        print("Start") // printed immediately
        
        //Reduces the sender's (the button that got pressed) opacity to half.
        sender.alpha = 0.5

        //Code should execute after 0.2 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0
            print("End") // printed after the button pressed + 0.2 seconds delay
        }
        
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}

