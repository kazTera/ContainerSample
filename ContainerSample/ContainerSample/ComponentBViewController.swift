//
//  ComponentBViewController.swift
//  ContainerSample
//
//  Created by YamamotoKazunori on 2017/01/17.
//  Copyright © 2017年 YamamotoKazunori. All rights reserved.
//

import UIKit

class ComponentBViewController: UIViewController {
    
    /// ライフサイクルメソッドが呼ばれている事を確認
    override func viewDidLoad() {
        super.viewDidLoad()
         print("ComponentB:"+#function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ComponentB:"+#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         print("ComponentB:"+#function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
         print("ComponentB:"+#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
         print("ComponentB:"+#function)
    }

}
