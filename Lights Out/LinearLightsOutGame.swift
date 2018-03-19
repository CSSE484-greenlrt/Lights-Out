//
//  LinearLightsOutGame.swift
//  Lights Out
//
//  Created by Ryan Greenlee on 3/16/18.
//  Copyright © 2018 Ryan Greenlee. All rights reserved.
//

import Foundation

class LinearLightsOutGame:CustomStringConvertible {
    var lightStates: [Bool]
    var movesTaken: Int
    var gameOver: Bool
    
    init(numLights: Int) {
        lightStates = [Bool](repeating: false, count: numLights)
        let randomNumber : Int = Int(arc4random_uniform(UInt32(numLights)))
        for _ in 0..<randomNumber {
            lightStates[Int(arc4random_uniform(UInt32(numLights)))] = true
        }
        movesTaken = 0
        gameOver = false
    }
    
    func pressedLightAtIndex(_ index: Int) -> Bool {
        if gameOver {
            return true
        }
        lightStates[index] = !lightStates[index]
        if index == 0 {
            lightStates[index + 1] = !lightStates[index + 1]
        } else if index == lightStates.count - 1 {
            lightStates[index - 1] = !lightStates[index - 1]
        } else {
            lightStates[index + 1] = !lightStates[index + 1]
            lightStates[index - 1] = !lightStates[index - 1]
        }
        movesTaken += 1
        for lightState in lightStates {
            if lightState {
                return false
            }
        }
        gameOver = true
        return true
    }
    
    var description: String {
        var result = "Lights: "
        for lightState in lightStates {
            if lightState {
                result += "1"
            } else {
                result += "0"
            }
        }
        return result + " Moves: \(movesTaken)"
    }
}
