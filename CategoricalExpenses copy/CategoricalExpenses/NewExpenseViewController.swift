//
//  NewExpenseViewController.swift
//  Expenses
//
//  Created by Shawn Moore on 11/6/17.
//  Copyright © 2017 Shawn Moore. All rights reserved.
//

import UIKit
//Creates an expense and saves it to the managed context

class NewExpenseViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    //Holds category that it will pass to the Expenses View
    var category: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        amountTextField.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextField.resignFirstResponder()
        amountTextField.resignFirstResponder()
    }
    
    @IBAction func saveExpense(_ sender: Any) {
        let name = nameTextField.text
        let amountText = amountTextField.text ?? "" //If the text field does not exist initializes to a blank string
        let amount = Double(amountText) ?? 0.0 //Needs default incase the text entered is not a number
        let date = datePicker.date
        
        //Creates new instance of the Expense class
        //Then called the category that we passed forward
        //Then called the function addToRawExpenses
        if let expense = Expense(name: name, amount: amount, date: date){
            category?.addToRawExpenses(expense)
            
            do{
                try expense.managedObjectContext?.save()
                //Takes us back to the Expenses View
                self.navigationController?.popViewController(animated: true)
            }catch{
                print("Could not create expense")
            }
        }
    }
}

extension NewExpenseViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
