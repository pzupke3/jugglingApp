//
//  Sequence.swift
//  siteswap
//
//  Created by Peter Zupke on 11/21/16.
//  Copyright © 2016 Peter Zupke. All rights reserved.
//

import Foundation

class Sequence {
    
    var digitArray: [Int]?
    var stringSequence: String
    var ballArray: [Ball]
    var time: Int
    
    var rightHandOccupied: Bool
    var leftHandOccupied: Bool
    
    init(number: String) {
        stringSequence = number
        time = 0
        rightHandOccupied = false
        leftHandOccupied = false
        let a: [Int]? = stringSequence.toArray()
        digitArray = a
        var counter = a!.count
        ballArray = [Ball]()
        var ballCount = 0
        
        var sum = 0
        for c in a! {
            sum += c
        }
        
        var isRightHand = true
        while counter > 0 {
            let ball = Ball(digit: (a?[(a?.count)! - counter])!, isRightHand: isRightHand)
            if ball.getDigit() != 0 {
                ballCount += 1
            }
            ballArray.append(ball)
            isRightHand = !isRightHand
            counter -= 1
        }
        
        counter = 0
        while ballCount < (sum / a!.count) || !isRightHand {
            let ball = Ball(digit: ballArray[counter].getDigit(), isRightHand: isRightHand)
            ballArray.append(ball)
            if ball.getDigit() != 0 {
                ballCount += 1
            }
            isRightHand = !isRightHand
            if counter == a!.count {
                counter = 0
            } else {
                counter += 1
            }
        }
    }
    
    func getDigitArray() -> [Int]? {
        return digitArray
    }
    
    func getBallArray() -> [Ball] {
        return ballArray
    }
    
    func getStringSequence() -> String {
        return stringSequence
    }
    
    func getCharacterArray() -> [[Character]] {
        var myArray: [[Character]] = [[Character]](repeating:[Character](repeating:" ", count: 55), count: 25)
        myArray[3][8] = "U"
        myArray[3][51] = "U"
        if leftHandOccupied {
            myArray[4][8] = "O"
        }
        if rightHandOccupied {
            myArray[4][51] = "O"
        }
        for ball in ballArray {
            if ball.isActive() && ball.getDigit() != 0 {
                myArray[ball.getYPosition()][ball.getXPosition()] = "O"
            }
        }
        
        return myArray
    }
    
    func updateBallSequence() -> Void {
        var atLeastOneActive = false
        var isSkipped = false
        for i in 0...ballArray.count-1 {
            if isSkipped {
                isSkipped = false
            } else {
                if ballArray[i].isActive() {
                    atLeastOneActive = true
                    ballArray[i].update()
                    if !ballArray[i].isActive() {
                        if ballArray[i].getIsRightHand() {
                            if ballArray[i].getDigit() % 2 == 0 {
                                rightHandOccupied = true
                            } else {
                                leftHandOccupied = true
                            }
                        } else {
                            if ballArray[i].getDigit() % 2 == 0 {
                                leftHandOccupied = true
                            } else {
                                rightHandOccupied = true
                            }
                        }
                    }
                    if ballArray[i].canPass() && !ballArray[i].getHasPassed() {
                        if i == ballArray.count-1 && !ballArray[0].isActive() {
                            ballArray[i].pass()
                            ballArray[0].makeActive()
                            if ballArray[0].getIsRightHand() {
                                rightHandOccupied = false
                            } else {
                                leftHandOccupied = false
                            }
                            isSkipped = true
                        } else {
                            if i != ballArray.count-1 && !ballArray[i+1].isActive() {
                                ballArray[i].pass()
                                ballArray[i+1].makeActive()
                                if ballArray[i+1].getIsRightHand() {
                                    rightHandOccupied = false
                                } else {
                                    leftHandOccupied = false
                                }
                                isSkipped = true
                            }
                        }
                    }
                }
            }
        }
        if !atLeastOneActive {
            ballArray[0].makeActive()
            if ballArray[0].getIsRightHand() {
                rightHandOccupied = false
            } else {
                leftHandOccupied = false
            }
        }
    }
    
    func length() -> Int {
        return digitArray!.count
    }
    
    func sum() -> Int {
        var sum = 0
        for c in digitArray! {
            sum += c
        }
        return sum
    }
    
    func isAllIntegers() -> Bool {
        return(Int(stringSequence) != nil)
    }
    
    func averageIsWhole() -> Bool {
        return(sum() % length() == 0)
    }
    
    static func hasNoConflicts(array: [Int]) -> Bool {
        if array.count == 1 {
            return true
        } else {
            let first = array[0]
            var newArray = [Int]()
            for i in 1...array.count-1 {
                let counter = first
                newArray.append(array[i])
                if counter - i == array[i] {
                    return false
                }
            }
            return hasNoConflicts(array: newArray)
        }
    }
    
    func instruction(int: Int) -> String {
        switch int {
        case 0:
            return "is empty."
        case 1:
            return "quickly hands-off the ball to the other hand."
        case 2:
            return "holds onto the ball."
        case 3:
            return "throws a cascade toss to the other hand."
        case 4:
            return "throws a column toss to itself."
        case 5:
            return "throws a 5-ball level toss to the other hand."
        case 6:
            return "throws a 6-ball level toss to itself."
        case 7:
            return "throws a 7-ball level toss to the other hand."
        case 8:
            return "throws an 8-ball level toss to itself."
        case 9:
            return "throws a 9-ball level toss to itself."
        default:
            return ""
        }
    }
    
    func instructionsArray() -> [String] {
        var hand = "right"
        var instructions = [String]()
        if length() % 2 == 0 {
            for i in 0...length()-1 {
                instructions.append("The " + hand + " hand " + instruction(int: (digitArray?[i])!))
                if hand == "right" {
                    hand = "left"
                } else {
                    hand = "right"
                }
            }
        } else {
            for i in 0...(length()*2)-1 {
                if i >= length() {
                    instructions.append("The " + hand + " hand " + instruction(int: (digitArray?[i-length()])!))
                } else {
                    instructions.append("The " + hand + " hand " + instruction(int: (digitArray?[i])!))
                }
                if hand == "right" {
                    hand = "left"
                } else {
                    hand = "right"
                }
            }
        }
        return instructions
    }
    
    func instructionsText() -> String {
        var text = ""
        for i in 0...instructionsArray().count-1 {
            text += "\n" + instructionsArray()[i]
        }
        return text
    }
    
}

extension String {
    
    func charAt(index: Int) -> Character {
        return [Character](characters)[index]
    }
    
    func toArray() -> [Int] {
        var array = [Int]();
        for i in 0...self.characters.count-1 {
            array.append((String (self.charAt(index: i)) as NSString).integerValue)
        }
        return array
    }
}
