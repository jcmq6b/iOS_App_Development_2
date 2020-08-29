//
//  ExpensesViewController.swift
//  Expenses
//
//  Created by Jessica Murphey on 8/27/20.
//  Copyright © 2020 Jessica Murphey. All rights reserved.
//

import UIKit

class ExpensesViewController: UIViewController {

    struct expense {
        var title: String
        var amount: Double
        var date: Date
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
}
