//
//  GameScene.swift
//  Giraffe_Theory
//
//  Created by Adam Schulze on 5/21/17.
//  Copyright © 2017 TUSJATL Games. All rights reserved.
//

import SpriteKit
import GameplayKit

// General Level class containing data members and functions that any level would have
class GameScene: SKScene {
    // Default variables, not sure what they're for other than initialization
    //private var label : SKLabelNode?
    //private var spinnyNode : SKShapeNode?
    
    // Number of Giraffes the player will be allowed to use
    private var numGiraffes : Int = 0
    // An array of arrays of doubles which contain the positions for nodes that will be initialized at the beginning of the level.
//    private var startNodes : [[Double]] = []
//    // An array of ints that correspond to an indexes in startNodes, giving us an array of edges that will be initialized at the beginning of the level.
//    private var startEdges : [Int] = []
    
    
    // The player's score (out of 3 stars). The level will only advance if the player has at least one star.
    var stars : Int = 0
    
    
    private var gameGraph : Graph!

    
    var selectedButton: SKSpriteNode? //Keeps track of the currently selected button/node
    

    
    //Everything Below was written as default code. May be useful, but we will likely delete
    
    override func didMove(to view: SKView) {
        
    }
    
    
    /*
     * Helper Function to determine if user has touched a giraffe node
     * Input: CGPoint containing coordinates of a touch
     * Output: True if there is a giraffe node at specified coordinates, false otherwise
     */
    func isGiraffe(touchLocation: CGPoint) -> Bool {
        return startingNodes.contains(where: ((touchLocation.x,touchLocation.y)) throws -> Bool)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            // If there is already a button selected, reset all buttons to unpressed
            if selectedButton != nil {
                //                handleMenuButtonHover(isHovering: false)
                //                handleRunButtonHover(isHovering: false)
            }
            
            // Check what was clicked
            // These conditionals are placeholder statements
            
            if menuButton.contains(touch.location(in: self)) {
                selectedButton = menuButton
                //handleMenuButtonHover(isHovering: true)
                
                
            } else if runButton.contains(touch.location(in: self)) {
                selectedButton = runButton
                //handleRunButtonHover(isHovering: true)
                
            } else if isGiraffe(touchLocation: location(in: touch)){
                // conditional syntax may be incorrect
                // selectedButton = currently selected giraffe node
                //create a new giraffe head and neck
            }
            
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            
            // Check which button was clicked (if any)
            if selectedButton == menuButton {
                //handlePlayButtonHover(isHovering: (playButton.contains(touch.location(in: self))))
            } else if selectedButton == runButton {
                //handleTutorialButtonHover(isHovering: (tutorialButton.contains(touch.location(in: self))))
            } else if isGiraffe(touchLocation: location(in: touch)) {
                //extend giraffe neck as the giraffe head follows the touch
            }
        }
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            
            if selectedButton == menuButton {
                handleMenuButtonHover(isHovering: false)
                
                if (menuButton.contains(touch.location(in: self))) {
                    handleMenuButtonClick()
                }
                
            } else if selectedButton == runButton {
                // tutorial button clicked
                handleRunButtonHover(isHovering: false)
                
                if (runButton.contains(touch.location(in: self))) {
                    handleRunButtonClick()
                }
            } else if /* touches a new node */ {
                // add edge to edgelist (and update the graphics accordingly)
            }
            
        }
        
        selectedButton = nil
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
