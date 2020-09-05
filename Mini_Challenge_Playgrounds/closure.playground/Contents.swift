import Cocoa

struct MathOperation{
    var units: String
    var operation = {(val1: Double, val2: Double) ->Double in
        var result: Double = val1 + val2
        return result
    }
    
    init?(units: String) {
        if(units != ""){self.units = units}
        else{return nil}
    }
}

