//
//  PhotoDataSource.swift
//  Facesnap
//
//  Created by Muhammad Moaz on 1/1/17.
//  Copyright © 2017 Muhammad Moaz. All rights reserved.
//

import UIKit
import CoreData

class PhotoDataSource: NSObject {
    fileprivate let collectionView: UICollectionView
    fileprivate let managedObjectContext = CoreDataController.sharedInstance.managedObjectContext
    fileprivate let fetchedResultsController: PhotoFetchedResultsController
    
    init(fetchRequest: NSFetchRequest<NSFetchRequestResult>, collectionView: UICollectionView) {
        self.collectionView = collectionView
        self.fetchedResultsController = PhotoFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedObjectContext, collectionView: collectionView)
        super.init()
    }
}

// MARK: - UICollectionView - DataSource
extension PhotoDataSource: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return fetchedResultsController.sections?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let section = fetchedResultsController.sections?[section] else { return 0 }
        return section.numberOfObjects
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.resuseIdentifier, for: indexPath) as! PhotoCell
        let photo = fetchedResultsController.object(at: indexPath) as! Photo
        cell.imageView.image = photo.photoImage
        return cell
    }
}
