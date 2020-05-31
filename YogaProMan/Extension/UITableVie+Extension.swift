//
//  UITableVie+extension.swift
//  Moving
//
//  Created by SYBM on 2018/10/24.
//  Copyright © 2019年 YaorongHuang. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func isCellVisible(indexSection: Int, indexRow: Int) -> Bool {
        
        guard let indexes = self.indexPathsForVisibleRows else {
            
            return false
            
        }
        
        return indexes.contains {$0.section == indexSection && $0.row == indexRow }
        
    }
}
