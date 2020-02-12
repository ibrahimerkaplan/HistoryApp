//
//  DetailDayCell.swift
//  HistoryApp
//
//  Created by ibrahim erkaplan on 10.02.2020.
//  Copyright © 2020 ibrahim erkaplan. All rights reserved.
//

import UIKit

class DetailDayCell: UITableViewCell {

    @IBOutlet weak var labelName: BaseLabel!
    @IBOutlet weak var labelDetail: BaseLabel!
    @IBOutlet weak var labelYear: BaseLabel!
    @IBOutlet weak var labelDetailYear: BaseLabel!

    var viewModelDetailDayCell : DetailDayCVM? {
        didSet {
            labelName.text = viewModelDetailDayCell?.name
            labelDetail.text = viewModelDetailDayCell?.detail
            labelYear.text = viewModelDetailDayCell?.year
            labelDetailYear.text = viewModelDetailDayCell?.detailYear
        }
    }

}
