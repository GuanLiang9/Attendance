//
//  StudentFunctions.swift
//  AttendenceApp
//
//  Created by MAD2_P02 on 6/2/20.
//  Copyright © 2020 MAD2_P02. All rights reserved.
//

import UIKit
import CoreLocation

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBOutlet weak var fldDisplay: UITextField!
    @IBOutlet weak var txtInformation: UILabel!

    @IBAction func btnEnter(_ sender: Any) {
        locationManager.delegate = locationDelegate
        locationDelegate.locationCallback = { location in
        self.latestLocation = location
        let lat = String(format: "Lat: %3.8f", location.coordinate.latitude)
        let long = String(format: "Long: %3.8f", location.coordinate.longitude)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let time = dateFormatter.string(from: Date())
       
        self.txtInformation.text = ("\(lat), \(long), \(time)") ;
        }
        
        
    }
}
