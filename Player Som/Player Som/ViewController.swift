//
//  ViewController.swift
//  Player Som
//
//  Created by Felipe on 27/07/19.
//  Copyright © 2019 Felipe. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    
    @IBAction func atualizarVolume(_ sender: Any) {
        player.volume = sliderVolume.value
    }
    @IBOutlet weak var sliderVolume: UISlider!
    @IBAction func play(_ sender: Any) {
        self.player.play()
    }
    @IBAction func pause(_ sender: Any) {
        self.player.pause()
    }
    @IBAction func stop(_ sender: Any) {
        self.player.stop()
        self.player.currentTime = 0
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.path(forResource: "bach", ofType: "mp3") {
            let url = URL(fileURLWithPath: path)
            
            do {
                self.player = try AVAudioPlayer(contentsOf: url)
                self.player.prepareToPlay()
            } catch {
                print("Erro ao executar o som")
            }
        }
    }


}

