//
//  ViewController.swift
//  Tapper
//
//  Created by Joseph Pilon on 3/18/16.
//  Copyright © 2016 Gulp Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tapperImg: UIImageView!
    @IBOutlet weak var coinBtn: UIButton!
    @IBOutlet weak var tapLbl: UILabel!
    @IBOutlet weak var tapNumberTextField: UITextField!
    @IBOutlet weak var playImg: UIImageView!
    @IBOutlet weak var playBtn: UIButton!
    
    var maxTaps = 0
    var curTaps = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapNumberTextField.delegate = self
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }

    @IBAction func playTapped(sender: AnyObject) {
        
        if let taps = tapNumberTextField.text where !taps.isEmpty {
            maxTaps = Int(taps)!
            tapperImg.hidden = true
            coinBtn.hidden = false
            tapLbl.hidden = false
            tapNumberTextField.hidden = true
            playImg.hidden = true
            playBtn.hidden = true
        }
    }
    @IBAction func coinTapped(sender: AnyObject) {
        if curTaps > maxTaps  {
            tapLbl.text = "Tap the coin to reset"
            curTaps = 0
        } else if curTaps == 0 {
            curTaps = 1
            maxTaps = 0
            tapperImg.hidden = false
            coinBtn.hidden = true
            tapLbl.hidden = true
            tapNumberTextField.text = ""
            tapNumberTextField.hidden = false
            playImg.hidden = false
            playBtn.hidden = false
        } else {
            if curTaps == 1 {
                tapLbl.text = "\(curTaps) Tap"
            } else {
                tapLbl.text = "\(curTaps) Taps"
            }
            curTaps += 1
        }
    }

    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = NSCharacterSet(charactersInString: "1234567890")
        let replacementTextIsNumeric = string.rangeOfCharacterFromSet(allowedCharacters)
        
        if replacementTextIsNumeric == nil {
            return false
        } else {
            return true
        }
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}

