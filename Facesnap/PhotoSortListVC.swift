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
//    let sortItemSelector: SortItemSelector<SortType>
    
    init(dataSource: SortableDataSource<SortType>) {
        self.dataSource = dataSource
        super.init(style: .grouped)
        tableView.dataSource = dataSource
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
        dismiss(animated: true, completion: nil)
    }
}
