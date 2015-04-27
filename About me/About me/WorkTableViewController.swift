//
//  WorkTableViewController.swift
//  About me
//
//  Created by Nathan on 4/27/15.
//  Copyright (c) 2015 TAC. All rights reserved.
//

import UIKit
import MediaPlayer

class WorkTableViewController: UITableViewController {
    
    @IBOutlet weak var videoContentView: UIView!
    
    @IBOutlet weak var introContentView: UIView!
    
    
    var introRowHeight : CGFloat = 0
    var moviePlayer : MPMoviePlayerViewController?
    
    override func viewDidLoad() {
        self.configurePlayer()
        self.configureIntro()
    }
    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(indexPath.row == 0){
            return 160
        }
        else if(indexPath.row == 1){
            return self.introRowHeight+30
        }
        else{
            return 0
        }
    }
    
    //MARK: - UI Configure
    
    func configurePlayer(){
        moviePlayer = MPMoviePlayerViewController(contentURL: NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("Work_Video", ofType:"m4v")!) )
        moviePlayer?.moviePlayer.controlStyle = MPMovieControlStyle.None
        moviePlayer?.moviePlayer.repeatMode = .One
        moviePlayer?.view.frame = CGRectMake(0, 0, 20, 11)
        self.videoContentView.addSubview(moviePlayer!.view)
        
    }
    
    func configureIntro(){
        let describeLabel = UILabel()
        describeLabel.frame = CGRectMake(8, 20,(UIScreen.mainScreen().bounds.width-86), 0)
        describeLabel.text = "In this work, I use iPad to simulate a smart car window.\n\nI care the users feeling pity of losing momentary scenery and not being able to share it with others. \n\nSo I cherish the chance of meeting this demand with car window, the most natural and extremely easy tool for approaching scenery passed by.\n\nFinally, this work gain the best design award in the design workshop."
        describeLabel.numberOfLines = 0
        describeLabel.font = UIFont(name: "HelveticaNeue-Light", size: 16)
        describeLabel.textColor = UIColor.blackColor()
        describeLabel.sizeToFit()
        self.introRowHeight = describeLabel.frame.height
        self.introContentView.addSubview(describeLabel)

    }
    

}
