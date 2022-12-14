//
//  CardCell.swift
//  memeGen
//
//  Created by user224812 on 8/5/22.
//

import UIKit

class CardCell: UITableViewCell {

    var meme: Meme? {
        didSet {
            self.labelCell.text = meme?.name
            self.imageViewCell.loadThumbnail(urlSting: meme?.url ?? "link to a placeholder image")
        }
    }
    @IBOutlet weak var labelCell: UILabel!
    @IBOutlet weak var imageViewCell: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
