//
//  InventoryViewCell.swift
//  Inventory
//
//  Created by Jessica Murphey
//

import UIKit

class InventoryViewCell: UITableViewCell {

    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var quantity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
