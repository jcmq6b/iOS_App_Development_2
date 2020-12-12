//
//  EntriesViewController.swift
//  Travelouge

import UIKit
import CoreData

class EntriesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var entriesTableView: UITableView!
    
    var dateFormatter = DateFormatter()
    var entries = [Entry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.entriesTableView.rowHeight = 175
        
        entriesTableView.delegate = self
        entriesTableView.dataSource = self
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchEntries()
        entriesTableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath) as! EntryViewCell
        //grabs correct entry
        let entry = entries[indexPath.row]
        
        //setting entry cell details
        cell.title.text = entry.title
        if let date = entry.date{
            cell.entryDate.text = dateFormatter.string(from: date)
        }
        cell.entryDescription.text = entry.entryDescription
        cell.entryImage.image = entry.image
        
        return cell
    }
    
    //delete action
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?{
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete"){ (rowAction, indexPath) in
            self.deleteEntry(indexPath: indexPath)
        }
        return [deleteAction]
    }
    
    //Load data from core data
    func fetchEntries(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            entries = [Entry]()
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Entry> = Entry.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "rawDate", ascending: true)]
        
        do{
            entries = try managedContext.fetch(fetchRequest)
        }catch{
            presentAlert(message: "Error: Couldn't load Entries")
        }
    }
    
    //delete specific entry
    func deleteEntry(indexPath: IndexPath){
        let entry = entries[indexPath.row]
        
        if let managedObjectContext = entry.managedObjectContext{
            managedObjectContext.delete(entry)
            
            do{
                try managedObjectContext.save()
                self.entries.remove(at: indexPath.row)
                entriesTableView.reloadData()
            }catch{
                presentAlert(message: "Error: Delete failed!")
                entriesTableView.reloadData()
            }
        }
    }
    
    //presents an alert to the user
    func presentAlert(message: String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    //Segue to add a new entry or edit an entry
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? NewEntryViewController else{
            return
        }
        
        //checks if it is to edit
        if let segueIdentifier = segue.identifier, segueIdentifier == "viewEntry", let indexPathForSelectedRow = entriesTableView.indexPathForSelectedRow{
            destination.entry = entries[indexPathForSelectedRow.row]
        }
    }

}
