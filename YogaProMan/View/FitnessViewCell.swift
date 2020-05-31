//
//  FitnessViewCell.swift
//  FitnessProMan
//
//  Created by SYBM on 2018/9/20.
//  Copyright © 2019年 YaorongHuang. All rights reserved.
//

import UIKit

class FitnessViewCell: UITableViewCell {

    @IBOutlet weak var secondFitnessLbl: UILabel!
    @IBOutlet weak var backgroundCardView: UIView!
    @IBOutlet weak var fitnessImg: UIImageView!
    @IBOutlet weak var fitnessLbl: UILabel!
    
    func updataViews(fitnessCategory: FitnessViewCellModel) {
        
        fitnessImg.image = UIImage(named: fitnessCategory.imageName)

        fitnessLbl.text = fitnessCategory.title

        secondFitnessLbl.text = fitnessCategory.subTitle
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        fitnessImg.clipsToBounds = true
        
        fitnessImg.layer.cornerRadius = 15
        
        backgroundCardView.backgroundColor = UIColor.blue
        backgroundCardView.clipsToBounds = true
        backgroundCardView.layer.masksToBounds = false
        backgroundCardView.layer.cornerRadius = 15
        
        backgroundCardView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        backgroundCardView.layer.shadowOffset = CGSize.zero
        backgroundCardView.layer.shadowOpacity = 0.4
        
        contentView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
}
