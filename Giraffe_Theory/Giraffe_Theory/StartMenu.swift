//
//  playMenu.swift
//  Giraffe_Theory
//
//  Created by Adam Schulze on 5/22/17.
//  Copyright © 2017 TUSJATL Games. All rights reserved.
//
import SpriteKit
import GameplayKit
import Foundation

class StartMenu: SKScene {
    
    var playButton: SKSpriteNode! = nil
    var tutorialButton: SKSpriteNode! = nil
    var selectedButton: SKSpriteNode?
    
    override func didMove(to view: SKView) {
//        addChild(playButton)
//        addChild(tutorialButton)
        playButton = self.childNode(withName: "PlayButtonNode") as? SKSpriteNode
        tutorialButton = self.childNode(withName: "TutorialButtonNode") as? SKSpriteNode
        print("playButton and tutorialButton initialized")
        //self.addChild(playButton)
        //self.addChild(tutorialButton)
    }
    
    
    /*override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //print("TouchesBegan")
        if let touch = touches.first {
            // If there is already a button selected, reset all buttons to unpressed
            if selectedButton != nil {
                print("resetting all touches")
                handlePlayButtonHover(isHovering: false)
                handleTutorialButtonHover(isHovering: false)
            }
            
            // Check which button was clicked (if any)
            if playButton.contains(touch.location(in: self)) {
                print("playbutton touched")
                selectedButton = playButton
                handlePlayButtonHover(isHovering: true)
            } else if tutorialButton.contains(touch.location(in: self)) {
                print("tutorialButton touched")
                selectedButton = tutorialButton
                handleTutorialButtonHover(isHovering: true)
            }
        }
    }*/
    
    /*override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        if let touch = touches.first {
            
            // Check which button was clicked (if any)
            if selectedButton == playButton {
                handlePlayButtonHover(isHovering: (playButton.contains(touch.location(in: self))))
            } else if selectedButton == tutorialButton {
                handleTutorialButtonHover(isHovering: (tutorialButton.contains(touch.location(in: self))))
            }
        }
    }*/
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        print("beign of touches ended function")
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        if playButton.contains(touchLocation) {
            print("play button pressed!")
            // do playbutton things
        }
        else if tutorialButton.contains(touchLocation) {
            print("tutorial button pressed!")
            // do tutorial things
        }
        
        /*if let touch = touches.first {
            
            if selectedButton == playButton {
                // play button clicked
                handlePlayButtonHover(isHovering: false)
                
                if (playButton.contains(touch.location(in: self))) {
                    handlePlayButtonClick()
                }
                
            } else if selectedButton == tutorialButton {
                // tutorial button clicked
                handleTutorialButtonHover(isHovering: false)
                
                if (tutorialButton.contains(touch.location(in: self))) {
                    handleTutorialButtonClick()
                }
            }
        }*/
        
        selectedButton = nil
    }
    
    //TODO: Can likely combine the two functions below since they are repetitive
    
    /// Handles play button hover behavior
    func handlePlayButtonHover(isHovering : Bool) {
        print("Hovering")
//        if isHovering {
//            playButton.texture = playButtonPressedTexture
//        } else {
//            playButton.texture = playButtonTexture
//        }
    }
    
    /// Handles tutorial button hover behavior
    func handleTutorialButtonHover(isHovering : Bool) {
        print("Hovering")
//        if isHovering {
//            tutorialButton.texture = tutorialButtonPressedTexture
//        } else {
//            tutorialButton.texture = tutorialButtonTexture
//        }
    }
    
    func handlePlayButtonClick() {
        print("Play Button Clicked")
        let transition = SKTransition.reveal(with: .down, duration: 0.75)
        let nextScene = GameScene(fileNamed: "LevelSelect")
        nextScene?.scaleMode = scaleMode
        view?.presentScene(nextScene!, transition: transition)
    }
    
    func handleTutorialButtonClick() {
        print("Tutorial Button Clicked")
    }
    
}
