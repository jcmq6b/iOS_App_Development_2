//
//  NewDocumentViewController.swift
//  Documents Core Data Relationships


import UIKit

class NewDocumentViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var contentTextField: UITextView!
    //Holds category to pass to the Documents View
    var category: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
    }
    
    @IBAction func saveDocument(_ sender: Any) {
        let name = nameTextField.text
        let content = contentTextField.text
        
        //Creates new instance of the Document class
        //Then called the category that we passed forward
        //Then called the function addToRawDocument
        if let document = Document(name: name, content: content){
            category?.addToRawDocument(document)
            
            do{
                try document.managedObjectContext?.save()
                //Takes user back to Documents View
                self.navigationController?.popViewController(animated: true)
            }catch{
                print("Could not create document.")
            }
        }
    }


}
extension NewDocumentViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
