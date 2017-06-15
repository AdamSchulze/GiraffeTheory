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
    
    var menuButton: SKSpriteNode! = nil
    
    var runButton: SKSpriteNode! = nil
    
    // Number of Giraffes the player will be allowed to use
    private var numGiraffes : Int = 0
    // An array of arrays of doubles which contain the positions for nodes that will be initialized at the beginning of the level.
//    private var startNodes : [[Double]] = []
//    // An array of ints that correspond to an indexes in startNodes, giving us an array of edges that will be initialized at the beginning of the level.
//    private var startEdges : [Int] = []
    
    //Array of nodes/bodies
    var nodeArray: [SKSpriteNode] = [SKSpriteNode]()
    
    //Array of heads and necks
    var edgeArray: [SKSpriteNode] = [SKSpriteNode]()
    
    // The player's score (out of 3 stars). The level will only advance if the player has at least one star.
    var stars : Int = 0
    
    private var gameGraph : Graph!
    
    var selectedButton: SKSpriteNode? //Keeps track of the currently selected button/node
    
    // texture to be used for all giraffe heads
    let giraffeHead = SKTexture(imageNamed: "GiraffeHead")
    
    var endGiraffe: Int = 1
    
    var squirrel: SKSpriteNode! = nil
    
    //Everything Below was written as default code. May be useful, but we will likely delete
    
    override func didMove(to view: SKView) {

        menuButton = self.childNode(withName: "MenuButtonNode") as? SKSpriteNode
        runButton = self.childNode(withName: "RunButtonNode") as? SKSpriteNode
        squirrel = self.childNode(withName: "Squirrel") as? SKSpriteNode

    }
    
    
    /*
     * Helper Function to determine if user has touched a giraffe node.
     * If so, it sets selectedButton to be the currently touched giraffe node
     * Input: CGPoint containing coordinates of a touch
     * Output: True if there is a giraffe node at specified coordinates, false otherwise
     */
    func isGiraffe(touchLocation: CGPoint) -> Bool {
        for sprite in nodeArray {
            if sprite.contains(touchLocation) {
                selectedButton = sprite
                return true
            }
        }
        return false
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
                
            } else if isGiraffe(touchLocation: touch.location(in: self)){
                let newGiraffeHead = SKSpriteNode(texture: giraffeHead)
                edgeArray.append(newGiraffeHead)
                selectedButton = newGiraffeHead
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
            } else if isGiraffe(touchLocation: touch.location(in: self)) {
                selectedButton!.position = touch.location(in: self)
            }
        }
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            
            if selectedButton == menuButton {
                handleMenuButtonHover(isHovering: false)
                
                if (menuButton.contains(touch.location(in: self))) {
                    handleMenuButtonClick()
                    print("Menu Button Clicked")
                }
                
            } else if selectedButton == runButton {
                // tutorial button clicked
                handleRunButtonHover(isHovering: false)
                
                if (runButton.contains(touch.location(in: self))) {
                    handleRunButtonClick()
                    print("Run Button Clicked")
                }
            } else if isGiraffe(touchLocation: touch.location(in: self)) {
                selectedButton!.position = touch.location(in: self)
                print("A Giraffe is born")
            }
            
        }
        
        selectedButton = nil
    }
    
    
    func handleMenuButtonHover(isHovering: Bool) {
        //TODO: handle hovering textures
    }
    
    func handleRunButtonHover(isHovering: Bool){
        //TODO: handle hovering textures
    }
    
    func handleMenuButtonClick() {
        //TODO: bring up a new sprite/scene with the menu
    }
    
    func handleRunButtonClick() {
        // The squirrel always starts at the node labelled 0.
        var currentNode = 0
        
        while gameGraph.findMinEdgeIndex(node: currentNode) != nil {
            let nextNode = gameGraph.findMinEdgeIndex(node: currentNode)
            // animate the squirrel: moveTo(from: currentNode, to: nextNode)
            currentNode = nextNode!
            //if currentNode == endNode {
            //  victory()
            //}
            /*if let touch = UITapGestureRecognizer() {
             if stopButton.contains(touch.location(in: self)) {
             break
             }
             }*/
            // handle being able to press the "stop" button to avoid an infinite loop here
        }
 
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
