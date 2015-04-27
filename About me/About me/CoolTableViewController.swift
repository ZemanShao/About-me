//
//  CoolTableViewController.swift
//  About me
//
//  Created by Nathan on 4/27/15.
//  Copyright (c) 2015 TAC. All rights reserved.
//

import UIKit

class CoolTableViewController: UITableViewController {

    @IBOutlet weak var fourthContentView: UIView!
    @IBOutlet weak var secondContentView: UIView!
    var secondRowHeight : CGFloat = 0
    var fourthRowHeight : CGFloat = 0
    
    override func viewDidLoad() {
        self.configureDescribeLabel()
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(indexPath.row == 0 ){
            return  (UIScreen.mainScreen().bounds.height-220)/3
        }
        else if(indexPath.row == 1){
            return self.secondRowHeight+20
        }
        else if(indexPath.row == 2){
            return  (UIScreen.mainScreen().bounds.height-220)/3
        }
        else if(indexPath.row == 3){
            return self.fourthRowHeight+20
        }
        else{
            return 0
        }
    }
    
    func configureDescribeLabel(){
        let firstDescribeLabel = UILabel()
        firstDescribeLabel.frame = CGRectMake(8, 20,(UIScreen.mainScreen().bounds.width-86), 0)
        firstDescribeLabel.text = "ME310 is a design course offered by Stanford University\n\nIn this course, we take on real world design challenges brought forth by corporate partners\n\nAs a result, our team’s challenge is that using the network of things to solve globe water crisis\n\n"
        firstDescribeLabel.numberOfLines = 0
        firstDescribeLabel.font = UIFont(name: "HelveticaNeue-Light", size: 16)
        firstDescribeLabel.textColor = UIColor.blackColor()
        firstDescribeLabel.sizeToFit()
        self.secondRowHeight = firstDescribeLabel.frame.height
        self.secondContentView.addSubview(firstDescribeLabel)
        
        let secondDescribeLabel = UILabel()
        secondDescribeLabel.frame = CGRectMake(8, 20,(UIScreen.mainScreen().bounds.width-86), 0)
        secondDescribeLabel.text = "According to the searching, our project forces on the agricultural water\n\nWe design a robot car to collect all the data we need in the farm\n\nAnd then the data will be uploaded into the server and analysed\n\nThe farmer can use iPhone or iPad to check the data and suggestions given by the system, so than they can use the water more efficiently\n\n"
        secondDescribeLabel.numberOfLines = 0
        secondDescribeLabel.font = UIFont(name: "HelveticaNeue-Light", size: 16)
        secondDescribeLabel.textColor = UIColor.blackColor()
        secondDescribeLabel.sizeToFit()
        self.fourthRowHeight = secondDescribeLabel.frame.height
        self.fourthContentView.addSubview(secondDescribeLabel)
    }
    
}
