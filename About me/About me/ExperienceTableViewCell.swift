//
//  ExperienceTableViewCell.swift
//  About me
//
//  Created by Nathan on 1/28/16.
//  Copyright © 2016 TAC. All rights reserved.
//

import UIKit

class ExperienceTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func toRight(){
        self.titleLabel.textAlignment = .Right
        self.subtitleLabel.textAlignment = .Right
        self.descriptionLabel.textAlignment = .Right
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
