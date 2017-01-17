//
//  ViewController.swift
//  ContainerSample
//
//  Created by YamamotoKazunori on 2017/01/17.
//  Copyright © 2017年 YamamotoKazunori. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    /// コンテナ
    @IBOutlet var containerView: UIView!
    /// 現在表示しているViewControllerを保持する
    weak var currentViewController : UIViewController?
    
    override func viewDidLoad() {
        self.currentViewController = self.storyboard?.instantiateViewController(withIdentifier: "componentA")
        self.currentViewController!.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChildViewController(self.currentViewController!)
        self.addSubView(subView: self.currentViewController!.view, toView: self.containerView)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addSubView(subView:UIView, toView parentView:UIView) {
        parentView.addSubview(subView)
        
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["subView"] = subView
        /// 水平位置の制約
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[subView]|",
                                                                 options: [],
                                                                 metrics: nil,
                                                                 views: viewBindingsDict))
        /// 垂直位置の制約
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[subView]|",
                                                                 options: [],
                                                                 metrics: nil,
                                                                 views: viewBindingsDict))
    }
    
    @IBAction func showComponent(_ sender: UISegmentedControl) {
        var storyboardId = ""
        if sender.selectedSegmentIndex == 0 {
            storyboardId = "componentA"
        } else {
            storyboardId = "componentB"
        }
        let newViewController = self.storyboard?.instantiateViewController(withIdentifier: storyboardId)
        newViewController!.view.translatesAutoresizingMaskIntoConstraints = false
        self.cycleFromViewController(oldViewController: self.currentViewController!, toViewController: newViewController!)
        self.currentViewController = newViewController
        
    }
    
    func cycleFromViewController(oldViewController: UIViewController, toViewController newViewController: UIViewController) {
        oldViewController.willMove(toParentViewController: nil)
        self.addChildViewController(newViewController)
        self.addSubView(subView: newViewController.view, toView: self.containerView)
        newViewController.view.alpha = 0
        newViewController.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.5,animations:{
            newViewController.view.alpha = 1
            oldViewController.view.alpha = 0
        },
        completion: { finished in
            // 完了処理
            oldViewController.view.removeFromSuperview()
            oldViewController.removeFromParentViewController()
            newViewController.didMove(toParentViewController: self)
        })
    }
}

