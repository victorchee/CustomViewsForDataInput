//
//  Keyboard.swift
//  CustomViewsFromDataInput
//
//  Created by Migu on 2017/11/23.
//  Copyright © 2017年 VictorChee. All rights reserved.
//

import UIKit

protocol KeyboardDelegate: class {
    func keyTapped(key: String)
}

class Keyboard: UIView {

    weak var delegate: KeyboardDelegate?
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let key = sender.title(for: .normal) else { return }
        delegate?.keyTapped(key: key)
    }
}
