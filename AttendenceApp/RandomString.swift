//
//  RandomString.swift
//  AttendenceApp
//
//  Created by MAD2_P02 on 5/2/20.
//  Copyright © 2020 MAD2_P02. All rights reserved.
//

import UIKit

class RandomStringController: UIViewController {

    @IBOutlet weak var txtRandomCode: UILabel!
    @IBAction func codeGenerateBtn(_ sender: UIButton) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HHmm"
        let time = dateFormatter.string(from: Date())
        let length = 8
        let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomCharacters = (0..<length).map{_ in characters.randomElement()!}
        let randomString = String(time + randomCharacters)
        txtRandomCode.text = randomString;
        sender.isHidden = true
    }
}
