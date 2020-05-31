//
//  ActionViewCell.swift
//  FitnessProMan
//
//  Created by SYBM on 2018/9/21.
//  Copyright © 2019年 YaorongHuang. All rights reserved.
//

import UIKit

class ActionViewCell: UITableViewCell {
    
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var timeDescription: UILabel!
    @IBOutlet weak var actionDescription: UILabel!
    
    func updateView(actionModel: ActionViewCellModel) {
        
        progressView.isHidden = true
        
        timeDescription.text = String("\(Int(actionModel.timesDescription))秒")
        
        actionDescription.text = actionModel.actionDescription
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.backgroundColor = #colorLiteral(red: 0.06666666667, green: 0.06666666667, blue: 0.06666666667, alpha: 1)
    }

}
