//
//  categories.swift
//  Autoattendance
//
//  Created by Maaz Asim Taimuri on 3/31/20.
//  Copyright © 2020 Maaz Asim Taimuri. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    @IBOutlet weak var CategoryTitle :UILabel!
    @IBOutlet weak var CategoryImage :UIImageView!
    func updateviews(category:Category)
    {
        CategoryImage.image=UIImage(named: category.imageName)
        CategoryTitle.text=category.title
        
    }
    
    }
