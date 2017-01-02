//
//  SortItemSelector.swift
//  Facesnap
//
//  Created by Muhammad Moaz on 1/2/17.
//  Copyright © 2017 Muhammad Moaz. All rights reserved.
//

import UIKit
import CoreData

class SortItemSelector<SortType: NSManagedObject>: NSObject, UITableViewDelegate {
    
    private let sortItems: [SortType]
    var checkedItems: Set<SortType> = []
    
    init(sortItems: [SortType]) {
        self.sortItems = sortItems
        super.init()
    }
    
    // MARK: - UITableView - Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.cellForRow(at: indexPath) else { return }
            
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
                
                let nextSection = indexPath.section.advanced(by: 1)
                let numberOfRowsInSubsequentSection = tableView.numberOfRows(inSection: nextSection)
                
                for row in 0..<numberOfRowsInSubsequentSection {
                    let indexPath = IndexPath(row: row, section: nextSection)
                    let cell = tableView.cellForRow(at: indexPath)
                    cell?.accessoryType = .none
                    checkedItems = []
                }
            }
            
        case 1:
            let allItemsIndexPath = IndexPath(row: 0, section: 0)
            let allItemsCell = tableView.cellForRow(at: allItemsIndexPath)
            allItemsCell?.accessoryType = .none
            
            guard let cell = tableView.cellForRow(at: indexPath) else { return }
            let item = sortItems[indexPath.row]
            
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
                checkedItems.insert(item)
            } else if cell.accessoryType == .checkmark {
                cell.accessoryType = .none
                checkedItems.remove(item)
            }
            
        default:
            break
        }
    }
}
