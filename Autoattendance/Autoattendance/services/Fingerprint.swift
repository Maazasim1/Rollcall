//
//  Fingerprint.swift
//  Autoattendance
//
//  Created by Maaz Asim Taimuri on 5/31/20.
//  Copyright © 2020 Maaz Asim Taimuri. All rights reserved.
//

import Foundation
import LocalAuthentication
class Fingerprint {
static let shared = Fingerprint()
       var check=0
    func authenticationWithTouchID()->Int {
        let localAuthenticationContext = LAContext()
        localAuthenticationContext.localizedFallbackTitle = "Use Passcode"
     

        var authError: NSError?
        let reasonString = "To access the secure data"

        if localAuthenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
            
            localAuthenticationContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reasonString) { success, evaluateError in
                
                if success {
                    self.check = 1
                    print("fingerprint lelia gaya hai aur true kia gaya hai")
                    print("1")
                    
                    
                    
                } else {
                    //TODO: User did not authenticate successfully, look at error and take appropriate action
                    self.check = 2
                    print("2")
                    
                                       
                }
            }
        }
        print(check)
    return check
    
 
}
}
