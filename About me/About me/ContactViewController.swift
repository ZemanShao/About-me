//
//  ContactViewController.swift
//  About me
//
//  Created by Nathan on 12/22/14.
//  Copyright (c) 2014 TAC. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {
    
    override func viewDidLoad() {

    }
    @IBAction func mobileButtonPressed(sender: UIButton) {
        var urlString = "tel://8618964522085"
        UIApplication.sharedApplication().openURL(NSURL(string: urlString)!)
    }
    
    @IBAction func emailButtonPressed(sender: UIButton) {
        var urlString = "mailto://" + (sender.titleLabel?.text)!
        UIApplication.sharedApplication().openURL(NSURL(string: urlString)!)
    }
    
    @IBAction func websiteButtonPressed(sender: UIButton) {
        var urlString = sender.titleLabel?.text
        UIApplication.sharedApplication().openURL(NSURL(string: urlString!)!)
    }
    
    @IBAction func githubButtonPressed(sender: UIButton) {
        var urlString = sender.titleLabel?.text
        UIApplication.sharedApplication().openURL(NSURL(string: urlString!)!)
    }
    
    @IBAction func locationButtonPressed(sender: AnyObject) {
        var urlString = "http://maps.apple.com/?ll=31.2855741398,121.2147781261"
        UIApplication.sharedApplication().openURL(NSURL(string: urlString)!)
    }

}
