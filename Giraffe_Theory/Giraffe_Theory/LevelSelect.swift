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
    
    func getLevel(selected: Int) -> Level {
        return levels[selected]
    }
}
