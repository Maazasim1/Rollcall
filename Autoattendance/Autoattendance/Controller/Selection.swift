//
//  Selection.swift
//  Autoattendance
//
//  Created by Maaz Asim Taimuri on 4/6/20.
//  Copyright © 2020 Maaz Asim Taimuri. All rights reserved.
//

import UIKit

class Selection: UIViewController {

    @IBOutlet weak var Teacher: UIImageView!
    @IBOutlet weak var Student: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Teacher.layer.cornerRadius = 10
        Student.layer.cornerRadius = 10
        
     

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
