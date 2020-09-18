
import UIKit

class EditDocumentViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    //Can potentially be nil
    //When displaying an existing document the property won't be nil
    //When creating a new document the document will be nil
    var document: Document?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Take the passed title and read in the document contents if the document exists
        if let document = document{
            titleTextField.text = document.title
            contentTextView.text = document.content
        }else{
            titleTextField.text = ""
            contentTextView.text = ""
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Adding destination to fill in the text fields if editing an existing document
        guard let identifier = segue.identifier,
            let destination = segue.destination as? DocumentsTableTableViewController
            else{return}
        
        //Checks which button segue was tapped, prints statement to console, and sets variables
        switch identifier {
        
        //If this is an edit to an existing document
        case "save" where document != nil:
            document?.title = titleTextField.text ?? ""
            document?.content = contentTextView.text ?? ""
            
            destination.tableView.reloadData()
            
            //Save the file to an existing directory
            
        //If this is a new document being created
        case "save" where document == nil:
            print("Segue: Save bar button tapped")
            
            let document = Document()
            document.title = titleTextField.text ?? ""
            document.content = contentTextView.text ?? ""
            document.date = Date()
            
            //Need to type cast to the destination view controller to access its properties
            let destination = segue.destination as! DocumentsTableTableViewController
            destination.documents.append(document)
            
            //Create new directory and save to there
            
        case "cancel":
            print("Segue: Cancel bar button tapped")
            //Nothing else here since we don't want anything to happen but returning to previous scene
            
        default:
            print("Error: Unidentified segue identifier")
        }
    }

}
