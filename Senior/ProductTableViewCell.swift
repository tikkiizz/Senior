//
//  ProductTableViewCell.swift
//  Senior
//
//  Created by CPE KMUTT on 11/4/2558 BE.
//  Copyright © 2558 Naphat Jindathanakit. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lbProductName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
