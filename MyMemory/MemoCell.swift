//
//  MemoCell.swift
//  MyMemory
//
//  Created by Wonik on 01/03/2019.
//  Copyright © 2019 Wonik. All rights reserved.
//

import UIKit

class MemoCell: UITableViewCell {

    @IBOutlet weak var lbSubject: UILabel!
    @IBOutlet weak var lbContents: UILabel!
    @IBOutlet weak var lbRegdate: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
