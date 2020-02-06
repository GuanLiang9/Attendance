//
//  AdminViewController.swift
//  AttendenceApp
//
//  Created by ren kee on 5/2/20.
//  Copyright © 2020 MAD2_P02. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController {

    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    let adminController = AdminController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func viewStudentbtn(_ sender: Any) {
    }
    
    @IBAction func viewMentorbtn(_ sender: Any) {
    }
    
    
    @IBAction func resetDBbtn(_ sender: Any) {
        adminController.SetUpBaseStudent()
        adminController.SetUpBaseMentor()
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
