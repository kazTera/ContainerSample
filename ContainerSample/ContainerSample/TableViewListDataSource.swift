//
//  TableViewListDataSource.swift
//  ContainerSample
//
//  Created by YamamotoKazunori on 2017/01/18.
//  Copyright © 2017年 YamamotoKazunori. All rights reserved.
//

import UIKit

// Cell毎の処理を格納するクロージャ
typealias TableViewCellConfigureCloser = (_ cell: UITableViewCell, _ item: NSObject) -> Void

class TableViewListDataSource: NSObject {
    
    var items = [NSObject]()
    var cellIdentifier = ""
    var configureCellCloser: TableViewCellConfigureCloser?
    
    init(items: [Any], cellIdentifier: String, configureCellCloser: @escaping TableViewCellConfigureCloser) {
        self.items = items as! [NSObject]
        self.cellIdentifier = cellIdentifier
        self.configureCellCloser = configureCellCloser
    }
}

extension TableViewListDataSource: UITableViewDataSource {
    
    // テーブルビューに表示するセルの個数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        // cellIdentifierに該当するセルを生成
        let cell =  tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier,
                                                  for: indexPath)
        
        
        if let configureCellBlock = self.configureCellCloser {
            // TableViewCellConfigureCloser型で定義したセルの振る舞いを呼ぶ
            configureCellBlock(cell, self.itemAtIndexPath(indexPath: indexPath))
        }
        
        return cell
    }
    
    private func itemAtIndexPath(indexPath: IndexPath) -> NSObject {
        return items[indexPath.row]
    }
}
