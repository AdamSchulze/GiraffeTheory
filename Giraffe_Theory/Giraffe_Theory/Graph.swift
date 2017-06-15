//
//  Graph.swift
//  Giraffe_Theory
//
//  Created by Augusto de Oliveira on 5/30/17.
//  Copyright © 2017 TUSJATL Games. All rights reserved.
//

import Foundation   // I'm actualy not sure what this does.
import SpriteKit

// This class is for implementing the actual graphs. It's the underlying data structure of the game.
// Each level should create a different graph object, and initialize different nodes.
// Nodes are numbered: nodes go from 0 to size.
class Graph {
    
    //MARK: member variables
    
    private var size: Int!    // Graph size is initialized upon object creation.
    
    
    /*
     *  The graphs are implemented as an adjacency matrix.
     *  A non-nil value in position [i][j] of the matrix represents an edge from node i to node j.
     *  The value at [i][j] is the weight of the edge.
     */
    private var matrix = [[Double?]]()
    
    /*
     *  Default constructor
     *  Initializes a graph of size 0: no nodes, no edges.
     *  This is probably unnecessary.
     */
    init() {
        size = 0
    }
    
    /*
     *  Size constructor
     *  Initializes a graph based on size.
     *  Initilizes all values in the matrix to nil (no edges exist yet).
     */
    init(size: Int) {
        self.size = size
        for i in 0..<size {
            for j in 0..<size {
                matrix[i][j] = nil
            }
        }
    }
    
    /*
     *  Size and Edges constructor
     *  Initializes a graph based on its size and its starting edges.
     *  By extension, also initializes the nodes.
     *  Edges are input as an array of an (Int, Int, Double) tuple.
     *  The start node is the first Int, the end node is the second Int, and the weight is the Double.
     */
    init(size: Int, initialEdges: [(Int, Int, Double)]) {
        self.size = size
        for i in 0..<size {
            for j in 0..<size {
                matrix[i][j] = nil
            }
        }
        
        for index in 0..<initialEdges.count {
            addEdge(begin: initialEdges[index].0, end: initialEdges[index].1, weight: initialEdges[index].2)
        }
    }
    
    // MARK: functions
    
    /*
     *  Function canTravel returns true if there is an edge connecting the node at begin to the node at end, false otehrwise.
     *  @params Ints begin and end, indices of the beginning and ending nodes, respectively.
     *  @return true if there is an edge connecting begin and end, false otherwise.
     */
    func canTravel(begin: Int, end: Int) -> Bool {
        
        // Returns false if begin or end are out of range
        if begin > size || end > size {
            return false;
        }
        
        return matrix[begin][end] != nil
        
    }
    
    /*
     *  A function that adds an edge of a certain weight between two nodes.
     *  @params Ints begin and end, the beginning and ending nodes, and double weight, the weight of the edge to add.
     */
    func addEdge(begin: Int, end: Int, weight: Double) {
        
        // Exits if begin or end are out of range
        if begin > size || end > size {
            return;
        }
        
        matrix[begin][end] = weight
    }
    
    /*
     *  Removes the edge between two nodes. Obeys directionality.
     *  @params Int begin and Int end, beginning and ending nodes, respectively.
     */
    func removeEdge(begin: Int, end: Int) {
        if begin <= size && end <= size {
            matrix[begin][end] = nil
        }
    }
    
    /*
     *  A function to find the smallest edge weight from a given node.
     *  @param Int, the index of the node.
     *  @returns A Double, the weight of the smallest edge originating from the node, or nil if there are no edges.
     */
    func findMinEdgeWeight(node: Int) -> Double? {
        if node > size {
            return nil
        }
        var min: Double! = nil
        for i in 0..<size {
            if min == nil && matrix[node][i] != nil {
                min = matrix[node][i]
            }
            else if matrix[node][i] != nil && (matrix[node][i]?.isLess(than: min))! {
                min = matrix[node][i]
            }
        }
        return min
    }
    
    func findMinEdgeIndex(node: Int) -> Int? {
        if node > size {
            return nil
        }
        var ret: Int! = nil
        var min: Double! = nil
        for i in 0..<size {
            if min == nil && matrix[node][i] != nil {
                min = matrix[node][i]
                ret = i
            }
            else if matrix[node][i] != nil && (matrix[node][i]?.isLess(than: min))! {
                min = matrix[node][i]
                ret = i
            }
        }
        return ret
    }
    
    func addNode() {    // Not sure if this one is necessary for us?
        // code
    }
    
    
    
}
