//
//  Photo.swift
//  Facesnap
//
//  Created by Muhammad Moaz on 1/1/17.
//  Copyright © 2017 Muhammad Moaz. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation

class Photo: NSManagedObject {
    static let entityName = String(describing: Photo.self)
    
    class func photo(withImage image:UIImage) -> Photo {
        let photo = NSEntityDescription.insertNewObject(forEntityName: Photo.entityName, into: CoreDataController.sharedInstance.managedObjectContext) as! Photo
        photo.date = NSDate().timeIntervalSince1970
        photo.image = UIImageJPEGRepresentation(image, 1.0)! as NSData
        return photo
    }
    
    class func photoWith(image: UIImage, tags: [String], location: CLLocation?) {
        let photo = Photo.photo(withImage: image)
        photo.addTags(tags: tags)
        photo.addLocation(location: location)
    }
    
    func addTag(withTitle title: String) {
        let tag = Tag.tag(withTitle: title)
        tags.insert(tag)
    }
    
    func addTags(tags: [String]) {
        for tag in tags {
            addTag(withTitle: tag)
        }
    }
    
    func addLocation(location: CLLocation?) {
        if let location = location {
            let photoLocation = Location.locationWith(location.coordinate.latitude, longitude: location.coordinate.longitude)
            self.location = photoLocation
        }
    }
}

extension Photo {
    @NSManaged var date: TimeInterval
    @NSManaged var image: NSData
    @NSManaged var tags: Set<Tag>
    @NSManaged var location: Location?
}
