//
//  LessonController.swift
//  AttendenceApp
//
//  Created by MAD2_P02 on 6/2/20.
//  Copyright © 2020 MAD2_P02. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class LessonController {
    
    //Retrieve all lessons from Core Data to display in Mentor's timetable
    func retrieveAllLessons()->[Lesson]{
        var lesson:[NSManagedObject] = []
        
        var lessonList: [Lesson] = []
        
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDLesson")
        do {
            lesson = try context.fetch(fetchRequest)
            
            for l in lesson {
                let modName = l.value(forKeyPath: "modulename") as! String
                let lessonDate = l.value(forKeyPath: "lessondate") as! Date
                let lessonLocation = l.value(forKeyPath: "location") as! String
                let lessonTime = l.value(forKeyPath: "lessontime") as! String
                let lessonCodeTime = l.value(forKeyPath: "codetimegen") as! String
                let lessonCode = l.value(forKeyPath: "uniquecode") as! String
                let newLesson = Lesson(lessondate: lessonDate, lessontime: lessonTime, location: lessonLocation, modname: modName, uniquecode: lessonCode, codetimegen: lessonCodeTime)
                lessonList.append(newLesson)
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return lessonList
    }
    
    
    func resetDB(){
        
        let context = (UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "CDLesson")
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
        print("Lesson Database successfully cleared")
    }
    
    func assignMentorToLesson(){
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDLesson")
        fetchRequest.predicate = NSPredicate(format: "modulename = %@", "MAD2 P01")
        do{
            let test = try context.fetch(fetchRequest)
            let cdlesson = test[0]
            
            let fetchMentorRequest = NSFetchRequest<NSManagedObject>(entityName: "CDMentor")
            fetchMentorRequest.predicate = NSPredicate(format: "mentorID = %@", "T10111111Z")
            do{
                let test = try context.fetch(fetchMentorRequest)
                //print("Added for \(test[0].value(forKey: "lastname") as! String)")
                let cdmentor = test[0]
                cdlesson.setValue(cdmentor, forKey: "mentor")
                try context.save()
                print("successfully assigned mentor to lesson")
                
            }
            catch {
                print(error)
            }
        }
        catch {
            print(error)
        }
    }
        
    // Add the generated code to corresponding Lesson record in the database
    func updateLesson(modulename:String, newLesson: Lesson){
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDLesson")
        let lessonmodulename = newLesson.modName
        fetchRequest.predicate = NSPredicate(format:"modulename = %@", lessonmodulename)
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            let lessonObj = result[0]
            
            lessonObj.setValue(newLesson.uniqueCode, forKey: "uniquecode")
            lessonObj.setValue(newLesson.codeTimeGen, forKey: "codetimegen")
            
            do {
                try managedContext.save()
            } catch let error as NSError {
                print ("Update error: \(error), \(error.userInfo)")
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    
    func assignmentStudentToLesson(){
            
    //        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
    //        let context = appDelegate.persistentContainer.viewContext
    //
    //
    //        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDLesson")
    //        fetchRequest.predicate = NSPredicate(format: "modulename = %@", "MAD2 P01")
    //        do{
    //            let test = try context.fetch(fetchRequest)
    //            let cdlesson = test[0]
    //
    //            let fetchStudentRequest = NSFetchRequest<NSManagedObject>(entityName: "CDStudent")
    //            fetchStudentRequest.predicate = NSPredicate(format: "studentID = %@", "S10111111A")
    //
    //            do{
    //                let test = try context.fetch(fetchStudentRequest)
    //                //print("Added for \(test[0].value(forKey: "lastname") as! String)")
    //                let cdstudent = test[0]
    //                cdlesson.setValue(cdstudent, forKey: "student")
    //                try context.save()
    //                print("successfully assigned student to lesson")
    //
    //            }
    //            catch {
    //                print(error)
    //            }
    //        }
    //        catch {
    //            print(error)
    //        }
        
    }
}
