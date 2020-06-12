//
//  networkservices.swift
//  Autoattendance
//
//  Created by Maaz Asim Taimuri on 3/31/20.
//  Copyright © 2020 Maaz Asim Taimuri. All rights reserved.
//

import Foundation



class Networkservice:Locationviewcontroller{
    static let shared = Networkservice()

    let URL_BASE = "http://localhost:3456/update?"
    let session = URLSession(configuration: .default)
    
    func upteachercood (latitude: String,longitude: String,altitude: String,id: String){
        let url = URL(string: URL_BASE)!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!

        components.queryItems = [
            URLQueryItem(name: "id", value: id),
            URLQueryItem(name: "long", value: longitude),
            URLQueryItem(name: "lat", value: latitude),
            URLQueryItem(name: "alt", value: altitude)
        ]

        let query = components.url!.query!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = Data(query.utf8)
        let url1 = URL(string: "\(URL_BASE)\(query)")
        var request1 = URLRequest(url: url1!)
        request1.httpMethod = "POST"
        request1.httpBody = "Data to send to your backend".data(using: .utf8)!

        let task = URLSession.shared.dataTask(with: request1) { data, response, error in
            if error != nil {
                //There was an error
            } else {
                //The HTTP request was successful
                print(String(data: data!, encoding: .utf8)!)
            }

        }
        task.resume()
      
            
        }
 }



