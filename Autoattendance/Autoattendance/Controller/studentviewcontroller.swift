//
//  studentviewcontroller.swift
//  Autoattendance
//
//  Created by Maaz Asim Taimuri on 4/1/20.
//  Copyright © 2020 Maaz Asim Taimuri. All rights reserved.
//

import UIKit
import CoreLocation

class studentviewcontroller: UIViewController {
var locationManager = CLLocationManager()
   override func viewDidLoad() {
      super.viewDidLoad()
      locationManager.requestWhenInUseAuthorization()
      var currentLoc: CLLocation!
      if(CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
      CLLocationManager.authorizationStatus() == .authorizedAlways) {
         currentLoc = locationManager.location
         print(currentLoc.coordinate.latitude)
         print(currentLoc.coordinate.longitude)
      }
   }
}
