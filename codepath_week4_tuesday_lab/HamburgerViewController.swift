//
//  HamburgerViewController.swift
//  codepath_week4_tuesday_lab
//
//  Created by StudyBlue on 10/31/16.
//  Copyright © 2016 myself. All rights reserved.
//

import UIKit

class HamburgerViewController: UIViewController {
    
    @IBOutlet weak var feedView: UIView!
    @IBOutlet weak var menuView: UIView!
    
    var feedViewOriginalX: CGFloat!
    
    var mainViewController: UIViewController!
    var feedViewController: UIViewController!
    
    let mainStoryBoard = UIStoryboard(name: "MainViewController", bundle: nil)
    
    let feedStoryBoard = UIStoryboard(name: "FeedViewController", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        mainViewController = mainStoryBoard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        
        feedViewController = feedStoryBoard.instantiateViewController(withIdentifier: "FeedViewController") as! FeedViewController
        
        addChildViewController(mainViewController)
        addChildViewController(feedViewController)

        menuView.addSubview(mainViewController.view)
        feedView.addSubview(feedViewController.view)
        
        mainViewController.didMove(toParentViewController: self)
        feedViewController.didMove(toParentViewController: self)
        
    }

    @IBAction func didPanFeed(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: view)
        let velocity = sender.velocity(in: view)
        
        if sender.state == .began {
            
            feedViewOriginalX = feedView.center.x
            
        } else if sender.state == .changed {
            
            feedView.center.x = feedViewOriginalX + translation.x
            
        } else if sender.state == .ended {

            if velocity.x > 0 {
                
                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: [.curveEaseOut], animations: {
                    
                    self.feedView.center.x = self.feedViewOriginalX + 300
                })
                
            } else {
                
                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: [.curveEaseOut], animations: {
                    
                    self.feedView.center.x = self.feedViewOriginalX
                })
                
            }
            
        }
        
    }
    
    
    
    
    
}
