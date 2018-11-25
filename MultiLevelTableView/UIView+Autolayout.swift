//
//  UIView+Autolayout.swift
//  MultiLevelTableView
//
//  Created by Umair Ali on 11/24/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

import UIKit

extension UIView {
    
    func fillWithinParent(_ topOffset: CGFloat = 0, _ leadingOffset: CGFloat = 0, _ bottomOffset: CGFloat = 0, _ trailingOffset: CGFloat = 0) {
        guard let parent = superview else {
            return
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: parent.topAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: parent.leadingAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: parent.bottomAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: parent.trailingAnchor).isActive = true
    }
}
