//
//  authenticate.swift
//  Autoattendance
//
//  Created by Maaz Asim Taimuri on 5/31/20.
//  Copyright © 2020 Maaz Asim Taimuri. All rights reserved.
//

import Foundation
import LocalAuthentication


func fingerprint() -> Bool {
    let context = LAContext()
        var error: NSError?
        var check = false

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Identify yourself!"

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                [weak self] success, authenticationError in

                DispatchQueue.main.async {
                    if success {
                        return check = true
                    } else {
                        return check = false                    }
                }
            }
        } else {
            
        }
    }

