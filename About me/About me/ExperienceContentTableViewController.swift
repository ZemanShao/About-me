//
//  ExperienceContentTableViewController.swift
//  About me
//
//  Created by Nathan on 1/28/16.
//  Copyright © 2016 TAC. All rights reserved.
//

import UIKit
import Alamofire

class ExperienceContentTableViewController: UITableViewController,UIViewControllerTransitioningDelegate {
    
    let apiUrl = "http://104.131.134.56/me/getallexps.php"
    var expArray = Array<AMExperience>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        Alamofire.request(.GET, apiUrl)
            .responseJSON { response in
                switch response.result{
                case .Success(let JSON):
                    let responseDic = JSON as! Dictionary<String,Array<Dictionary<String,String>>>
                    self.expArray.removeAll()
                    for expDic in responseDic["exps"]!{
                        let exp = AMExperience(dic: expDic)
                        self.expArray.append(exp)
                    }
                    self.tableView.reloadData()

                    
                    
                    
                case .Failure(let error):
                        print(error)
                    
                    
                }
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if !expArray.isEmpty {
            return expArray.count
        }
        else {
            return 0
        }
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "ExperienceTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ExperienceTableViewCell
        if indexPath.row % 2 != 0 {
            cell.toRight()
        }
        if !expArray.isEmpty {
            let exp = expArray[indexPath.row]
            cell.titleLabel.text = exp.title
            cell.subtitleLabel.text = exp.subtitle
            cell.descriptionLabel.text = exp.descript
        }
        
        

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        var vc: ExperienceDetailViewController
        if indexPath.row == 0 {
            vc = SkillViewController()
            
        }
        else if indexPath.row == 1{
            vc = self.storyboard?.instantiateViewControllerWithIdentifier("ClubViewController") as! ClubViewController
        }
        else{
            vc = ExperienceDetailViewController()
            vc.contentStr = expArray[indexPath.row].content

            
        }

        vc.transitioningDelegate = self
        vc.modalPresentationStyle = UIModalPresentationStyle.Custom
        self.presentViewController(vc, animated: true, completion: nil)
        
    }
    
    // MARK: - Transitioning Delegate
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ExperiencePresentingAnimator()
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ExperienceDismissingAnimator()
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
