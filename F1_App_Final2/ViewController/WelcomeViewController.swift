//
//  WelcomeViewController.swift
//  F1_App_Final2
//
//  Created by Santi Silvani on 4/27/22.
//

import UIKit
import AVFoundation

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var gifView: UIImageView!
    
    
    var tapped = false
    
    @IBOutlet weak var welcomeLabel: UILabel!
    var audioPlayer: AVAudioPlayer!
    
    var audioData = ["Alonso", "Lights"]
    
    var gifsMatch = ["monaco_GIF"]
    var gifsTheme = ["monaco_GIF", "senna_GIF"]
    
    var randomAudio = ""
    var placeHold = true
    var randomGIF = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.alpha = 0.0
        
        tapped = false
        
        getRandom()
        fadeIn()
        gifView.loadGif(name: randomGIF)
        playSound(name: randomAudio)
        
    }
    
    func fadeIn(){
        UIView.animate(withDuration: 5.0){
            self.welcomeLabel.alpha = (self.welcomeLabel.alpha == 1.0 ? 0.0 : 1.0)
        }
    }
    
    func getRandom(){
        randomAudio = audioData.randomElement()!
        //      randomGIF = gifs.randomElement()!
        
        switch randomAudio{
        case "Alonso":
            randomGIF = "alonso_GIF"
        default:
            randomGIF = gifsTheme.randomElement()!
        }
    }
    
    func playSound(name: String){
        if let sound = NSDataAsset(name: name){
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            }catch{
                print("error")
            }
        }else{
            print("error")
        }
    }
    
    @IBAction func tapped(_ sender: UITapGestureRecognizer) {
        tapped = true
        audioPlayer.stop()
        print("tapped")
    }
}
