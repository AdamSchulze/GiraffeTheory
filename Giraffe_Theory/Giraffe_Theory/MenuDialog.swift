//
//  Dialog.swift
//  Giraffe_Theory
//
//  Created by Augusto de Oliveira on 6/16/17.
//  Copyright © 2017 TUSJATL Games. All rights reserved.
//

import Foundation
import SpriteKit

class MenuDialog: SKSpriteNode {
    
    let resumeButton = SKSpriteNode(color: UIColor(red: 0.0, green: 1.0, blue: 0.2, alpha: 0.0), size: CGSize(width: 30, height: 50))
    let optionsButton = SKSpriteNode(color: UIColor(red: 0.0, green: 1.0, blue: 0.2, alpha: 0.0), size: CGSize(width: 30, height: 50))
    let menuButton = SKSpriteNode(color: UIColor(red: 0.0, green: 1.0, blue: 0.2, alpha: 0.0), size: CGSize(width: 30, height: 50))
    
    //init() {
        //self.size = CGSize()
    //}
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            
            
        }
        
    }
    
}
