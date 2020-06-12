//
//  receivecoordinates.swift
//  Autoattendance
//
//  Created by Maaz Asim Taimuri on 4/23/20.
//  Copyright © 2020 Maaz Asim Taimuri. All rights reserved.
//

import Foundation
class Receivecoordinates{
    static let shared = Receivecoordinates()
    var long = 0.0
    var lat = 0.0
    var alt = 0.0

    func getcoordinates(id: String) -> String {
            
        if let url = URL(string: "http://localhost:3456/get?id="+id) {
            do {
                let contents = try String(contentsOf: url)
                print(contents)
                print(url)
                return contents
            } catch {
                print("contents could not be loaded")
            }
        } else {
            return "the URL was bad!"
            
        }

    
    return "please connect to server"
        
}
    func parsecoordinates(contents: String) -> (Double,Double,Double) {
      
        let replaced = contents.replacingOccurrences(of: "{", with: "")
        let replace = replaced.replacingOccurrences(of: "}", with: "")
        let arrays = replace.components(separatedBy: ",")
        print(arrays)
        print("\"long\"")
        for array in arrays {
            print(array)
            if array.hasPrefix("\"long\"") {
                print("found long")
                let array1 = array.components(separatedBy: ":")
                print(array1[1])
                long = Double(array1[1])!
                    print(long)
                
                }
        
         else if array.hasPrefix("\"lat\"") {
                 let array2 = array.components(separatedBy: ":")
                             print(array2[1])
                             lat = Double(array2[1])!
                                 print(long)
               
                    print(lat)
                
                }
            
        
            else if array.hasPrefix("\"alt\"") {
                    let array3 = array.components(separatedBy: ":")
                                  print(array3[1])
                                  alt = Double(array3[1])!
                                      print(alt)
                
                        print(alt)
                        
                    
                    }
                
            

    }

return (long,lat,alt)
    }


func getTodayString() -> String{

        let date = Date()
        let calender = Calendar.current
        let components = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)

        let year = components.year
        let month = components.month
        let day = components.day
        let hour = components.hour
        let minute = components.minute
        let second = components.second

        let today_string = String(year!) + "-" + String(month!) + "-" + String(day!) + " " + String(hour!)  + ":" + String(minute!) + ":" +  String(second!)

        return today_string

    }
}
