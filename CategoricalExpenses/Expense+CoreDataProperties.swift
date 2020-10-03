//
//  Expense+CoreDataProperties.swift
//  CategoricalExpenses
//
//  Created by Jessica Murphey on 10/2/20.
//  Copyright © 2020 Shawn Moore. All rights reserved.
//
//

import Foundation
import CoreData


extension Expense {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Expense> {
        return NSFetchRequest<Expense>(entityName: "Expense")
    }

    @NSManaged public var name: String?
    @NSManaged public var amount: Double
    @NSManaged public var rawDate: Date?
    @NSManaged public var category: Category?

}
