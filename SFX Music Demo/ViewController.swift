//
//  ViewController.swift
//  SFX Music Demo
//
//  Created by Mirko Cukich on 11/13/19.
//  Copyright © 2019 Digital Mirko. All rights reserved.
//
// Swift Sound Effect and Music Player Demo - Demo 28 of 30

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var soundEffect: AVAudioPlayer = AVAudioPlayer()
    var musicEffect: AVAudioPlayer = AVAudioPlayer()

    // Slider controls
    @IBOutlet weak var soundVolume: UISlider!
    @IBOutlet weak var musicVolume: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let soundEffectFile = Bundle.main.path(forResource: "Explosion", ofType: "mp3")
        let musicEffectFile = Bundle.main.path(forResource: "ActionChase", ofType: "wav")
        
        do {
            try soundEffect = AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundEffectFile!))
            try musicEffect = AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicEffectFile!))
        }
        
        catch {
            print(error)
        }
    }

    // Sound Effects file Button / Slider control
    @IBAction func playSoundBtn(_ sender: Any) {
        
        soundEffect.play()
    }

    @IBAction func soundVolumeSlider(_ sender: Any) {
        // note: default slider is at .5 out of 1 for volume
        soundEffect.volume = soundVolume.value
    }
    
    
    // Music file Buttons / Slider control
    @IBAction func playMusicBtn(_ sender: Any) {
        
        musicEffect.play()
    }
    
    @IBAction func pauseMusicBtn(_ sender: Any) {
        
        musicEffect.stop()
    }
    
    @IBAction func restartMusicBtn(_ sender: Any) {
        
        musicEffect.currentTime = 0
        musicEffect.play()
    }
    
    @IBAction func stopMusicBtn(_ sender: Any) {
        
        musicEffect.stop()
        musicEffect.currentTime = 0
    }
    
    
    @IBAction func musicVolumeSlider(_ sender: Any) {
        // note: default slider is at .5 out of 1 for volume
        musicEffect.volume = musicVolume.value
    }
}
