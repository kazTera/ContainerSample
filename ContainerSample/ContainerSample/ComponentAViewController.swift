//
//  ComponentAViewController.swift
//  ContainerSample
//
//  Created by YamamotoKazunori on 2017/01/17.
//  Copyright © 2017年 YamamotoKazunori. All rights reserved.
//

import UIKit

class ComponentAViewController: UIViewController {
    
    /// ライフサイクルメソッドが呼ばれている事を確認
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ComponentA"+#function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         print("ComponentA"+#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         print("ComponentA"+#function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
         print("ComponentA"+#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
         print("ComponentA"+#function)
    }
}
