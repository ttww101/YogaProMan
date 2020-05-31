//
//  SummaryView2Cell.swift
//  FitnessProMan
//
//  Created by SYBM on 2018/9/27.
//  Copyright © 2019年 YaorongHuang. All rights reserved.
//

import UIKit
import Kingfisher

class SummaryView2Cell: UITableViewCell {
    
    @IBOutlet weak var scoreTitleLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var workoutDateLbl: UILabel!
    @IBOutlet weak var videoImg: UIImageView!
    
    func updateView(summaryModel: SummaryModel) {
 
        let minutes = summaryModel.durationLbl % 3600 / 60
        let seconds = (summaryModel.durationLbl % 3600) % 60
        
        scoreTitleLbl.text = summaryModel.scoreTitleLbl
        if seconds < 10 {
            durationLbl.text = ("\(minutes):0\(seconds)")
        } else {
            durationLbl.text = ("\(minutes):\(seconds)")
        }
        videoTitle.text = summaryModel.videoTitle
        workoutDateLbl.text = timeIntervalToString(workoutDate: summaryModel.workoutDate)
        
        if summaryModel.videoImg.contains("https://firebasestorage") {
            
            guard let url = URL(string: summaryModel.videoImg) else { return }
            videoImg.kf.setImage(with: url)
            
        } else {
            
            videoImg.image = UIImage(named: summaryModel.videoImg)
            
        }
       
    }
    
    func timeIntervalToString(workoutDate: TimeInterval) -> String {
        
        let date = Date(timeIntervalSince1970: workoutDate)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "TW")
        dateFormatter.locale = NSLocale.current
        
        dateFormatter.dateFormat = "MM月 dd日 HH:mm"
        let strDate = dateFormatter.string(from: date)
        return strDate
        
    }
    
}
