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
        keyboard.autoresizingMask = .flexibleHeight
        keyboard.delegate = self
        textField.inputView = keyboard
        
        textField.inputAccessoryView = {
            let accessoryView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 44))
            accessoryView.backgroundColor = UIColor.purple
            
            let button = UIButton()
            button.setTitle("Default Keyboard", for: .normal)
            button.setTitleColor(UIColor.lightText, for: .normal)
            button.addTarget(self, action: #selector(useDefaultKeyboard(_:)), for: .touchUpInside)
            accessoryView.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.topAnchor.constraint(equalTo: accessoryView.topAnchor).isActive = true
            button.leftAnchor.constraint(equalTo: accessoryView.leftAnchor).isActive = true
            button.bottomAnchor.constraint(equalTo: accessoryView.bottomAnchor).isActive = true
            button.rightAnchor.constraint(equalTo: accessoryView.rightAnchor).isActive = true
            
            return accessoryView
        }()
    }
    
    @objc func useDefaultKeyboard(_ sender: UIButton) {
        textField.inputView = nil
        textField.inputAccessoryView = nil
        textField.reloadInputViews()
    }
}

extension ViewController: KeyboardDelegate {
    func keyTapped(key: String) {
        textField.insertText(key)
    }
}
