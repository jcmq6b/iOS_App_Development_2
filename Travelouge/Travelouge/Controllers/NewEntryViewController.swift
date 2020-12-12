//
//  NewEntryViewController.swift
//  Travelouge


import UIKit

class NewEntryViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    
    @IBOutlet weak var entryTitle: UITextField!
    @IBOutlet weak var entryDate: UIDatePicker!
    @IBOutlet weak var entryDescription: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    let imagePickerController = UIImagePickerController()
    let dateForamatter = DateFormatter()
    
    var entry: Entry?
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateForamatter.dateStyle = .medium
        dateForamatter.timeStyle = .medium
        
        if let entry = entry{
            entryTitle.text = entry.title
            entryDescription.text = entry.entryDescription
            if let date = entry.date{
                entryDate.date = date
            }
//            imageView.image = entry.image
        }else{
            entryTitle.text = ""
            entryDescription.text = ""
        }
    }
    
    @IBAction func selectImage(_ sender: Any) {
        selectPhotoFromLibrary()
    }
    
    func selectPhotoFromLibrary(){
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        defer{
            imagePickerController.dismiss(animated: true, completion: nil)
        }
        
        guard let selected = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else{
            return
        }
        image = selected
        imageView.image = image
        if let entry = entry{
            entry.image = selected
        }
    }
    
    @IBAction func save(_ sender: Any){
        guard let title = entryTitle.text?.trimmingCharacters(in: .whitespaces), !title.isEmpty else {
            presentAlert(message: "Title cannot be blank.")
            return
        }
        guard let description = entryDescription.text?.trimmingCharacters(in: .whitespaces), !description.isEmpty else {
            presentAlert(message: "Description cannot be blank.")
            return
        }
        
        //update if existing, otherwise create new
        if let entry = entry{
            entry.title = title
            entry.entryDescription = description
            entry.image = image
            entry.date = entryDate.date
        }else{
            entry = Entry(title: title, description: description, date: entryDate.date, image: image)
        }
        
        //save the entry
        if let entry = entry{
            do{
                let managedContext = entry.managedObjectContext
                try managedContext?.save()
            }catch{
                presentAlert(message: "Entry could not be saved.")
            }
        }else{
            presentAlert(message: "Entry could not be created.")
        }
        
        //return to entry view controller
        navigationController?.popViewController(animated: true)
    }
    
    //presents an alert to the user
    func presentAlert(message: String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
