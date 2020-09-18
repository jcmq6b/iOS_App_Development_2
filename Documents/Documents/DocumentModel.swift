
import Foundation

class Document: FileManager{
    //Properties
    var title = ""
    var size = ""
    var date = Date()
    var content = ""
    
    
    //Add in read, write, and delte functions for the files
    //Here are my attempts, I couldn't get them actually fucntioning
    func writeToFile(_ title: String, _ content: String){
        let fileName = self.title
        let directoryURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = directoryURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        
        //debugging help
        print("File Path: \(fileURL.path)")
        
        let writeString = self.content
        do {
            try writeString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Error: Failed to write to URL")
            print(error)
        }
    }
    
    func readFile(_ title: String)-> String{
        let fileName = self.title
        let directoryURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = directoryURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        var readString = ""
        
        do {
            readString = try String(contentsOf: fileURL)
        } catch let error as NSError {
            print("Error: Failed to read file")
            print(error)
        }
        return(readString)
    }
    
}
