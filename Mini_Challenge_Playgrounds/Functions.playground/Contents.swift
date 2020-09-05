import Cocoa

func check(value input: Int)->String?{
    if(input>0){return String(input)}
    else{return nil}
}

let numberString1: String? = check(value: 10) // numberString should be "10"

let numberString2: String? = check(value: 0) // numberString should be nil

let numberString3: String? = check(value: -2) // numberString should be nil

print("numberString1: \(numberString1!)")
if(numberString2 != nil){print("numberString2: \(numberString2!)")}else{print("numberString2 is nil")}
if(numberString3 != nil){print("numberString2: \(numberString3!)")}else{print("numberString2 is nil")}
