//
//  PhotoDataSource.swift
//  Facesnap
//
//  Created by Muhammad Moaz on 1/1/17.
//  Copyright © 2017 Muhammad Moaz. All rights reserved.
//

import UIKit
import CoreData

class PhotoDataSource {
    private let collectionView: UICollectionView
    private let managedObjectContext = CoreDataController.sharedInstance.managedObjectContext
    private let fetchedResultsController: PhotoFetchedResultsController
    
    init(fetchRequest: NSFetchRequest<NSFetchRequestResult>, collectionView: UICollectionView) {
        self.collectionView = collectionView
        self.fetchedResultsController = PhotoFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedObjectContext, collectionView: collectionView)
    }
}