//
//  DetailViewController.swift
//  History
//
//  Created by Santi Silvani on 5/2/22.
//

import UIKit
import AVFoundation

class DetailViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!

    @IBOutlet weak var imageView: UIImageView!
    
    var hold: History!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if hold == nil{
            hold = History(timePeriod: "", stats: nil, image: [""], audio: [""], gif: [""])
        }
        
        imageView.image = UIImage(named: hold.image.randomElement() ?? "xmark.app")
        
        
    }
    @IBAction func playSound(_ sender: UIButton) {
  //      playSound(name: hold.audio.randomElement() ?? "")
        playSound(name: hold.audio.randomElement() ?? "")
        print("here")
    }
    
    func playSound(name: String){
        if let sound = NSDataAsset(name: name){
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            }catch{
                print("error*")
            }
        }else{
            print("error")
        }
    }
    
}

