//
//  Document+CoreDataProperties.swift
//  Documents Core Data Relationships
//
//  Created by Jessica Murphey on 10/2/20.
//  Copyright © 2020 Jessica Murphey. All rights reserved.
//
//

import Foundation
import CoreData


extension Document {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Document> {
        return NSFetchRequest<Document>(entityName: "Document")
    }

    @NSManaged public var content: String?
    @NSManaged public var rawDateModified: Date?
    @NSManaged public var name: String?
    @NSManaged public var size: Int64
    @NSManaged public var category: Category?

}
