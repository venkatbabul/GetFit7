//
//  HomePageTableViewCell.swift
//  GetFit7App
//
//  Created by Venkatram G V on 23/03/22.
//

import UIKit

class HomePageTableViewCell: UITableViewCell {

    static let identifier: String = "HomePageTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        placeHolderView.layer.cornerCurve = .continuous
        placeHolderView.layer.cornerRadius = 10.0
    }

    @IBOutlet weak var imagesView: UIImageView!
    @IBOutlet weak var placeHolderView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
}
