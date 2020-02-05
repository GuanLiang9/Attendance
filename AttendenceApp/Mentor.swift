//
//  Mentor.swift
//  AttendenceApp
//
//  Created by MAD2_P02 on 5/2/20.
//  Copyright © 2020 MAD2_P02. All rights reserved.
//

import Foundation

class Mentor{
    //mentor variables
    var mentorName: String
    var mentorNo: String
    var Password: String
    
    //initialize mentor object
    init(mentorname: String, mentorno: String, password: String){
        mentorName = mentorname
        mentorNo = mentorno
        Password = password
    }
}
