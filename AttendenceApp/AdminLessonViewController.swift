//
//  AdminLessonViewController.swift
//  AttendenceApp
//
//  Created by MAD2_P02 on 7/2/20.
//  Copyright © 2020 MAD2_P02. All rights reserved.
//

import UIKit

class AdminLessonViewController: UIViewController {

    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    let adminController = AdminController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func viewLessonbtn(_ sender: Any) {
    }
    
    
    @IBAction func addLessonbtn(_ sender: Any) {
    }
    
    
    @IBAction func resetLessonDBbtn(_ sender: Any) {
        // reset the database
        LessonController().resetDB()
        //set up base record
        adminController.SetUpBaseLesson()
        LessonController().assignMentorToLesson()
//        LessonController().assignmentStudentToLesson()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
