//
//  ViewController.swift
//  DropDownTableView
//
//  Created by Iskandar Fazliddinov on 19/01/23.
//

import UIKit

class ViewController: UIViewController {
    
//MARK: - PROPERTIES
    
    var menuData = [
        TableItemsBaseModel(sectionName: "Веселые", data: ["😆", "😃", "😂",], isStatus: false),
        TableItemsBaseModel(sectionName: "Грустные", data: ["😥", "😭", "😔",], isStatus: false),
        TableItemsBaseModel(sectionName: "Влюбленные", data: ["🥰", "❤️", "😻",], isStatus: false),
        TableItemsBaseModel(sectionName: "Болею", data: ["🤧", "🤮", "🤒",], isStatus: false),
        TableItemsBaseModel(sectionName: "123", data: ["123", "123", "123",], isStatus: false)
    ]

//MARK: - UI ELEMENTS
    
    private let tableView: UITableView = {
        var view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.tableFooterView = UIView()
        
        return view
    }()
    
    
//MARK: - METHODS
    
    func setupUIElements() {
        view.addSubview(tableView)
        let tableFrame = CGRect(x: 10, y: 200, width: 390, height: 800)
        tableView.frame = tableFrame
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
//MARK: - LYFE CYCLES
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIElements()
    }
}


//MARK: - TABLE DELEGATE & DATASOURCE

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return menuData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menuData[section].data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = menuData[indexPath.section].data[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if menuData[indexPath.section].isStatus{
            return 44
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
}


//MARK: - EXPANDABLE HEADER DELEGATE

extension ViewController: ExpandableHeaderViewDelegate {
    
    func toggleSection(header: ExpandableHeaderView, section: Int) {
        menuData[section].isStatus = !menuData[section].isStatus
        
        tableView.beginUpdates()
        
        for item in 0 ..< menuData[section].data.count {
            tableView.reloadRows(at: [IndexPath(row: item, section: section)], with: .automatic )
        }
        
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ExpandableHeaderView()
        header.customInit(title: menuData[section].sectionName, section: section, delegate: self)
        
        return header
    }
}


