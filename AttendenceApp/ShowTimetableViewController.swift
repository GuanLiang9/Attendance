//
//  ShowTimetableViewController.swift
//  AttendenceApp
//
//  Created by MAD2_P02 on 6/2/20.
//  Copyright © 2020 MAD2_P02. All rights reserved.
//

import Foundation
import UIKit

class ShowTimetableViewController: UITableViewController {
    
    var lessonList:[Lesson] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.reloadData() //refresh data
    }
    
    override func viewDidAppear(_ animated: Bool) {
        lessonList = LessonController().retrieveAllLessons()
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lessonList.count
        //return appDelegate.contactList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TimetableCell", for: indexPath)
        
        let lesson = lessonList[indexPath.row]
        cell.textLabel!.text = "\(lesson.modName)"
        cell.detailTextLabel!.text = "\(lesson.lessonTime) \(lesson.lessonDate) \(lesson.Location)"
        return cell
    }
    
    
    @IBAction func logoutBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Login") as
            UIViewController
        vc.modalPresentationStyle = .fullScreen // try without fullscreen
        present(vc, animated: true, completion: nil)
    }
}
