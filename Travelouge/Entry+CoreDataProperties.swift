//
//  Entry+CoreDataProperties.swift
//  Travelouge
//
//  Created by Jessica Murphey on 12/11/20.
//
//

import Foundation
import CoreData


extension Entry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entry> {
        return NSFetchRequest<Entry>(entityName: "Entry")
    }

    @NSManaged public var entryDescription: String?
    @NSManaged public var rawDate: NSDate?
    @NSManaged public var rawImage: NSData?
    @NSManaged public var title: String?

}

extension Entry : Identifiable {

}
