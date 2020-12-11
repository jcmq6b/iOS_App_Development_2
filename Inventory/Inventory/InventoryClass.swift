//
//  InventoryClass.swift
//  Inventory



import Foundation

class InventoryClass {
    
    //load function code retreived from https://f.dale.onl/mu/INFOTC4425/Codable%20and%20JSON/Codable%20and%20JSON.html
    
    class func load(jsonFileName: String) -> Inventory? {
        var inventory: Inventory?
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        if let jsonFileUrl = Bundle.main.url(forResource: jsonFileName, withExtension: ".json"),
                    let jsonData = try? Data(contentsOf: jsonFileUrl) {
                    inventory = try? jsonDecoder.decode(Inventory.self, from: jsonData)
                }
        
        return inventory
    }
    
}
