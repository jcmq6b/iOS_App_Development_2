//
//  DocumentsViewController.swift
//  Documents Core Data Relationships
//
//  Created by Jessica Murphey on 10/2/20.
//  Copyright © 2020 Jessica Murphey. All rights reserved.
//

import UIKit

class DocumentsViewController: UIViewController {

    @IBOutlet weak var documentTableView: UITableView!
    let dateFormatter = DateFormatter()
    //holds category that will be passed forward
    //Holds an array of documents
    var category: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.timeStyle = .long
        dateFormatter.dateStyle = .long
        documentTableView.delegate = self
        documentTableView.dataSource = self
    }
    //Updates the data incase a new expense has been created
    override func viewWillAppear(_ animated: Bool) {
        self.documentTableView.reloadData()
    }
    
    @IBAction func addNewDocument(_ sender: Any) {
        performSegue(withIdentifier: "newDocument", sender: self)
    }
    
    //Segue to New Document View
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //gives access to destination
        guard let destination = segue.destination as? NewDocumentViewController else{
            return
        }
        destination.category = category
    }
    
    func deleteExpense(at indexPath: IndexPath){
        guard let expense = category?.documents?[indexPath.row],
            let managedContext = expense.managedObjectContext else{
                return
        }
        managedContext.delete(expense)
        
        do{
            try managedContext.save()
            
            documentTableView.deleteRows(at: [indexPath], with: .automatic)
        }catch{
            print("Could not delete document")
            
            documentTableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
}



extension DocumentsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category?.documents?.count ?? 0 //Returns 0 if it cannot find category or expenses
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = documentTableView.dequeueReusableCell(withIdentifier: "documentCell", for: indexPath)
        
        if let cell = cell as? DocumentTableViewCell {
            if let document = category?.documents?[indexPath.row]{
                cell.nameLabel.text = document.name
                cell.sizeLabel.text = String(document.size) + " bytes"
                
                if let modifiedDate = document.rawDateModified {
                    cell.modifiedLabel.text = dateFormatter.string(from: modifiedDate)
                } else {
                    cell.modifiedLabel.text = "unknown"
                }
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            deleteExpense(at: indexPath)
        }
    }
}

extension DocumentsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDocument", sender: self)
    }
}
