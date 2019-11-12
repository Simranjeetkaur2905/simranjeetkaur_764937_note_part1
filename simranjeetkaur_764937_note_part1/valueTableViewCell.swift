//
//  valueTableViewCell.swift
//  simranjeetkaur_764937_note_part1
//
//  Created by Simran Chakkal on 2019-11-11.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class valueTableViewCell: UITableViewCell {

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
  



    @IBOutlet weak var imageicone: UIImageView!
    
    @IBOutlet weak var foldername: UILabel!
    
    @IBOutlet weak var labelvalue: UILabel!
    
    
    
    
    func setName(name: String, value: Int, image: String) {
    foldername.text = name
    labelvalue.text = "\(value) "
        imageicone.image = UIImage(named: "folder-icon")
    
        
}
}
