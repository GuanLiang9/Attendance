//
//  AdminMentorViewController.swift
//  AttendenceApp
//
//  Created by MAD2_P02 on 7/2/20.
//  Copyright © 2020 MAD2_P02. All rights reserved.
//

import UIKit

class AdminMentorViewController: UIViewController {

    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    let adminController = AdminController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func viewMentorbtn(_ sender: Any) {
    }
    
    
    @IBAction func addMentorbtn(_ sender: Any) {
    }
    
    @IBAction func resetMentorDBbtn(_ sender: Any) {
        AdminMentorController().resetDB()
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
