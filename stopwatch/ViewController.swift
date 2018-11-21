//
//  ViewController.swift
//  timer90
//
//  Created by muhammad habib hidayatullah 01/11/18.
//  Copyright © 2018 habdev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var playbutton: UIButton!
    
    @IBOutlet var pausebutton: UIButton!
    
    @IBOutlet var titlelabel: UILabel!
    
    var timer = Timer()
    var counter = 0.0
    var isRunning = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titlelabel.text = "\(counter)"
        playbutton.isEnabled = true
        pausebutton.isEnabled = false
    }
    
    @IBAction func btnreset(_ sender: UIButton) {
        timer.invalidate()
        titlelabel.text = "\(counter)"
        counter = 0
        playbutton.isEnabled = true
        pausebutton.isEnabled = false
        isRunning = false
    }
    
    @IBAction func btnpause(_ sender: UIButton) {
        timer.invalidate()
        pausebutton.isEnabled = false
        playbutton.isEnabled = true
        isRunning = false
    }
    
    
    @IBAction func btnplay(_ sender: UIButton) {
        if !isRunning{
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTime), userInfo: nil, repeats: true)
            playbutton.isEnabled = false
            pausebutton.isEnabled = true
            isRunning = true
        }
    }
    
    @objc func UpdateTime(){
        counter += 0.1
        titlelabel.text = String(format: "%.1f", counter)
    }
    
    
}


