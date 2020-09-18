//This project is all set up for the implementation of the File manager system, I couldn't get it to work
//In order to view what I did create I left out my attempts of the read/write functions
//I placed comments where I would add the functions if they were working

import UIKit

class DocumentsTableTableViewController: UITableViewController {
    
    var documents = [Document](){
        //Need to manually reload since Table Views dont know when to update
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documents.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "document_cell", for: indexPath) as! DocumentsTableViewCell
        let currentDocument = documents[indexPath.row]
        
        cell.documentTitle.text = currentDocument.title
        cell.documentSize.text = currentDocument.size
        cell.documentDate.text = currentDocument.date.convertToString()

        return cell
    }
    
    //For deleting documents
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            documents.remove(at: indexPath.row)
            
            //Delete file from directory
            
        }
        
    }
    
    
    //Segue Section
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {return}
        
        //Checking which segue was clicked, prints message to console, and passes data
        switch identifier {
        case "displayEditor":
            print("Segue: Document Cell Tapped")
            
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            
            let document = documents[indexPath.row]
            //Need to typecast to controller to access its properties
            let destination = segue.destination as! EditDocumentViewController
            destination.document = document
            
        case "addDocument":
            print("Segue: Add button tapped")
        default:
            print("Error: unexpected segue identifier")
        }
    }
    
    @IBAction func unwindWithSegue(_segue: UIStoryboardSegue){
    
    }

}
