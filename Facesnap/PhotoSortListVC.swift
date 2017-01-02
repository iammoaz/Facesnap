//
//  PhotoSortListVC.swift
//  Facesnap
//
//  Created by Muhammad Moaz on 1/2/17.
//  Copyright © 2017 Muhammad Moaz. All rights reserved.
//

import UIKit
import CoreData

class PhotoSortListVC<SortType: CustomTitleConvertible>: UITableViewController where SortType: NSManagedObject {
    
    let dataSource: SortableDataSource<SortType>
    let sortItemSelector: SortItemSelector<SortType>
    
    var onSortSelection: ((Set<SortType>) -> Void)?
    
    init(dataSource: SortableDataSource<SortType>, sortItemSelector: SortItemSelector<SortType>) {
        self.dataSource = dataSource
        self.sortItemSelector = sortItemSelector
        super.init(style: .grouped)
        tableView.dataSource = dataSource
        tableView.delegate = sortItemSelector
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
    }
    
    fileprivate func setupNavigation() {
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.dismissPhotoSortListVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc private func dismissPhotoSortListVC() {
        guard let onSortSelection = onSortSelection else { return }
        onSortSelection(sortItemSelector.checkedItems)
        dismiss(animated: true, completion: nil)
    }
}
