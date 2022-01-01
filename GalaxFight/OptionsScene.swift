//
//  OptionsScene.swift
//  MainGame
//
//  Created by Abhinav Mara on 12/26/21.
//

import SpriteKit

class OptionsScene: SKScene {
    
    let textureAtlas = SKTextureAtlas(named: "HUD")
    
    var backgroundMusicSetting = SKLabelNode()
    var BulletExplosionSetting = SKLabelNode()
    var PlayerExplosionSetting = SKLabelNode()
    var bgOnOff = SKLabelNode()
    var bOnOff = SKLabelNode()
    var pOnOff = SKLabelNode()
    
    override func didMove(to view: SKView) {
        
        self.anchorPoint = CGPoint(x: 0, y: 0)
        
        let pulseAction = [SKAction.fadeAlpha(to: 0.5, duration: 0.5),SKAction.fadeIn(withDuration: 0.5)]
        let pulseAnimation = SKAction.repeatForever(SKAction.sequence(pulseAction))
        
        let backgroundColor = SKSpriteNode(color: .black, size: CGSize(width: self.size.width, height: self.size.height))
        backgroundColor.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.addChild(backgroundColor)
        
        let title = SKLabelNode(text: "Settings")
        title.fontName = "Copperplate"
        title.fontSize = 60
        title.position = CGPoint(x: self.size.width/2, y: self.size.height*(3/4))
        self.addChild(title)
        
        backgroundMusicSetting.text = "Background Music: "
        backgroundMusicSetting.fontSize = self.size.width/20
        backgroundMusicSetting.fontName = "Copperplate"
        backgroundMusicSetting.position = CGPoint(x: self.size.width/3, y: self.size.height*(3/5))
        self.addChild(backgroundMusicSetting)
        
        if BackgroundMusic.instance.isMuted() {
            bgOnOff = SKLabelNode(text: "OFF")
        }
        else {
            bgOnOff = SKLabelNode(text: "ON")
        }
        bgOnOff.fontName = "Copperplate"
        bgOnOff.fontSize = self.size.width/20
        bgOnOff.position = CGPoint(x: self.size.width*(4/5), y: self.size.height*(3/5))
        bgOnOff.name = "bgOnOff"
        self.addChild(bgOnOff)
        
        BulletExplosionSetting.text = "Bullet Explosion Sound Effect : "
        BulletExplosionSetting.lineBreakMode = .byWordWrapping
        BulletExplosionSetting.numberOfLines = 2
        BulletExplosionSetting.preferredMaxLayoutWidth = 200
        BulletExplosionSetting.verticalAlignmentMode = .center
        BulletExplosionSetting.fontSize = self.size.width/20
        BulletExplosionSetting.fontName = "Copperplate"
        BulletExplosionSetting.position = CGPoint(x: self.size.width/3, y: self.size.height*(5/10))
        self.addChild(BulletExplosionSetting)
        
        
        if bulletSoundEffect.instance.isMuted {
            bOnOff = SKLabelNode(text: "OFF")
        }
        else {
            bOnOff = SKLabelNode(text: "ON")
        }
        bOnOff.fontName = "Copperplate"
        bOnOff.fontSize = self.size.width/20
        bOnOff.position = CGPoint(x: self.size.width*(4/5), y: self.size.height*(5/10))
        bOnOff.name = "bOnOff"
        self.addChild(bOnOff)
        
        PlayerExplosionSetting.text = "Player Explosion Sound Effect : "
        PlayerExplosionSetting.lineBreakMode = .byWordWrapping
        PlayerExplosionSetting.numberOfLines = 2
        PlayerExplosionSetting.preferredMaxLayoutWidth = 200
        PlayerExplosionSetting.verticalAlignmentMode = .center
        PlayerExplosionSetting.fontSize = self.size.width/20
        PlayerExplosionSetting.fontName = "Copperplate"
        PlayerExplosionSetting.position = CGPoint(x: self.size.width/3, y: self.size.height*(4/10))
        self.addChild(PlayerExplosionSetting)
        
        
        if playerSoundEffect.instance.isMuted {
            pOnOff = SKLabelNode(text: "OFF")
        }
        else {
            pOnOff = SKLabelNode(text: "ON")
        }
        pOnOff.fontName = "Copperplate"
        pOnOff.fontSize = self.size.width/20
        pOnOff.position = CGPoint(x: self.size.width*(4/5), y: self.size.height*(4/10))
        pOnOff.name = "pOnOff"
        self.addChild(pOnOff)
        
        
        let returnToMenu = SKLabelNode()
        returnToMenu.text = "Back to Menu"
        returnToMenu.position = CGPoint(x: self.size.width/2, y: self.size.height/5)
        returnToMenu.fontName = "Copperplate"
        returnToMenu.fontSize = self.size.width/13
        returnToMenu.name = "mnBtn"
        self.addChild(returnToMenu)
        
        bgOnOff.run(pulseAnimation)
        bOnOff.run(pulseAnimation)
        pOnOff.run(pulseAnimation)
        returnToMenu.run(pulseAnimation)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let nodeTouched = atPoint(location)
            
            if nodeTouched.name == "mnBtn" {
                self.view?.presentScene(MenuScene(size: self.size))
            }
            else if nodeTouched.name == "bgOnOff" {
                if BackgroundMusic.instance.isMuted() {
                    BackgroundMusic.instance.playMusic()
                    bgOnOff.text = "ON"
                }
                else {
                    BackgroundMusic.instance.pauseMusic()
                    bgOnOff.text = "OFF"
                }
            }
            else if nodeTouched.name == "bOnOff" {
                if bulletSoundEffect.instance.isMuted == false {
                    bulletSoundEffect.instance.isMuted = true
                    bOnOff.text = "OFF"
                }
                else {
                    bulletSoundEffect.instance.isMuted = false
                    bOnOff.text = "ON"
                }
            }
            else if nodeTouched.name == "pOnOff" {
                if playerSoundEffect.instance.isMuted == false {
                    playerSoundEffect.instance.isMuted = true
                    pOnOff.text = "OFF"
                }
                else {
                    playerSoundEffect.instance.isMuted = false
                    pOnOff.text = "ON"
                }
            }
        }
    }
}
