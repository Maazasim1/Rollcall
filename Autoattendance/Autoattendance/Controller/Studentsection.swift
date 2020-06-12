//
//  studentsection.swift
//  Autoattendance
//
//  Created by Maaz Asim Taimuri on 4/6/20.
//  Copyright © 2020 Maaz Asim Taimuri. All rights reserved.
//

import UIKit
import CoreLocation
import LocalAuthentication
class Studentsection: UIViewController,CLLocationManagerDelegate {
    
 var locationManager: CLLocationManager = CLLocationManager()
    var latitude :Double = 0.0
       var longitude :Double = 0.0
       var altitude :Double = 0.0
    var check1 = false

    @IBOutlet weak var STUDENTID: UITextField!
    @IBOutlet weak var unimage: UIImageView!
    @IBOutlet weak var studentrollno: UITextField!
    @IBOutlet weak var joinnclass: UIButton!
    
    
   
    
    @IBAction func receivebutton(_ sender: Any) {
        let id = self.STUDENTID.text!
                           let roll = self.studentrollno.text!
        let text = (roll+" PRESENT "+Receivecoordinates.shared.getTodayString()) //just a text
         let text1 = (roll+" ABSENT "+Receivecoordinates.shared.getTodayString()) //just a text

        print("MAaz")
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "mysegue", sender: self)
        }
       
     
       let concurrentQueue = DispatchQueue(label: "net.ericd.hello", attributes: .concurrent)
              concurrentQueue.async {
        print("button pressed")
        let test = Thread.isMainThread
        print(test)
               
           
                
         var counter=0
        var counter1=0
        var check=0
       
            while(counter < 7){
              
                       
                self.locationManager.requestWhenInUseAuthorization()
                self.locationManager.startUpdatingLocation()

              let(long,lat,_) = Receivecoordinates.shared.parsecoordinates(contents: Receivecoordinates.shared.getcoordinates(id: id))
              let teachercood = CLLocation(latitude: lat, longitude: long)
                let studentcood = CLLocation(latitude: self.latitude, longitude: self.longitude)
                let distanceInMeters = teachercood.distance(from: studentcood) // result is in meters
              if(distanceInMeters <= 10)
               {
             counter1=counter1+1
                print(counter1)
                }
                counter=counter+1
                print(counter)
                               sleep(5)
                
            }
        while(check != 1){
        check = Fingerprint.shared.authenticationWithTouchID()
        print(check)
            sleep(10)
        }
      
        if(check==1 && counter1>=3){
            self.check1=true
                           
                      print("Maaz jaani attendance mark horahi hai")
                       let file = "attendance.txt" //this is the file. we will write to and read from it
                       
                               
                           

                       
                       if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {

                           let fileURL = dir.appendingPathComponent(file)

                           //writing
                           do {
                               try text.write(to: fileURL, atomically: false, encoding: .utf8)
                            DispatchQueue.main.async {
                            self.performSegue(withIdentifier: "promptsegue", sender: nil)
                            }
                            
                           }
                           catch {print("file nishta")}

                           //reading
                           do {
                                                let text2 = try String(contentsOf: fileURL, encoding: .utf8)
                               print(text2)
                                            }
                                            catch {print("itna andhera kiun hai bhaiiiii")}
                           
                        
                       }
                      
                       }
                    
                       
               
           
            if(counter1<3)
            {
              print("Maaz jani kuch tho masla hai")
              print("Maaz jaani attendance mark horahi hai")
              let file = "attendance.txt" //this is the file. we will write to and read from it

             

              if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {

                  let fileURL = dir.appendingPathComponent(file)

                  //writing
                  do {
                      try text1.write(to: fileURL, atomically: false, encoding: .utf8)
                  }
                  catch {print("file nhi milli be")}

                  //reading
                  do {
                                       let text2 = try String(contentsOf: fileURL, encoding: .utf8)
                      print(text2)
                                   }
                                   catch {print("itna andhera kiun hai bhaiiiii")}
                  
               
              }
              
            }

    

        
    }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        unimage.layer.cornerRadius = 10.0
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
               locationManager.delegate = self
        joinnclass.layer.cornerRadius = 10
        locationManager.startUpdatingLocation()
        var checking = 1
       checking = Fingerprint.shared.authenticationWithTouchID()
        print(checking)
          
        
    }
    func locationManager(_ manager: CLLocationManager,
                                    didUpdateLocations locations: [CLLocation]) {
           
           let latestLocation: CLLocation = locations[locations.count - 1]
           
           latitude = Double(
                                  latestLocation.coordinate.latitude)
           longitude = Double(
                                   latestLocation.coordinate.longitude)
           altitude = Double(
                                  latestLocation.altitude)
        }
           
          
    }





