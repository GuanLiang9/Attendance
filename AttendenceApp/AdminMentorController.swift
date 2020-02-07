//
//  AdminMentorController.swift
//  AttendenceApp
//
//  Created by MAD2_P02 on 7/2/20.
//  Copyright © 2020 MAD2_P02. All rights reserved.
//

import UIKit
import CoreData

class AdminMentorController{
    
    func resetDB(){
        
        let context = (UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "CDMentor")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        do
        {
            try context.execute(deleteRequest)
            try context.save()
        }
        catch
        {
            print ("There was an error")
        }
        print("Mentor Database successfully cleared")
    }
    
    func AddMentor(newMentor: Mentor){
        
    }
    
    func retrieveAllMentor()->[Mentor]{
        
        var mentorlist: [NSManagedObject] = []
        var allMentor: [Mentor] = []
        
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDMentor")
//        do {
//            mentorlist = try context.fetch(fetchRequest)
//            
//            for s in mentorlist{
//                
//                let studentname = s.value(forKey: "studentName") as? String
//                let studentno = s.value(forKey: "studentID") as? String
//                let password = s.value(forKey: "password") as? String
//                
//                let newStudent = Student(studentname: studentname ?? "", studentno: studentno ?? "", password: password ?? "")
//                
//                allMentor.append(newStudent)
//            }
//        }
//        catch let error as NSError{
//            print("Could not fetch. \(error), \(error.userInfo)")
//        }
        
        
        return allMentor
    }
    
    func updateMentorDetails(mentorID: String, updatedMentor: Mentor){
      
        
    }
    
    
    
    
}

