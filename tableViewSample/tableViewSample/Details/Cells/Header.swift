//
//  Header.swift
//  tableViewSample
//
//  Created by Kishor Pahalwani on 04/07/19.
//  Copyright © 2019 Self. All rights reserved.
//

import UIKit

class Header: UITableViewHeaderFooterView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var segment: UISegmentedControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bringSubviewToFront(imageView)
        self.bringSubviewToFront(segment)
    }
}
