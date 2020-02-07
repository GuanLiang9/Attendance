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
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var rowSelected: Int!
    var parentController: ShowTimetableViewController!

    
    @IBAction func codeGenerateBtn(_ sender: UIButton) {
        // Date function to retrieve time when mentor generate the code, formatted in
        // HH:mm
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HHmm"
        let time = dateFormatter.string(from: Date())
        // Length of random string
        let length = 8
        let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomCharacters = (0..<length).map{_ in characters.randomElement()!}
        let randomString = String(time + randomCharacters)
        // Generated random code
        txtRandomCode.text = randomString;
        // Disable the button once its pressed to prevent regeneration of another code
        sender.isEnabled = false
        
        // Retrieve value of random code
        let randomCode = txtRandomCode.text!
        let lesson = parentController.lessonList[rowSelected]
        LessonController().updateLesson(modulename: lesson.modName, newLesson: Lesson(lessondate: lesson.lessonDate, lessontime: lesson.lessonTime, location: lesson.Location, modname: lesson.modName, uniquecode: randomCode, codetimegen: time))
        displayAlert()
    }
    
    func displayAlert(){
        let alertView = UIAlertController(title:"Success",message: "Code has been successfully generated and updated in the corresponding lesson record",preferredStyle: UIAlertController.Style.alert)
        alertView.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {_ in}))
        self.present(alertView,animated: true,completion: nil)
    }
    
    @IBAction func logoutBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Login") as
            UIViewController
        vc.modalPresentationStyle = .fullScreen // try without fullscreen
        present(vc, animated: true, completion: nil)
    }
}
