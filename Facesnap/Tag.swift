//
//  Tag.swift
//  Facesnap
//
//  Created by Muhammad Moaz on 1/1/17.
//  Copyright © 2017 Muhammad Moaz. All rights reserved.
//

import Foundation
import CoreData

class Tag: NSManagedObject {
    static let entityName = String(describing: Tag.self)
    
    class func tag(withTitle title: String) -> Tag {
        let tag = NSEntityDescription.insertNewObject(forEntityName: Tag.entityName, into: CoreDataController.sharedInstance.managedObjectContext) as! Tag
        tag.title = title
        return tag
    }
}

extension Tag {
    @NSManaged var title: String
}
