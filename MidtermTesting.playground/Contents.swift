import UIKit

struct Event {
    let title: String
    let description: String
    let priority: Int
    let dateAdded: Date
    let dateCompleted: Date
}

struct Patient{
    let name: String
    let birthDate: Date
    let enrolledDate: Date?
    
    init(_ name: String, _ birthDate: Date){
        self.name   = name
        self.birthDate = birthDate
    }
}


