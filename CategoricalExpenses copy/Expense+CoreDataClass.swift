//
//  Expense+CoreDataClass.swift
//  CategoricalExpenses
//
//  Created by Jessica Murphey on 10/2/20.
//  Copyright © 2020 Shawn Moore. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Expense)
public class Expense: NSManagedObject {
//Creating computed property for date
    var date: Date?{
        get{
            return rawDate as Date?
        }
        set{
            rawDate = newValue as NSDate? as Date?
        }
    }
    convenience init?(name: String?, amount: Double, date: Date?){
        //Get appDelegate, then from the app deleget get the persistant container
        //Which contains the managed object context
        //If it cannot get managed object context it will fail out of initializer
        //Then it will move on w/ the code
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let context = appDelegate?.persistentContainer.viewContext
            else {
                return nil
        }
        //If the context is gotten
        self.init(entity: Expense.entity(), insertInto: context)
        self.name = name
        self.amount = amount
        self.date = date
    }
}
