//
//  EntryViewCell.swift
//  Travelouge


import UIKit

class EntryViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!

    @IBOutlet weak var entryDate: UILabel!
    @IBOutlet weak var entryImage: UIImageView!
    @IBOutlet weak var entryDescription: UITextView!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
