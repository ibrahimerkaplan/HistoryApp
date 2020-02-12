//
//  HeaderCell.swift
//  HistoryApp
//
//  Created by ibrahim erkaplan on 10.02.2020.
//  Copyright © 2020 ibrahim erkaplan. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {

    @IBOutlet weak var labelTitle: BaseLabel!

    var viewModelHeaderCell : HeaderCVM? {
        didSet {
            labelTitle.text = viewModelHeaderCell?.title
        }
    }
}
