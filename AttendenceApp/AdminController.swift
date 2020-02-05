//
//  AdminController.swift
//  AttendenceApp
//
//  Created by ren kee on 5/2/20.
//  Copyright © 2020 MAD2_P02. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class AdminController{
    
    // Set up base Student Record
    func SetUpBaseStudent(){
        
        var studentList: [Student] = []
        
        let studentOne: Student = Student(studentname: "Alan Tan", studentno: "S10111111A" , password: "11111111")
        let studentTwo: Student = Student(studentname: "Brian Lim", studentno: "S10122222 " , password: "22222222")
        let studentThree: Student = Student(studentname: "Champion Quek", studentno: "S10133333C" , password: "33333333")
        let studentFour: Student = Student(studentname: "Daniel Tan", studentno: "S10144444D" , password: "44444444")
        let studentFive: Student = Student(studentname: "Edwin Tan", studentno: "S10155555E" , password: "55555555")
        let studentSix: Student = Student(studentname: "Freddy Lim", studentno: "S10166666F" , password: "66666666")
        let studentSeven: Student = Student(studentname: "Gabriel Tan", studentno: "S10177777G" , password: "77777777")
        let studentEight: Student = Student(studentname: "Howard Lim", studentno: "S10188888H" , password: "88888888")
        let studentNine: Student = Student(studentname: "Ian Tang", studentno: "S10199999I" , password: "99999999")
        let studentTen: Student = Student(studentname: "Justin Lam", studentno: "S10112345J" , password: "12345678")
        
        studentList.append(studentOne)
        studentList.append(studentTwo)
        studentList.append(studentThree)
        studentList.append(studentFour)
        studentList.append(studentFive)
        studentList.append(studentSix)
        studentList.append(studentSeven)
        studentList.append(studentEight)
        studentList.append(studentNine)
        studentList.append(studentTen)
        
        
        // Insert the student record into coredata
        
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "CDStudent", in: context)!
        
        for s in studentList{
            let student = NSManagedObject(entity: entity, insertInto: context)
            student.setValue(s.studentName, forKey: "studentName")
            student.setValue(s.studentNo, forKey: "studentID")
            student.setValue(s.Password, forKey: "password")
            
            do{
                try context.save()
                print("Student is successfully created!")
            }
            catch let error as NSError{
                print("Could not create student record. \(error), \(error.userInfo)")
            }
        }
        
    }
    
    func SetUpBaseMentor(){
        
        var mentorList: [Mentor] = []
        
        let mentorOne: Mentor = Mentor(mentorname: "Zac Tan", mentorno: "T10111111Z" , password: "11111111")
        let mentorTwo: Mentor = Mentor(mentorname: "Yam Kum Teng", mentorno: "T10122222Y" , password: "22222222")
        let mentorThree: Mentor = Mentor(mentorname: "Xavier Yun", mentorno: "T10133333X" , password: "33333333")
        
        mentorList.append(mentorOne)
        mentorList.append(mentorTwo)
        mentorList.append(mentorThree)
        
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "CDMentor", in: context)!
        
        for m in mentorList{
            let mentor = NSManagedObject(entity: entity, insertInto: context)
            mentor.setValue(m.mentorName, forKey: "mentorName")
            mentor.setValue(m.mentorNo, forKey: "mentorID")
            mentor.setValue(m.Password, forKey: "password")
            
            do{
                try context.save()
                print("Mentor is successfully created!")
            }
            catch let error as NSError{
                print("Could not create mentor record. \(error), \(error.userInfo)")
            }
        }
        
    }
    
    
}
