//
//  TableItemsModel.swift
//  DropDownTableView
//
//  Created by Iskandar Fazliddinov on 19/01/23.
//

import Foundation


struct TableItemsBaseModel {
    let sectionName: String
    let data: [String]
    var isStatus: Bool
    
    init(sectionName: String, data: [String], isStatus: Bool) {
        self.sectionName = sectionName
        self.data = data
        self.isStatus = isStatus
    }
    
}
