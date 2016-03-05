//
//  TableViewController.swift
//  AppThinningDemo
//
//  Created by QiuFeng on 3/5/16.
//  Copyright © 2016 www.qiufeng.me. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension TableViewController {
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            let destainationViewController = storyboard?.instantiateViewControllerWithIdentifier("DetailViewController") as! DetailViewController
            destainationViewController.imageName = cell.textLabel?.text
            destainationViewController.imageTag = "Group" + "\(indexPath.row)"
            navigationController?.pushViewController(destainationViewController, animated: true)
        }
    }
}
