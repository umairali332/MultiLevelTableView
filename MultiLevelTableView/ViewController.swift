//
//  ViewController.swift
//  MultiLevelTableView
//
//  Created by Umair Ali on 11/24/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView: UITableView!
    
    var data: Expandable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        initializeData()
        
    }
    
    private func setupView() {
        
        tableView = UITableView(frame: view.frame, style: .plain)
        self.view.addSubview(tableView)
        tableView.fillWithinParent()
        tableView.register(ExpandableCell.self, forCellReuseIdentifier: ExpandableCell.cellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func initializeData() {
        
        let subItem11 = ExpandableItem(title: "Sub Item 11", level: 2)
        let subItem22 = ExpandableItem(title: "Sub Item 22", level: 2)
        
        let subItem1 = ExpandableItem(title: "Sub Item 1", level: 1, children: [subItem11])
        let subItem2 = ExpandableItem(title: "Sub Item 2", level: 1, children: [subItem22])
        let children = [subItem1, subItem2]
        data = ExpandableItem(title: "Parent Item", isExpanded: false, level: 0, children: children)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowCount = data.calculateItems()
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var index = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: ExpandableCell.cellIdentifier, for: indexPath) as! ExpandableCell
        if let cellItem = data.findItem(at: &index) {
            cell.data = cellItem
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard  let cell = tableView.cellForRow(at: indexPath) as? ExpandableCell else {
            return
        }
        cell.didTapOnCell()
        tableView.reloadData()
    }

}

