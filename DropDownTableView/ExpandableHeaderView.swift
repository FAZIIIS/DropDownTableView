//
//  ExpandableHeaderView.swift
//  DropDownTableView
//
//  Created by Iskandar Fazliddinov on 19/01/23.
//

import Foundation
import UIKit

protocol ExpandableHeaderViewDelegate: AnyObject {
    
    func toggleSection(header: ExpandableHeaderView, section: Int)
}

class ExpandableHeaderView: UITableViewHeaderFooterView {
     
    var section: Int!
    var delegate: ExpandableHeaderViewDelegate?
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        let tapHeader = UITapGestureRecognizer(target: self, action: #selector(headerDidTapped))
        self.addGestureRecognizer(tapHeader)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.textLabel?.textColor = .black
        self.contentView.backgroundColor = .lightText
        self.textLabel?.font = .boldSystemFont(ofSize: 16)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func headerDidTapped(sender: UITapGestureRecognizer) {
        let cell = sender.view as! ExpandableHeaderView
        delegate?.toggleSection(header: self, section: cell.section)
    }
    
    func customInit(title: String, section: Int, delegate: ExpandableHeaderViewDelegate) {
        self.textLabel?.text = title
        self.section = section
        self.delegate = delegate
    }
}
