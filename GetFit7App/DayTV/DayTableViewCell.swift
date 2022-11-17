//
//  DayTableViewCell.swift
//  GetFit7App
//
//  Created by Venkatram G V on 23/03/22.
//

import UIKit

class DayTableViewCell: UITableViewCell {

    static let identifier: String = "DayTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        placeHolderView.layer.cornerCurve = .continuous
        placeHolderView.layer.cornerRadius = 10.0
    }

    @IBOutlet weak var placeHolderView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
}
