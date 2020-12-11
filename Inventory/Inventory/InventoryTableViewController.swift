//
//  InventoryTableViewController.swift
//  Inventory
//
//  Created by Jessica Murphey 
//

import UIKit

class InventoryTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let jsonFileName = "inventory"
    var inventoryStruct: Inventory?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.rowHeight = 80
        
        //load json file
        if let inventory = InventoryClass.load(jsonFileName: jsonFileName){
            //adding to struct
            inventoryStruct = inventory
//            print(inventory)
        }else{
            print("Error loading json")
        }
        
    }
    
    
    //Tableview code
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inventoryStruct?.products.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "inventoryCell", for: indexPath) as! InventoryViewCell
        
        cell.title.text = inventoryStruct?.products[indexPath.row].title
        cell.price.text = String(inventoryStruct?.products[indexPath.row].price ?? 0)
        cell.quantity.text = String(inventoryStruct?.products[indexPath.row].stockedQuantity ?? 0)
        
        return cell
    }
    
}
