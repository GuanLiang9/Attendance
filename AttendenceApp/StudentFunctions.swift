//
//  StudentFunctions.swift
//  AttendenceApp
//
//  Created by MAD2_P02 on 6/2/20.
//  Copyright © 2020 MAD2_P02. All rights reserved.
//

import UIKit
import CoreLocation
import CoreData

class StudentFunctions: UIViewController {
    let locationDelegate = LocationDelegate()
    var latestLocation: CLLocation? = nil
    let locationManager: CLLocationManager = {
    $0.requestWhenInUseAuthorization()
    $0.desiredAccuracy = kCLLocationAccuracyBest
    $0.startUpdatingLocation()
    $0.startUpdatingHeading()
    return $0
    }(CLLocationManager())
        
    @IBOutlet weak var fldCode: UITextField!

    @IBAction func btnEnter(_ sender: Any) {
        
        if true{
            //Location
            locationManager.delegate = locationDelegate
            locationDelegate.locationCallback = { location in
            self.latestLocation = location
            let lat = String(format: "Lat: %3.8f", location.coordinate.latitude)
            let long = String(format: "Long: %3.8f", location.coordinate.longitude)
            let location = ("\(lat), \(long)")
            //Time
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HHmm"
            let time = dateFormatter.string(from: Date())
            
                
                
            //Compare the time, location and code of the student entered
            let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
            let managedContext = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDLesson")
                
            let searchString = self.fldCode.text
            let searchString2 = time
            let searchString3 = location
            
            fetchRequest.predicate = NSPredicate(format:"uniquecode = %@", searchString!)
                do {
                    let result = try managedContext.fetch(fetchRequest)
                    if result.count > 0 {
                        let obj = result[0]
                        
                        let code = obj.value(forKey: "uniquecode") as! String
                        let time = obj.value(forKey: "codetimegen") as! String
                        let location = obj.value(forKey: "location") as! String
                        
                        // include if condition to check for user attendance log validation
                        if (searchString == code && searchString2 == time )
                        {
                           
                            let entity = NSEntityDescription.entity(forEntityName: "CDAttendanceLog", in: managedContext)!
                            
                            let attendancelog = NSManagedObject(entity: entity, insertInto: managedContext)
                            
                            attendancelog.setValue(true , forKey: "attendanceStatus")
                            attendancelog.setValue(searchString2, forKey: "timelogged")
                            attendancelog.setValue(searchString, forKey: "uniqueCode")
                            
                            do{
                                try managedContext.save()
                                print("Successfully logged the attendance for this user")
                            }
                            
                            catch let error as NSError{
                                print("Could not save this. \(error), \(error.userInfo)")
                            }
                            self.correctCode()
                        }
                        else if (searchString == code || searchString2 == time || searchString3 == location)
                        {
                            self.errorCode()
                        }
                        
                    }
                    else{
                        
                        // show invalid code entered error
                        self.errorCode()
                    }
                } catch let error as NSError {
                    print("Could not fetch. \(error), \(error.userInfo)")
                }
                
            }
                  
        }
    }
    @IBAction func btnLogout(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Login") as
                UIViewController
            vc.modalPresentationStyle = .fullScreen // try without fullscreen
            present(vc, animated: true, completion: nil)
    }
    
    func errorCode(){
           let alertView = UIAlertController(title:"Invalid Code",message: "Please re-enter the code",preferredStyle: UIAlertController.Style.alert)
           alertView.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {_ in}))
           self.present(alertView,animated: true,completion: nil)
       }
    
    func correctCode(){
        let alertView = UIAlertController(title:"Correct Code",message: "Your attendance had been marked",preferredStyle: UIAlertController.Style.alert)
        alertView.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {_ in}))
        self.present(alertView,animated: true,completion: nil)
    }
}
