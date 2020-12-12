//
//  Trip+CoreDataClass.swift
//  Travelouge
//
//  Created by Jessica Murphey on 12/11/20.
//
//

import UIKit
import CoreData

@objc(Trip)
public class Trip: NSManagedObject {
    convenience init?(title: String){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext, !title.isEmpty else {
            return nil
        }
        self.init(entity: Trip.entity(), insertInto: managedContext)
        self.title = title
    }
}
