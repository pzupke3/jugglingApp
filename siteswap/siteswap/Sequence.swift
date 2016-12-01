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
    
    init(number: String) {
        stringSequence = number
        let a: [Int]? = stringSequence.toArray()
        digitArray = a
    }
    
    func getDigitArray() -> [Int]? {
        return digitArray
    }
    
    func getStringSequence() -> String {
        return stringSequence
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
                let number = digitArray?[i]
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
