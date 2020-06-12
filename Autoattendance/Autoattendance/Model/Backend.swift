//
//  Backend.swift
//  Autoattendance
//
//  Created by Maaz Asim Taimuri on 3/28/20.
//  Copyright © 2020 Maaz Asim Taimuri. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

class Location: UIViewController, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
            locationManager.startUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")    }
}
//class timetable{
    let date = Date()
    let calendar = Calendar.current
    let hour = calendar.component(.hour, from: date)
    let minutes = calendar.component(.minute, from: date)


