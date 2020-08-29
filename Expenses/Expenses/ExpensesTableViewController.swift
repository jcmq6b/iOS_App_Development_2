//
//  ExpensesTableViewController.swift
//  Expenses
//
//  Created by Jessica Murphey on 8/27/20.
//  Copyright © 2020 Jessica Murphey. All rights reserved.
//

import UIKit
import Foundation


//Struct for cell data
struct Expense {
    var title: String
    var amount: Double
    //for some reason the date formatter just wouldnt work for me, I had to end up using string
    var date: String
}

class ExpensesTableViewController: UITableViewController {
    

    var expenses: [Expense] = [Expense(title: "Dinner", amount: 32.50, date: "June 1, 2018, 18:30"),
                               Expense(title: "Office Supplies", amount: 59.34, date: "May 30, 2018 12:17"),
                               Expense(title: "Uber", amount: 16.23, date: "May 30, 2018 11:43"),
                               Expense(title: "Coffee", amount: 3.97, date: "May 29, 2018 8:45")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 75;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "custom", for: indexPath) as! CustomCell

        cell.title.text = expenses[indexPath.row].title
        cell.amount.text = "$" + String(expenses[indexPath.row].amount)
        cell.date.text = expenses[indexPath.row].date
        
        return cell
    }
    
}
