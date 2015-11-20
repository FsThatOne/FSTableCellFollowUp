//
//  ViewController.swift
//  FSTableCellFollowUp
//
//  Created by FS小一 on 15/7/20.
//  Copyright © 2015年 FSxiaoyi. All rights reserved.
//

import UIKit



class ViewController: UITableViewController {
//
//    let myView = UIView()
    
    var lastCell: Int = 0
    
    var isAppear: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 100
//        view.frame = CGRect(x: 0, y: 667-120, width: 375, height: 120)
//        myView.backgroundColor = UIColor.greenColor()
//        let win = UIApplication.sharedApplication().keyWindow
//        win?.addSubview(myView)
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell")!
//        if cell == nil {
//            cell = UITableViewCell()
//                tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        }
        cell.textLabel!.text = NSString(string: "\(indexPath.row)") as String
        cell.backgroundColor = UIColor.greenColor()
        return cell
    }
    
    override func viewDidAppear(animated: Bool) {
        isAppear = true
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if (indexPath.row > lastCell) && isAppear == true {
            let rotation = CATransform3DMakeTranslation(0, 70, 0)
            cell.layer.shadowColor = UIColor.blackColor().CGColor
            cell.layer.shadowOffset = CGSize(width: 10, height: 10)
            cell.alpha = 0
            cell.layer.transform = rotation
            
            UIView.animateWithDuration(1.5, animations: { () -> Void in
                cell.layer.transform = CATransform3DIdentity
                cell.alpha = 1
                cell.layer.shadowOffset = CGSizeZero
            })
        }
        lastCell = indexPath.row
    }

}

