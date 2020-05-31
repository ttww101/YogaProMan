//
//  ScoreCollectionViewCell.swift
//  FitnessProMan
//
//  Created by SYBM on 2018/9/26.
//  Copyright © 2019年 YaorongHuang. All rights reserved.
//

import UIKit

class ScoreViewCell: UICollectionViewCell {
    
    @IBOutlet weak var scoreImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    
    func updateView(scoreModel: ScoreViewCellModel) {
        
        scoreImg.image = UIImage(named: scoreModel.scoreImg)
        
        titleLbl.text = scoreModel.titleLbl
    
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
            self.layer.cornerRadius = 3.0
            layer.shadowRadius = 10
            layer.shadowOpacity = 0.3
            layer.shadowOffset = CGSize(width: 5, height: 10)
            self.clipsToBounds = false
        
    }
    
}
