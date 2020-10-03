//
//  NewCategoryViewController.swift
//  ExpensesCoreData
//
//  Created by Shawn Moore on 11/9/17.
//  Copyright © 2017 Shawn Moore. All rights reserved.
//
//This is the view controller that the user is taken too when they press the plus button on the
//category's view controller
//Creates a new category
import UIKit

class NewCategoryViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        titleTextField.resignFirstResponder()
    }
    
    //Function is called when user clicks the button save
    //Creates a new instance of the category
    @IBAction func saveCategory(_ sender: Any) {
        //Get the title's textfield text
        let category = Category(title: titleTextField.text ?? "") //default if text is nil
        
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
