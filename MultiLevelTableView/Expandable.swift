//
//  Expandable.swift
//  MultiLevelTableView
//
//  Created by Umair Ali on 11/24/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

import Foundation

protocol Expandable {
    
    var title: String {get set}
    var isExpanded: Bool {get set}
    var isExpandable: Bool {get}
    var level: Int {get set}
    var children: [Expandable]? {get set}
    
}

extension Expandable {
    
    var isExpandable: Bool {
        return (children?.count ?? 0) > 0
    }
    
    func calculateItems() -> Int {
        if isExpanded {
            return 1 + ((children?.reduce(0, {
                $0 + $1.calculateItems()
            })) ?? 0)
        }
        
        return 1
    }
    
    func findItem(at index: inout Int) -> Expandable? {
        if index == 0 {
            return self
        }
        index -= 1
        if !isExpandable || !isExpanded {
            return nil
        }
        guard let children = self.children else {
            return nil
        }
        for child in children {
            if let requiredItem = child.findItem(at: &index) {
                return requiredItem
            }
        }
        
        return nil
        
    }
    
}
