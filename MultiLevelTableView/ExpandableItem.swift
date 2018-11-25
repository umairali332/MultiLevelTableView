//
//  ExpandableItem.swift
//  MultiLevelTableView
//
//  Created by Umair Ali on 11/24/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

import Foundation

class ExpandableItem: Expandable {
    var title: String
    var isExpanded: Bool
    var level: Int
    var children: [Expandable]?
    
    required init(title: String, isExpanded: Bool = false, level: Int, children: [Expandable]? = nil) {
        self.title = title
        self.isExpanded = isExpanded
        self.level = level
        self.children = children
    }
    
}
