//
//  Category+CoreDataClass.swift
//  Documents Core Data Relationships
//
import UIKit
import CoreData

@objc(Category)
public class Category: NSManagedObject {
    
    // get an array of documents from the category instance
    var documents: [Document]? {
        return self.rawDocument?.array as? [Document]
    }
    
    convenience init?(title: String){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let context = appDelegate?.persistentContainer.viewContext
            else{
                return nil
        }
        self.init(entity: Category.entity(), insertInto: context)
        self.title = title
    }
}
