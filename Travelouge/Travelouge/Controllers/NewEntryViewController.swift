//
//  NewEntryViewController.swift
//  Travelouge


import UIKit

class NewEntryViewController: UIViewController {

    
    @IBOutlet weak var entryTitle: UITextField!
    @IBOutlet weak var entryDate: UIDatePicker!
    @IBOutlet weak var entryDescription: UITextView!
    @IBOutlet weak var selectImage: UIButton!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
