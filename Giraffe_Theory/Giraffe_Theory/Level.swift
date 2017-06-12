//
//  Level.swift
//  Giraffe_Theory
//
//  Created by Augusto de Oliveira on 5/30/17.
//  Copyright © 2017 TUSJATL Games. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

// This class stores everything each level has. It's just meant to be a simple way to package all the information together.
// Most importantly: position and number of starting nodes, any edges, and victory conditions.
// Other things can be added later. For example, does this level have directed edges? Where does the squirrel start?
class Level {
    
    //MARK: member variables
    
    var menuButton: SKSpriteNode! = nil
    
    var runButton: SKSpriteNode! = nil
    
    var selectedButton: SKSpriteNode? //Keeps track of the currently selected button/node
    
    private let startingNodes : [(Float, Float)]    // Nodes represented by an array of integer tuples
    // Exactly how the onscreen position of the nodes will be represented and stored, I don't know
    // That's why this is an integer tuple intitially, it's subject to change.
    
    // Stores the starting edges as an integer tuple of (start, end, weight)
    // start and end are the indexes of the corresponding elements in startingNodes
    private let startingEdges : [(Int, Int, Double)]
    
    
    
    
    
    // I'm still unclear how to store a general case for victory conditions, but we'll figure it out eventually.
    
    /* 
     *  The idea is the input arguments here are a mess of hard-coded nonsense in some other file,
     *  but then LevelSelect.swift only has to interact with clean, Level objects rather than that whole mess.
     *  This Level object is then used to initialize each GameScene's Graph object.
     */
    init(arrnodes : [(Float, Float)], arredges : [(Int, Int, Double)]/*, <victory conditions>*/) {
        // I'm not sure if we have to worry about shallow copy vs deep copy or if that's a problem with swift?
        startingNodes = arrnodes
        startingEdges = arredges
    }
    
    func getStartingNodes() -> [(Float, Float/*, SKSpriteNode*/)] {
        return startingNodes
    }
    
    func getStartingEdges() -> [(Int, Int, Double/*, SKSpriteNode*/)] {
        return startingEdges
    }
    
    func getInitialSize() -> Int {
        return startingNodes.count
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




}
