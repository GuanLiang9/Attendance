//
//  AdminStudentController.swift
//  AttendenceApp
//
//  Created by MAD2_P02 on 7/2/20.
//  Copyright © 2020 MAD2_P02. All rights reserved.
//

import UIKit
import CoreData

class AdminStudentController{
    
    func resetDB(){
        
        let context = (UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "CDStudent")
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
        print("Student Database successfully cleared")
    }
    
    func AddStudent(newStudent: Student){
        
    }
    
    func retrieveAllStudent()->[Student]{
        
        var studentlist: [NSManagedObject] = []
        var allStudent: [Student] = []
        
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDStudent")
        do {
            studentlist = try context.fetch(fetchRequest)
            
            for s in studentlist{
                
                let studentname = s.value(forKey: "studentName") as? String
                let studentno = s.value(forKey: "studentID") as? String
                let password = s.value(forKey: "password") as? String
                
                let newStudent = Student(studentname: studentname ?? "", studentno: studentno ?? "", password: password ?? "")
                
                allStudent.append(newStudent)
            }
        }
        catch let error as NSError{
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        
        return allStudent
    }
    
    func updateStudentDetails(studentID: String, updatedStudent: Student){
      
        
    }
    
    func deleteStudent(studentno: String){
        
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDStudent")
        
        fetchRequest.predicate = NSPredicate(format: "studentID = %@", studentno)
        
        do {
            let returnstudent = try context.fetch(fetchRequest)
            let obj = returnstudent[0]
            context.delete(obj)
            print("Student \(obj.value(forKey: "studentName")) with student number \(obj.value(forKey: "studentID")) is Deleted")
            try context.save()
        }
        
        catch let error as NSError{
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
    }
}
