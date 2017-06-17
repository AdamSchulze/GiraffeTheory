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
    
    var gameGraph : Graph!
    
    var selectedButton: SKSpriteNode? //Keeps track of the currently selected button/node
    
    var selectedHead: SKSpriteNode? //Keeps track of currently selected giraffe head
    
    var startNode: Int = 0 //Keeps track of node from which an edge begins
    
    // texture to be used for all giraffe heads
    let giraffeHead = SKTexture(imageNamed: "GiraffeHead")
    
    // Index of the Giraffe that will be the the finish
    private var endGiraffe: Int = 1
    
    var squirrel: SKSpriteNode! = nil

    
    override func didMove(to view: SKView) {
        menuButton = self.childNode(withName: "MenuButtonNode") as? SKSpriteNode
        runButton = self.childNode(withName: "RunButtonNode") as? SKSpriteNode
        squirrel = self.childNode(withName: "Squirrel") as? SKSpriteNode
        for i in 0..<gameGraph.getSize() {
            nodeArray.append((self.childNode(withName: "Giraffe" + "\(i)") as? SKSpriteNode)!)
        }
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
                startNode = nodeArray.index(of: selectedButton!)!
                let newGiraffeHead = SKSpriteNode(texture: giraffeHead)
                edgeArray.append(newGiraffeHead)
                selectedHead = newGiraffeHead
                print("Giraffe node touched")
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
            } else if edgeArray.contains(selectedButton!) {
                selectedHead!.position = touch.location(in: self)
                print("Making neck")
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
            } else if isGiraffe(touchLocation: touch.location(in: self)) && nodeArray[startNode] != selectedButton {
                selectedHead!.position = (selectedButton?.position)!
                if startNode == nil {
                    print("startnode problem")
                }
                self.gameGraph.addEdge(begin: startNode, end: nodeArray.index(of: selectedButton!)!, weight: 1.0)
                print("A Giraffe is born")
            }
            
        }
        
        selectedButton = nil
        selectedHead = nil
    }
    
    
    func handleMenuButtonHover(isHovering: Bool) {
        //TODO: handle hovering textures
    }
    
    func handleRunButtonHover(isHovering: Bool) {
        //TODO: handle hovering textures
    }
    
    func handleMenuButtonClick() {
        /*  
         *  The following code brings back the main menu.
         *  This function should actually bring up a sprite or pop up menu with options.
         *  One of those options is to go back to the main menu.
         *  While this code works, it is incomplete.
         */
        let transition = SKTransition.reveal(with: .up, duration: 0.75)
        let menu = StartMenu(fileNamed: "StartMenu")
        menu?.scaleMode = scaleMode
        view?.presentScene(menu!, transition: transition)
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
