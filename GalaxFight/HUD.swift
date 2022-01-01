//
//  HUD.swift
//  MainGame
//
//  Created by Abhinav Mara on 12/30/21.
//

import SpriteKit

class HUD: SKNode {
    
    let healthText = SKLabelNode(text: "HEALTH:")
    let healthCount = SKLabelNode(text: "100")
    
    func createHUDNodes(screensize: CGSize) {
        
        let healthTextPosition = CGPoint(x: screensize.width*(24/50), y: screensize.height*(26/50))
        healthText.position = healthTextPosition
        let healthCountPosition = CGPoint(x: screensize.width*(26/50), y: screensize.height*(26/50))
        healthCount.position = healthCountPosition
        
        healthCount.horizontalAlignmentMode = .left
        healthCount.verticalAlignmentMode = .center
        
        healthText.fontColor = .white
        healthText.fontName = "Copperplate"
        healthCount.fontColor = .white
        healthCount.fontName = "Copperplate"
        
 
        self.addChild(healthText)
        self.addChild(healthCount)
    }
    
    func setHealthDisplay(newHealth: Int) {
        let formatter = NumberFormatter()
        let number = NSNumber(value: newHealth)
        formatter.minimumIntegerDigits = 1
        if let healthStr = formatter.string(from: number) {
            healthCount.text = healthStr
        }
    }
}
