//
//  Lesson.swift
//  AttendenceApp
//
//  Created by ren kee on 5/2/20.
//  Copyright © 2020 MAD2_P02. All rights reserved.
//

import Foundation

class Lesson {
    
    var lessonDate: Date
    var lessonTime: String
    var Location: String
    var modName: String
    
    var uniqueCode: String
    var codeTimeGen: String
    
    init(lessondate: Date, lessontime: String, location: String, modname: String, uniquecode: String, codetimegen: String) {
        
        lessonDate = lessondate
        lessonTime = lessontime
        Location = location
        modName = modname
        
        // unique code of lesson is usually at the moment the lesson is created
        uniqueCode = uniquecode
        // code time gen refers to the time when the unique code above is generated
        codeTimeGen = codetimegen
    }
    
}
