//
//  Entry+CoreDataProperties.swift
//  Travelouge


import Foundation
import CoreData


extension Entry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entry> {
        return NSFetchRequest<Entry>(entityName: "Entry")
    }

    @NSManaged public var title: String?
    @NSManaged public var rawDate: Date?
    @NSManaged public var entryDescription: String?
    @NSManaged public var rawImage: Data?

}

extension Entry : Identifiable {

}
