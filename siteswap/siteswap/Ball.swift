//
//  Ball.swift
//  siteswap
//
//  Created by Peter Zupke on 12/28/16.
//  Copyright © 2016 Peter Zupke. All rights reserved.
//

import Foundation

class Ball {
    
    var xPos: Int
    var yPos: Int
    var digit: Int
    var active: Bool
    var startActiveTime: Int
    var localTime: Int
    var totalTime: Int
    var isRightHand: Bool
    var hasPassed: Bool
    var indexArray: [[Int]]
    
    init(digit: Int, isRightHand: Bool) {
        self.digit = digit
        self.active = false
        self.hasPassed = false
        self.startActiveTime = 0
        self.localTime = 0
        self.totalTime = digit * 4
        self.isRightHand = isRightHand
        
        switch digit {
        case 0:
            indexArray = []
        case 1:
            if isRightHand {
                indexArray = [[50, 4], [42, 4], [34, 4], [26, 4], [18, 4], [10, 4]]
            } else {
                indexArray = [[18, 4], [26, 4], [34, 4], [42, 4]]
            }
        case 2:
            if isRightHand {
                indexArray = [[51, 4], [51, 4], [51, 4], [51, 4], [51, 4], [51, 4], [51, 4], [51, 4]]
            } else {
                indexArray = [[8, 4], [8, 4], [8, 4], [8, 4], [8, 4], [8, 4], [8, 4], [8, 4]]
            }
            
        case 3:
            if isRightHand {
                indexArray = [[51, 4], [46, 5], [43, 6], [39, 8], [35, 9], [32, 10], [28, 10], [25, 9], [21, 8], [17, 6], [14, 5], [10, 4]]
            } else {
                indexArray = [[10, 4], [14, 5], [17, 6], [21, 8], [25, 9], [28, 10], [32, 10], [35, 9], [39, 8], [43, 6], [46, 5], [50, 4]]
            }
            
        case 4:
            if isRightHand {
                indexArray = [[51, 4], [51, 6], [51, 7], [51, 8], [51, 9], [51, 10], [51, 11], [51, 12], [51, 12], [51, 11], [51, 10], [51, 9], [51, 8], [51, 7], [51, 6], [51, 4]]
            } else {
                indexArray = [[8, 4], [8, 6], [8, 7], [8, 8], [8, 9], [8, 10], [8, 11], [8, 12], [8, 12], [8, 11], [8, 10], [8, 9], [8, 8], [8, 7], [8, 6], [8, 4]]
            }
            
        case 5:
            if isRightHand {
                indexArray = [[50, 4], [48, 5], [46, 6], [44, 8], [42, 9], [39, 10], [37, 11], [35, 13], [33, 14], [31, 15], [29, 15], [27, 14], [25, 13], [23, 11], [21, 10], [18, 9], [16, 8], [14, 6], [12, 5], [10, 4]]
            } else {
                indexArray = [[10, 4], [12, 5], [14, 6], [16, 8], [18, 9], [21, 10], [23, 11], [25, 13], [27, 14], [29, 15], [31, 15], [33, 14], [35, 13], [37, 11], [39, 10], [42, 9], [44, 8], [46, 6], [48, 5], [50, 4]]
            }
            
        case 6:
            if isRightHand {
                indexArray = [[53, 4], [53, 6], [53, 8], [53, 9], [53, 10], [53, 11], [53, 12], [53, 13], [53, 14], [53, 15], [53, 16], [53, 17], [53, 17], [53, 16], [53, 15], [53, 14], [53, 13], [53, 12], [53, 11], [53, 10], [53, 9], [53, 8], [53, 6], [53, 4]]
            } else {
                indexArray = [[6, 4], [6, 6], [6, 8], [6, 9], [6, 10], [6, 11], [6, 12], [6, 13], [6, 14], [6, 15], [6, 16], [6, 17], [6, 17], [6, 16], [6, 15], [6, 14], [6, 13], [6, 12], [6, 11], [6, 10], [6, 9], [6, 8], [6, 6], [6, 4]]
            }
            
        case 7:
            if isRightHand {
                indexArray = [[50, 4], [49, 6], [47, 8], [46, 10], [44, 11], [43, 12], [41, 13], [40, 14], [39, 15], [37, 16], [36, 17], [34, 18], [33, 19], [31, 20], [30, 20], [29, 19], [27, 18], [26, 17], [24, 16], [23, 15], [21, 14], [20, 13], [19, 12], [17, 11], [16, 10], [14, 8], [12, 6], [10, 4]]
            } else {
                indexArray = [[10, 4], [12, 6], [14, 8], [16, 10], [17, 11], [19, 12], [20, 13], [21, 14], [23, 15], [24, 16], [26, 17], [27, 18], [29, 19], [30, 20], [31, 20], [33, 19], [34, 18], [36, 17], [37, 16], [39, 15], [40, 14], [41, 13], [43, 12], [44, 11], [46, 10], [47, 8], [49, 6], [50, 4]]
            }
            
        case 8:
            if isRightHand {
                indexArray = [[53, 4], [53, 5], [53, 6], [53, 8], [53, 9], [53, 10], [53, 11], [53, 12], [53, 14], [53, 15], [53, 16], [53, 17], [53, 18], [53, 20], [53, 21], [53, 22], [53, 22], [53, 21], [53, 20], [53, 18], [53, 17], [53, 16], [53, 15], [53, 14], [53, 12], [53, 11], [53, 10], [53, 9], [53, 8], [53, 6], [53, 5], [53, 4]]
            } else {
                indexArray = [[6, 4], [6, 5], [6, 6], [6, 8], [6, 9], [6, 10], [6, 11], [6, 12], [6, 14], [6, 15], [6, 16], [6, 17], [6, 18], [6, 20], [6, 21], [6, 22], [6, 22], [6, 21], [6, 20], [6, 18], [6, 17], [6, 16], [6, 15], [6, 14], [6, 12], [6, 11], [6, 10], [6, 9], [6, 8], [6, 6], [6, 5], [6, 4]]
            }
            
        case 9:
            if isRightHand {
                indexArray = [[50, 4], [49, 6], [48, 8], [47, 10], [45, 12], [44, 13], [43, 14], [42, 15], [41, 16], [40, 17], [39, 18], [37, 19], [36, 20], [35, 21], [34, 22], [33, 23], [32, 23], [31, 24], [29, 24], [28, 23], [27, 23], [26, 22], [25, 21], [24, 20], [23, 19], [21, 18], [20, 17], [19, 16], [18, 15], [17, 14], [16, 13], [15, 12], [13, 10], [12, 8], [11, 6], [10, 4]]
            } else {
                indexArray = [[10, 4], [11, 6], [12, 8], [13, 10], [15, 12], [16, 13], [17, 14], [18, 15], [19, 16], [20, 17], [21, 18], [23, 19], [24, 20], [25, 21], [26, 22], [27, 23], [28, 23], [29, 24], [31, 24], [32, 23], [33, 23], [34, 22], [35, 21], [36, 20], [37, 19], [39, 18], [40, 17], [41, 16], [42, 15], [43, 14], [44, 13], [45, 12], [47, 10], [48, 8], [49, 6], [50, 4]]
            }
            
        default:
            indexArray = []
        }
        
        if digit == 0 {
            xPos = 0
            yPos = 0
        } else {
            xPos = indexArray[0][0]
            yPos = indexArray[0][1]
        }
    }
    
    func getXPosition() -> Int {
        return xPos
    }
    
    func getYPosition() -> Int {
        return yPos
    }
    
    func getTime() -> Int {
        return localTime
    }
    
    func getDigit() -> Int {
        return digit
    }
    
    func getHasPassed() -> Bool {
        return hasPassed
    }
    
    func pass() -> Void {
        hasPassed = true
    }
    
    func canPass() -> Bool {
        return localTime >= self.duration()
    }
    
    func getIsRightHand() -> Bool {
        return isRightHand
    }
    
    func duration() -> Int {
        switch digit {
        case 0:
            return 4
        case 1:
            return 6
        case 2:
            return 4
        case 3:
            return 8
        case 4:
            return 4
        case 5:
            return 4
        case 6:
            return 4
        case 7:
            return 4
        case 8:
            return 4
        case 9:
            return 4
        default:
            return 0
        }
    }
    
    func isActive() -> Bool {
        return self.active
    }
    
    func makeActive() -> Void {
        localTime = 0
        if digit != 0 {
            xPos = indexArray[0][0]
            yPos = indexArray[0][1]
        }
        active = true
        hasPassed = false
    }
    
    func makeInactive() -> Void {
        active = false
    }
    
    func update() -> Void {
        localTime += 1
        if localTime >= indexArray.count {
            self.makeInactive()
        } else {
            if digit != 0 {
                xPos = indexArray[localTime][0]
                yPos = indexArray[localTime][1]
            }
        }
    }
}
