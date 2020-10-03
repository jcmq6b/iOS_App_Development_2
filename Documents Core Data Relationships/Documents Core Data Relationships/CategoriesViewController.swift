//
//  CategoriesViewController.swift
//  Documents Core Data Relationships

import UIKit
import CoreData

class CategoriesViewController: UIViewController {
    
    @IBOutlet weak var categoryTableView: UITableView!
    
    //holds categories
    var categories: [Category] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTableView.delegate = self
        categoryTableView.dataSource = self

    }

    //viewWillAppear is for all the operations you want to happen before the view loads
    //Fetches all the categories from the persistent storeage and display to user
    override func viewWillAppear(_ animated: Bool) {
        
        //Get UIAppdelegate, then managed context, then fetch from there
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //fetch request from coredata
        //Category is specified as generic for NSFetchRequest so it will return our cateogry
        let fetchRequest: NSFetchRequest<Category> = Category.fetchRequest()
        //performing fetch request
        //Must use do b/c fetching core data can throw an exception
        do{
            categories = try managedContext.fetch(fetchRequest)
            //Have to reload the data on the tableView
            print("Loading the category data...")
            let listSize = categories.count
            print(listSize)
            categoryTableView.reloadData()
        }catch{
            print("Could not complete fetch request")
        }
    }

      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Only executes if both destination and selectedRow exist
        guard let destination = segue.destination as? DocumentsViewController, let selectedRow = self.categoryTableView.indexPathForSelectedRow?.row else{
            //If it is a documents' view controller it is now unwrapped and we have access to the selected row
                return
            }
        destination.category = categories[selectedRow]
    }

    //Function to delete category
    func deleteCategory(at indexPath: IndexPath){
        let category = categories[indexPath.row]
        guard let managedContext = category.managedObjectContext else{
            return
        }
        managedContext.delete(category)
        
        //saves the delete change
        do{
            try managedContext.save()
            //Remove the cateogry from the array
            categories.remove(at: indexPath.row)
            //Remove the category from the tableview
            categoryTableView.deleteRows(at: [indexPath], with: .automatic)
            
        }catch{
            print("Could not delete category")
            //removes the ability to delete by removing the row
            categoryTableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
}


extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoryTableView.dequeueReusableCell(withIdentifier: "categoriesCell", for: indexPath)
        //get category that this cell is supposed to show
        let category = categories[indexPath.row]
        
        //Setting the title
        print(category.title ?? "default used")
        cell.textLabel?.text = category.title
        
        return cell
    }
    
    //This will also delte the expenses related to the category because the delet option is set to cascade in the model data
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteCategory(at: indexPath)
        }
    }
}
