//Challenge Double Extension
//By Jessica Murphey
//Pawprint: jcmq6b

import UIKit

extension String {
    func add(_ input: Int) -> Int?{
        //Using 'self' to access what the variable the function was called on
        if Int(self) != nil {
            //Force unwrap, b/c it cannot be nil
            let value = Int(self)! + input
            return value
        }else{
            return nil
        }
    }
}

//Test values
let value1: Int? = "5".add(3) // value1 will equal 8
let value2: Int? = "-2".add(1) // value2 will equal -1
let value3: Int? = "words".add(4) // value2 will be nil

//Test output
if(value1 != nil){print("value1: \(value1!)")}else{print("value1 is nil")}
if(value2 != nil){print("value2: \(value2!)")}else{print("value2 is nil")}
if(value3 != nil){print("value3: \(value3!)")}else{print("value3 is nil")}


