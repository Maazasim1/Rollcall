//
//  CategoryCell.swift
//  Autoattendance
//
//  Created by Maaz Asim Taimuri on 3/31/20.
//  Copyright © 2020 Maaz Asim Taimuri. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!
        func updateviews (category: Category)
        {
            categoryImage.image = UIImage(named: category.imageName)
            categoryTitle.text = category.title
            categoryTitle.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            categoryTitle.textAlignment = .center
    }
        override func awakeFromNib() {
              super.awakeFromNib()
            self.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
            
    }


}

