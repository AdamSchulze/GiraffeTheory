//
//  LevelSelect.swift
//  Giraffe_Theory
//
//  Created by Adam Schulze on 5/24/17.
//  Copyright © 2017 TUSJATL Games. All rights reserved.
//

import Foundation
import SpriteKit

class LevelSelect: SKScene {
    
    private var levels = [Level]()
    private let numLevels = 8
    private var levelButtons: [SKSpriteNode] = Array(repeating: SKSpriteNode(), count: 8)
    
    func getLevel(selected: Int) -> Level {
        return levels[selected]
    }
    
    override func didMove(to view: SKView) {
        print("Moved to LevelSelect.swift")
        levelButtons.reserveCapacity(numLevels+1)
        for i in 1...numLevels {
            print(i)
            //levelButtons.append((self.childNode(withName: "Level" + "\(i)") as? SKSpriteNode)!)
            levelButtons[i-1] = ((self.childNode(withName: "Level" + "\(i)") as? SKSpriteNode)!)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            for i in 1...numLevels {
                if levelButtons[i-1].contains(touch.location(in: self)) {
                    print("Level " + "\(i)" + " touched!")
                    break;
                }
            }
        }
    }
}
