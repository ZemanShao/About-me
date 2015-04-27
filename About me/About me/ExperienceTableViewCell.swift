//
//  ExperienceTableViewCell.swift
//  About me
//
//  Created by Nathan on 4/25/15.
//  Copyright (c) 2015 TAC. All rights reserved.
//

import UIKit

class ExperienceTableViewCell: UITableViewCell {

    @IBOutlet weak var borderView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configureBorderView()
        
    }

    // MARK: - UI Configure
    
    
    func configureBorderView(){
        self.borderView.layer.borderColor = UIColor.grayColor().CGColor
        self.borderView.layer.borderWidth = 0.3
    }
    
}
    