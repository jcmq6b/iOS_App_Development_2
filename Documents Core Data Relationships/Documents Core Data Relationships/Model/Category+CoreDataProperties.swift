//
//  Category+CoreDataProperties.swift
//  Documents Core Data Relationships
//
//  Created by Jessica Murphey on 10/2/20.
//  Copyright © 2020 Jessica Murphey. All rights reserved.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var title: String?
    @NSManaged public var rawDocument: Document?

}
