//
//  ViewController.swift
//  CustomViewsFromDataInput
//
//  Created by Migu on 2017/11/23.
//  Copyright © 2017年 VictorChee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let keyboard = Bundle.main.loadNibNamed("Keyboard", owner: self, options: [:])?.first as! Keyboard
        keyboard.frame = CGRect(x: 0, y: 0, width: 0, height: 200)
        keyboard.delegate = self
        textField.inputView = keyboard
    }
    
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
}

extension ViewController: KeyboardDelegate {
    func keyTapped(key: String) {
        textField.insertText(key)
    }
}
