//
//  TravelogueViewController.swift
//  Travelouge


import UIKit
import CoreData

class TravelogueViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tripTableView: UITableView!
    
    var trips = [Trip]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tripTableView.delegate = self
        tripTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchTrips()
        tripTableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tripCell", for: indexPath) as! TripViewCell
        let trip = trips[indexPath.row]
        cell.title.text = trip.title
        
        return cell
    }
    
    func fetchTrips(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            trips = [Trip]()
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Trip> = Trip.fetchRequest()
        
        do{
            trips = try managedContext.fetch(fetchRequest)
        }catch{
            presentAlert(message: "Error: Couldn't load Trips")
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?{
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete"){ (rowAction, indexPath) in
            self.delete(indexPath: indexPath)
        }
        return [deleteAction]
    }
    
    func deleteTrip(indexPath: IndexPath){
        
        let trip = trips[indexPath.row]
        
        if let managedObjectContext = trip.managedObjectContext {
            managedObjectContext.delete(trip)
            
            do{
                try managedObjectContext.save()
                self.trips.remove(at: indexPath.row)
                tripTableView.reloadData()
            }catch{
                presentAlert(message: "Delete failed.")
                tripTableView.reloadData()
            }
        }
    }
    
    func delete(indexPath: IndexPath){
        let dialogMessage = UIAlertController(title: "Confirm", message: "Are you sure you want to delete this trip?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            self.deleteTrip(indexPath: indexPath)
        })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
//            print("Cancel button tapped")
        }
        
        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)
        
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    
    //presents an alert to the user
    func presentAlert(message: String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEntries"{
            guard let destination = segue.destination as? EntriesViewController else{
                return
            }
            
            if let indexPathForSelectedRow = tripTableView.indexPathForSelectedRow{
//                destination.trip = trips[indexPathForSelectedRow.row]
            }
        }
    }

}
