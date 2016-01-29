//
//  ViewController.swift
//  AppThinningDemo
//
//  Created by QiuFeng on 1/29/16.
//  Copyright © 2016 www.qiufeng.me. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var imageView: UIImageView!
    var resourceRequest: NSBundleResourceRequest?
}


// MARK: - Action

extension ViewController {
    @IBAction func downloadBarButtonItemTouchUpInside(sender: UIButton) {
        let tags = NSSet(array: ["Group"])
        self.resourceRequest = NSBundleResourceRequest(tags: tags as! Set<String>)
        self.resourceRequest?.conditionallyBeginAccessingResourcesWithCompletionHandler() {
            resourceAvailable in
            
            if resourceAvailable {
                dispatch_async(dispatch_get_main_queue()) {
                    self.imageView.image = UIImage(named: "Group")
                }
            } else {
                
                self.resourceRequest?.beginAccessingResourcesWithCompletionHandler() {
                    error in
                    if error == nil {
                        dispatch_async(dispatch_get_main_queue()) {
                            self.imageView.image = UIImage(named: "Group")
                        }
                    } else {
                        print(error)
                    }
                }
            }
        }

    }
}


