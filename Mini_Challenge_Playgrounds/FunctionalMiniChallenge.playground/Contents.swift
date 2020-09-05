import Cocoa

enum StudentYear{
    case freshman
    case sophomore
    case junior
    case senior
}

struct Student{
    var firstName: String
    var lastName: String
    var id: Int
    var grade: Int
    var year: StudentYear
}

var studentArray: [Student] = []
studentArray.append(Student(firstName: "Bob", lastName: "Jones", id: 1, grade: 76, year: StudentYear.freshman))
studentArray.append(Student(firstName: "Joe", lastName: "Murphy", id: 2, grade: 86, year: StudentYear.junior))
studentArray.append(Student(firstName: "Evan", lastName: "Smith", id: 3, grade: 92, year: StudentYear.senior))
studentArray.append(Student(firstName: "Jane", lastName: "Doe", id: 4, grade: 96, year: StudentYear.sophomore))

let freshmanArray = studentArray.filter{year == StudentYear.freshman}
