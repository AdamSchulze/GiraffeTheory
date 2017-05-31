//
//  Level.swift
//  Giraffe_Theory
//
//  Created by Augusto de Oliveira on 5/30/17.
//  Copyright © 2017 TUSJATL Games. All rights reserved.
//

import Foundation

// This class stores everything each level has. It's just meant to be a simple way to package all the information together.
// Most importantly: position and number of starting nodes, any edges, and victory conditions.
// Other things can be added later. For example, does this level have directed edges? Where does the squirrel start?
class Level {
    
    //MARK: member variables
    private let startingNodes : [(Int, Int)]    // Nodes represented by an array of integer tuples
    // Exactly how the onscreen position of the nodes will be represented and stored, I don't know
    // That's why this is an integer tuple intitially, it's subject to change.
    
    // Stores the starting edges as an integer tuple of (start, end, weight)
    private let startingEdges : [(Int, Int, Double)]
    
    // I'm still unclear how to store a general case for victory conditions, but we'll figure it out eventually.
    
    /* 
     *  The idea is the input arguments here are a mess of hard-coded nonsense in some other file,
     *  but then LevelSelect.swift only has to interact with clean, Level objects rather than that whole mess.
     *  This Level object is then used to initialize each GameScene's Graph object.
     */
    init(arrnodes : [(Int, Int)], arredges : [(Int, Int, Int)]/*, <victory conditions>*/) {
        // I'm not sure if we have to worry about shallow copy vs deep copy or if that's a problem with swift?
        startingNodes = arrnodes
        startingEdges = arredges
    }
    
    func getStartingNodes() -> [(Int, Int)] {
        return startingNodes
    }
    
    func getStartingEdges() -> [(Int, Int, Int)] {
        return startingEdges
    }
    
    func getInitialSize() -> Int {
        return startingNodes.count
    }
    
    
}
