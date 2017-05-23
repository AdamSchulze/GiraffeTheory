//
//  StartMenu.swift
//  Giraffe_Theory
//
//  Created by Adam Schulze on 5/22/17.
//  Copyright © 2017 TUSJATL Games. All rights reserved.
//
import SpriteKit
import GameplayKit
import Foundation

class StartScene: SKScene {
    var playButton: SKNode = PlayButtonNode
    var tutorialButton : SKNode = TutorialNode
    
    override func didMoveToView(view: SKView) {
        self.addChild(playButton)
        self.addChild(tutorialButton)
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        // Loop over all the touches in this event
        for touch: AnyObject in touches {
            // Get the location of the touch in this scene
            let location = touch.locationInNode(self)
            // Check if the location of the touch is within the button's bounds
            if playButton.containsPoint(location) {
                let levelSelect = GameScene(fileNamed: "GameScene.sks")
                self.scene.view?.presentScene(levelSelect)
            }
            if tutorialButton.containsPoint(location) {
                print("Tutorial")
            }
        }
    }
}
