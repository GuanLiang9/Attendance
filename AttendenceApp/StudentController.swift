//
//  StudentController.swift
//  AttendenceApp
//
//  Created by MAD2_P02 on 7/2/20.
//  Copyright © 2020 MAD2_P02. All rights reserved.
//

import Foundation
import CoreData
import UIKit
//Retrieve all lessons from Core Data to display in Mentor's timetable
class StudentController {
    func retrieveAllStudent()->[Student]{
        var student:[NSManagedObject] = []
        
        var studentList: [Student] = []
        
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDStudent")
        do {
            student = try context.fetch(fetchRequest)
            
            for s in student {
                let studName = s.value(forKeyPath: "studentName") as! String
                let studID = s.value(forKeyPath: "studentID") as! String
                let studPass = s.value(forKey: "studentPass") as! String
                let newStudent = Student(studentname: studName, studentno: studID, password: studPass)
                studentList.append(newStudent)
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return studentList
    }
}
