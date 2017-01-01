//
//  PhotoSortListVC.swift
//  Facesnap
//
//  Created by Muhammad Moaz on 1/2/17.
//  Copyright © 2017 Muhammad Moaz. All rights reserved.
//

import UIKit

class PhotoSortListVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
    }
}

extension PhotoSortListVC {
    fileprivate func setupNavigation() {
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.dismissPhotoSortListVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc private func dismissPhotoSortListVC() {
        dismiss(animated: true, completion: nil)
    }
}
