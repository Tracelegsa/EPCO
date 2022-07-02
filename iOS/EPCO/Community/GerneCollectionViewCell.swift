//
//  GerneCollectionViewCell.swift
//  EPCO
//
//  Created by 문정호 on 2022/07/02.
//

import UIKit

class GerneCollectionViewCell: UICollectionViewCell {
    static let identifier = "GerneCollectionViewCell"
    
    @IBOutlet weak var buttonGerne: UIButton!
    
    let gerneText : [String] = ["K-Pop", "멜로디", "힙합", "EDM", "Rock", "등등"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
