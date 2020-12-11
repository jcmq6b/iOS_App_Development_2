
//  InventoryStruct.swift
//  Inventory

//  Created by Jessica Murphey

import Foundation

struct Inventory: Codable{
    
    var status: String
    var products: [Products]
    
    enum CodingKeys: String, CodingKey {
            case status
            case products
    }
}

struct Products: Codable{
    var id: Int
    var category: String
    var title: String
    var price: Double
    var stockedQuantity: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case category
        case title
        case price
        case stockedQuantity
    }
}
