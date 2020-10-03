//
//  Category+CoreDataClass.swift
//  CategoricalExpenses
//
//  Created by Jessica Murphey on 10/2/20.
//  Copyright © 2020 Shawn Moore. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Category)
public class Category: NSManagedObject {
    //Lets you get an array of expenses from the category's instance we can simply
    //access the expenses property and get the array
    var expenses: [Expense]? {
        return self.rawExpenses?.array as? [Expense]
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
