//
//  Welcome.swift
//  Autoattendance
//
//  Created by Maaz Asim Taimuri on 4/5/20.
//  Copyright © 2020 Maaz Asim Taimuri. All rights reserved.
//

import UIKit

class Welcome: UIViewController {
    @IBOutlet weak var started: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        started.layer.cornerRadius = 20
        started.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
             
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
