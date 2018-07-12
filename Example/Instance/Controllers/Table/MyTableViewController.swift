//
//  MyTableViewController.swift
//  Instance
//
//  Created by SeRG1k17 on 07/12/2018.
//  Copyright (c) 2018 SeRG1k17. All rights reserved.
//

import UIKit

class MyTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        CodeTableViewCell.registerClass(for: tableView)
        
        XibTableViewCell.registerNib(for: tableView)
        MyTableViewHeaderFooterView.registerNib(for: tableView)
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell!
        
        if indexPath.row == 0 {
            cell = CodeTableViewCell.dequeue(from: tableView, for: indexPath)
            
        } else if indexPath.row % 2 == 0 {
            cell = XibTableViewCell.dequeue(from: tableView, for: indexPath)
            
        } else {
            cell = MyTableViewCell.dequeue(from: tableView, for: indexPath)
        }

        if let viewInstance = cell as? ViewInstanceType {
            
            let text = "Row: \(indexPath.row), Section: \(indexPath.section)"
            viewInstance.positionLabel?.text = text
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = MyTableViewHeaderFooterView.dequeue(from: tableView)
        header.positionLabel?.text = "Section: \(section)"
        
        return header
    }
}
