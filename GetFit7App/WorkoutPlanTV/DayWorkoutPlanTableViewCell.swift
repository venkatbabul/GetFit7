//
//  DayWorkoutPlanTableViewCell.swift
//  GetFit7App
//
//  Created by Venkatram G V on 25/03/22.
//

import UIKit

class DayWorkoutPlanTableViewCell: UITableViewCell {

    static let identifier: String = "DayWorkoutPlanTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        placeHoler.layer.cornerCurve = .continuous
        placeHoler.layer.cornerRadius = 10
    }
    
    @IBOutlet weak var gifImage: UIImageView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var placeHoler: UIView!
    @IBOutlet weak var nameLabel: UILabel!
}
