//
//  AddTripViewController.swift
//  Travelouge


import UIKit

class AddTripViewController: UIViewController, UINavigationControllerDelegate {
    

    @IBOutlet weak var tripTitle: UITextField!
    
    var trip: Trip?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(_ sender: Any) {
        guard let title = tripTitle.text?.trimmingCharacters(in: .whitespaces), !title.isEmpty else {
            presentAlert(message: "Title cannot be blank")
            return
        }
        trip = Trip(title: title)
        
        if let trip = trip{
            do{
                let managedContext = trip.managedObjectContext
                try managedContext?.save()
            }catch{
                presentAlert(message: "Error saving trip")
            }
            
        } else {
            presentAlert(message: "Error creating trip")
        }
        //return to travelogue view controller
        navigationController?.popViewController(animated: true)
    }
    
    //presents an alert to the user
    func presentAlert(message: String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
