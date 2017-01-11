//
//  ViewController.swift
//  siteswap
//
//  Created by Peter Zupke on 11/6/16.
//  Copyright © 2016 Peter Zupke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberTextField: UITextField!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        if let input = numberTextField.text {
            let sequence = Sequence(number: input)
            if !sequence.isAllIntegers() {
                let alert = UIAlertController(title: "Error", message: "Your input can only contain integers!", preferredStyle: .alert)
                let action = UIAlertAction(title: "Try Again", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            } else if !sequence.averageIsWhole()  {
                let alert = UIAlertController(title: "Error", message: "The average of the digits must be a whole number!", preferredStyle: .alert)
                let action = UIAlertAction(title: "Try Again", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            } else if !Sequence.hasNoConflicts(array: sequence.getDigitArray()!) {
                let alert = UIAlertController(title: "Error", message: "That sequence won't work! The balls will contact each other!", preferredStyle: .alert)
                let action = UIAlertAction(title: "Try Again", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            } else {
                updateScreen(sequence: sequence)
                    
                        
//                    self.textView.text = "hello"
//                    var limit = true
//                    while limit {
//                        let time = DispatchTime.now() + 2
//                        DispatchQueue.main.asyncAfter(deadline: time) {
//                            limit = false
//                        }
//                    }

            }
        }
    }
    
    func updateScreen(sequence: Sequence) {
        var text = ""
        sequence.updateBallSequence()
        text += String(sequence.getBallArray().count) + "\n"
        let charArray = sequence.getCharacterArray()
        for i in 0...24 {
            let index = 24 - i
            for j in 0...54 {
                text += String(charArray[index][j])
            }
            text += "\n"
        }
        self.textView.text = text
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(0.1)) {
            self.updateScreen(sequence: sequence)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

