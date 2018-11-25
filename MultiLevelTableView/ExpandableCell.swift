//
//  ExpandableCell.swift
//  MultiLevelTableView
//
//  Created by Umair Ali on 11/24/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

import UIKit

class ExpandableCell: UITableViewCell {
    
    var titleLabel: UILabel!
    
    var data: Expandable! {
        didSet{
            configureCell()
        }
    }
    var leadingConstraint: NSLayoutConstraint!
    let indent: CGFloat = 20
    
    class var cellIdentifier: String {
        return String(describing: self)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonSetup()
    }
    
    private func commonSetup() {
        selectionStyle = .none
        titleLabel = UILabel(frame: CGRect.zero)
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        leadingConstraint = titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        leadingConstraint.isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    private func configureCell() {
        self.titleLabel.text = data.title
        leadingConstraint.constant = (indent * CGFloat(data.level)) + 20
    }
    
    func didTapOnCell() {
        data.isExpanded = !data.isExpanded
    }
}
