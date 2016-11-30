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
