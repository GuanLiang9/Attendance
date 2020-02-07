//
//  AdminStudentViewController.swift
//  AttendenceApp
//
//  Created by MAD2_P02 on 7/2/20.
//  Copyright © 2020 MAD2_P02. All rights reserved.
//

import UIKit

class AdminStudentViewController: UIViewController {

    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    let adminController = AdminController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func viewStudentbtn(_ sender: Any) {
    }
    
    @IBAction func addStudentbtn(_ sender: Any) {
    }
    
    
    @IBAction func resetStudentDBbtn(_ sender: Any) {
        
        let alertView = UIAlertController(title: "Confirm?", message: "Are you sure to reset the database??", preferredStyle: UIAlertController.Style.alert)
        
        alertView.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: { (_) in print("User clicked No button") }))
        alertView.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: { (_) in print("User clicked Yes button") }))
        
        self.present(alertView, animated: true, completion: nil)
        
        AdminStudentController().resetDB()
        adminController.SetUpBaseStudent()
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
