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
                let alert = UIAlertController(title: "Number", message: String(sequence.getStringSequence()), preferredStyle: .alert)
                let action = UIAlertAction(title: "New Number", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
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

