//
//  ViewController.swift
//  AttendenceApp
//
//  Created by MAD2_P02 on 3/2/20.
//  Copyright © 2020 MAD2_P02. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {


    @IBOutlet weak var userFld: UITextField!
    @IBOutlet weak var pwdFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginTeacher(_ sender: Any) {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Mentor")
        let searchString = self.userFld.text
        let searchstring2 = self.pwdFld.text
        fetchRequest.predicate = NSPredicate(format:"mentorno = %@", searchString!)
        do {
            let result = try managedContext.fetch(fetchRequest)
            if result.count > 0
            {
                let username = (result[0] as AnyObject).value(forKey: "mentorno") as! String
                let password = (result[0] as AnyObject).value(forKey: "password") as! String
                if (searchString == username && searchstring2 == password)
                {
                    let storyboard = UIStoryboard(name: "Mentor", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "Mentor") as
                        UIViewController
                    vc.modalPresentationStyle = .fullScreen // try without fullscreen
                    present(vc, animated: true, completion: nil)
                }
                else if (searchString == username || searchstring2 == password)
                {
                    loginFailAlert()
                }
            }
            else
            {
                loginFailAlert()
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    @IBAction func loginStudent(_ sender: Any) {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
        let searchString = self.userFld.text
        let searchstring2 = self.pwdFld.text
        fetchRequest.predicate = NSPredicate(format:"studentno = %@", searchString!)
        do {
            let result = try managedContext.fetch(fetchRequest)
            if result.count > 0
            {
                let username = (result[0] as AnyObject).value(forKey: "studentno") as! String
                let password = (result[0] as AnyObject).value(forKey: "password") as! String
                if (searchString == username && searchstring2 == password)
                {
                    let storyboard = UIStoryboard(name: "Student", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "Student") as
                        UIViewController
                    vc.modalPresentationStyle = .fullScreen // try without fullscreen
                    present(vc, animated: true, completion: nil)
                }
                else if (searchString == username || searchstring2 == password)
                {
                    loginFailAlert()
                }
            }
            else
            {
                loginFailAlert()
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
    }
    
    @IBAction func loginAdmin(_ sender: Any) {
        if true { // if username and password is correct
            
            let storyboard = UIStoryboard(name: "Admin", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Admin") as
                UIViewController
            vc.modalPresentationStyle = .fullScreen // try without fullscreen
            present(vc, animated: true, completion: nil)
        }
    }
    
    func loginFailAlert(){
        let alertView = UIAlertController(title:"Invalid User",message: "Please re-enter your login credentials",preferredStyle: UIAlertController.Style.alert)
        alertView.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {_ in}))
        self.present(alertView,animated: true,completion: nil)
    }
}

