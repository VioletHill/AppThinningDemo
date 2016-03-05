//
//  DetailViewController.swift
//  AppThinningDemo
//
//  Created by QiuFeng on 3/5/16.
//  Copyright © 2016 www.qiufeng.me. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var imageTag: String? = nil;
    var imageName: String? = nil;
    @IBOutlet weak var imageView: UIImageView!
    
    var request: NSBundleResourceRequest?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imageName  = imageName {
            self.imageView.image = UIImage(named: imageName)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - Action

extension DetailViewController {
    
    @IBAction func downloadButtonTouchUpInside(sender: UIButton) {
        if let imageTag = imageTag {
            request = NSBundleResourceRequest(tags: [imageTag])
            request?.beginAccessingResourcesWithCompletionHandler({ (error) -> Void in
                guard error == nil else {
                    print(error)
                    return
                }
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    if let imageName = self.imageName {
                        self.imageView.image = UIImage(named: imageName)
                    }
                })
            })
        }
        
        
    }
}