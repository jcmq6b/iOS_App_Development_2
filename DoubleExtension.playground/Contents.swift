//Challenge Double Extension
//By Jessica Murphey
//Pawprint: jcmq6b

import UIKit

extension Double {
    func add(_ input: String) -> Double?{
        if Double(input) != nil {
            //Force unwrapping b/c if() checked for nil
            return self + Double(input)!
        }else{
            return nil
        }
    }
}

//Test Statements
let value1: Double? = 3.5.add("1.2") // value1 will equal 4.7
let value3: Double? = 1.5.add("words") // value will be nil

//Test Output
if(value1 != nil){print("value1: \(value1!)")}else{print("value1 is nil")}
if(value3 != nil){print("value3: \(value3!)")}else{print("value3 is nil")}
