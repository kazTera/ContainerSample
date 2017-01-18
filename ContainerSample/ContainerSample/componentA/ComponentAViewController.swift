//
//  ComponentAViewController.swift
//  ContainerSample
//
//  Created by YamamotoKazunori on 2017/01/17.
//  Copyright © 2017年 YamamotoKazunori. All rights reserved.
//

import UIKit

struct ComponentASetting {
    static let cellTitileList: [String] = [
        "セルアイテム1",
        "セルアイテム2",
        "セルアイテム3",
        "セルアイテム4",
        "セルアイテム5",
        "セルアイテム6",
        "セルアイテム7",
        "セルアイテム8",
        "セルアイテム9",
    ]
}

class ComponentAViewController: UIViewController {
    
    @IBOutlet var componentATableView: UITableView!
    var dataSource: TableViewListDataSource?
    
    // TableViewに表示するセクション数
    private let sectionCount = 1
    // TableViewに表示するセル数
    private let cellCount = ComponentASetting.cellTitileList.count
    // セルの高さ
    private let cellHeight = 40
    
    
    /// ライフサイクルメソッドが呼ばれている事を確認
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ComponentA"+#function)
        
        componentATableView.delegate = self
        self.tableDataSet()
    }
    
    // テーブルに表示するデータをセット
    private func tableDataSet() {
        let nib = UINib(nibName: "ItemTableViewCell", bundle: nil)
        self.componentATableView.register(nib, forCellReuseIdentifier: "ComponentCell")
        
        let cellConfigureCloser: TableViewCellConfigureCloser = { (cell,item) in
            if let cell = cell as? ItemTableViewCell, let item = item as? String {
                cell.titleLabel?.text = item
            }
        }
        
        /// UITableViewのdataSourceプロパティは弱参照のため一旦プロパティで保持する
        dataSource = TableViewListDataSource(items: ComponentASetting.cellTitileList,
                                             cellIdentifier: "ComponentCell",
                                             configureCellCloser: cellConfigureCloser)

        componentATableView.dataSource = dataSource
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

extension ComponentAViewController: UITableViewDelegate {
    
    // セルの高さ
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
    }
}
