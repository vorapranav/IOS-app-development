//
//  ViewController.swift
//  bullseye
//
//  Created by Pranav on 09/02/2023.
//

import UIKit

class ViewController: UIViewController {

    var CurrentValue = 0
    @IBOutlet weak var slider: UISlider!
    var targetValue = 0
    @IBOutlet weak var targetlabel: UILabel!
    var score = 0
    @IBOutlet weak var scorelabel: UILabel!
    var round = 0
    @IBOutlet weak var roundlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CurrentValue = lroundf(slider.value)
        startnewgame()
        
        let thumbnailimage = UIImage(named: "slider1")
        slider.setThumbImage(thumbnailimage, for: .normal)
    }
    
    func updatelabel(){
        targetlabel.text = String(targetValue)
        scorelabel.text = String(score)
        roundlabel.text = String(round)
    }

    func Startnewround(){
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        CurrentValue = 50
        slider.value = Float(CurrentValue)
        updatelabel()
        
    }
    
    @IBAction func startnewgame(){
        score = 0
        round = 0
        Startnewround()
    }
    
    
    
    @IBAction func sliderMoved(_ slider:UISlider) {
        
        print ("The value of the slide now is: \(slider.value)")
        CurrentValue = lroundf(slider.value)
    }
    
    @IBAction func showAlert() {
        
        let difference = abs(CurrentValue - targetValue)
        var points: Int = 100 - difference
        
        
        if difference == 0 {
            points += 100
        }
        else if difference == 1{
            points += 50
        }
        
        score += points
        
        let title: String
        if difference == 0 {
            title = "Perfect!"
        }
        else if difference < 5{
            title = "Almost there!"
        }
        else {
            title = "Try HARDER!"
        }
        
        let message = "You have scored \(points) points"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
            self.Startnewround()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true)
        
            //Startnewround()
    }
    
}

