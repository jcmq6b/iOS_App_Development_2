//
//  NewCategoryViewController.swift
//  Documents Core Data Relationships

import UIKit

class NewCategoryViewController: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.delegate = self
    }
    
    //Function is called when user clicks the button save
    //Creates a new instance of the category
    @IBAction func saveNewCategory(_ sender: Any) {
        //Get the title's textfield text
        let category = Category(title: titleField.text ?? "") //default if text is nil
        print(titleField.text ?? "default value used")
        //save this from the managed context to the persistent store
        //Need to have access to managed context and preform a save to that context
        do{
            try category?.managedObjectContext?.save()
            //After saving the user gets taken automatically back to the list of categories
            //Pops the current view off the stack, taking them back to the lists
            self.navigationController?.popViewController(animated: true)
        }catch{
            print("Could not save category")
        }
    }

    

}
extension NewCategoryViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

