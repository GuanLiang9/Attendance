//
//  RandomString.swift
//  AttendenceApp
//
//  Created by MAD2_P02 on 5/2/20.
//  Copyright © 2020 MAD2_P02. All rights reserved.
//

import UIKit

class RandomString: UIViewController {

    @IBOutlet weak var txtRandom: UILabel!
    @IBAction func btnRandom(_ sender: UIButton) {
        let length = 12
        let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomCharacters = (0..<length).map{_ in characters.randomElement()!}
        let randomString = String(randomCharacters)
        txtRandom.text = randomString;
        sender.isHidden = true
    }
    
}
