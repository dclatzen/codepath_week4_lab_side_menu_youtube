//
//  HamburgerViewController.swift
//  codepath_week4_tuesday_lab
//
//  Created by DL on 10/31/16.
//  Copyright © 2016 myself. All rights reserved.
//

import UIKit

class HamburgerViewController: UIViewController {
    
    @IBOutlet weak var feedView: UIView!
    @IBOutlet weak var menuView: UIView!
    
    var menuViewController: UIViewController!
    var feedViewController: UIViewController!
    
    var feedViewOriginalX: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        menuViewController = storyBoard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        
        feedViewController = storyBoard.instantiateViewController(withIdentifier: "FeedViewController") as! FeedViewController
        
        addChildViewController(menuViewController)
        addChildViewController(feedViewController)

        menuView.addSubview(menuViewController.view)
        feedView.addSubview(feedViewController.view)
        
        menuViewController.didMove(toParentViewController: self)
        feedViewController.didMove(toParentViewController: self)
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPanFeed(sender:)))
        
        feedView.isUserInteractionEnabled = true
        feedView.addGestureRecognizer(panGestureRecognizer)
        
    }

    func didPanFeed(sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: view)
        let velocity = sender.velocity(in: view)
        
        if sender.state == .began {
            feedViewOriginalX = feedView.center.x
            
        } else if sender.state == .changed {
            feedView.center.x = feedViewOriginalX + translation.x
            
            print ("Pan changed.")
            
        } else if sender.state == .ended {
            if velocity.x > 0 {
                
                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: [.curveEaseOut], animations: {
                    
                    self.feedView.center.x = self.feedViewOriginalX + 300
                })
                
            } else {
                
                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: [.curveEaseOut], animations: {
                    
                    self.feedView.center.x = self.feedViewOriginalX - 300
                })
                
            }
            
        }
        
    }
    
    
    
    
    
}
