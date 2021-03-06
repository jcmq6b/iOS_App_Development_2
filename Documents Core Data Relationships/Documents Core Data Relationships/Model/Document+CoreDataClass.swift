//
//  Document+CoreDataClass.swift
//  Documents Core Data Relationships
//
//  Created by Jessica Murphey on 10/2/20.
//  Copyright © 2020 Jessica Murphey. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Document)
public class Document: NSManagedObject {
    //Creating computed property for date
    var date: Date?{
        get{
            return rawDateModified as Date?
        }
        set{
            rawDateModified = newValue as NSDate? as Date?
        }
    }
    convenience init?(name: String?, content: String?, date: Date?, size: Int64) {
        //Get appDelegate, then from the app deleget get the persistant container
        //Which contains the managed object context
        //If it cannot get managed object context it will fail out of initializer
        //Then it will move on w/ the code
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let context = appDelegate?.persistentContainer.viewContext
            else {
                return nil
        }
    }
}
