//
//  BackgroundMusic.swift
//  MainGame
//
//  Created by Abhinav Mara on 12/26/21.
//

import AVFoundation
import UIKit

class BackgroundMusic: NSObject {
    static let instance = BackgroundMusic()
    var musicPlayer = AVAudioPlayer()
    
    func playBackgroundMusic() {
        // Give Credit to DL Sounds Original Audio (Royalty Free)
        if let asset = NSDataAsset(name: "Free Game Loop") {
            do {
                musicPlayer = try AVAudioPlayer(data: asset.data, fileTypeHint: "wav")
                musicPlayer.numberOfLoops = -1
                musicPlayer.prepareToPlay()
                musicPlayer.play()
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if isMuted() {
            pauseMusic()
        }
    }
    
    func pauseMusic() {
        UserDefaults.standard.set(true, forKey: "BackgroundMusicMuteState")
        musicPlayer.pause()
    }
    
    func playMusic() {
        UserDefaults.standard.set(false, forKey: "BackgroundMusicMuteState")
        musicPlayer.play()
    }
    
    func isMuted() -> Bool {
        if UserDefaults.standard.bool(forKey: "BackgroundMusicMuteState") {return true}
        else {return false}
    }
    
    func setVolume(volume: Float) {
        musicPlayer.volume = volume
    }
}

class bulletSoundEffect: NSObject {
    static let instance = bulletSoundEffect()
    var isMuted = false
    
}

class playerSoundEffect: NSObject {
    
    static let instance = playerSoundEffect()
    var isMuted = false
    
}

