//
//  SummaryViewController.swift
//  FitnessProMan
//
//  Created by SYBM on 2018/9/26.
//  Copyright © 2019年 YaorongHuang. All rights reserved.
//

import UIKit
import RealmSwift
import Lottie
import MessageUI

class SummaryViewController: UIViewController, NotificationAuthProtocol {
    
    var allTime = 0
    var allTimeToMin = 0
    var sectionHeaderTitleArray = ["运动总数", "挑战项目"]
    var summaryArray: Results<SummaryModel>!
    var animationView = AnimationView()

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var summaryTableview: UITableView!
    @IBOutlet weak var workoutNowBtn: UIButton!
    @IBOutlet weak var workoutTomorrowBtn: UIButton!
    
    private let cellIdenfifierSummaryView1Cell = String(describing: SummaryView1Cell.self)
    private let cellIdenfifierSummaryView2Cell = String(describing: SummaryView2Cell.self)
    
// MARK: - initView

    override func viewDidLoad() {
        super.viewDidLoad()
        
        summaryTableview.delegate = self
        summaryTableview.dataSource = self
        
        summaryTableview.register(UINib(nibName: "SummaryView1Cell", bundle: nil), forCellReuseIdentifier: "SummaryView1Cell")
        summaryTableview.register(UINib(nibName: "SummaryView2Cell", bundle: nil), forCellReuseIdentifier: "SummaryView2Cell")
        
        let realm = RealmService.shared.realm
        summaryArray = realm?.objects(SummaryModel.self)
        
        let notificationName = Notification.Name("addNewData")
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateRealm(noti:)),
                                               name: notificationName,
                                               object: nil)

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "icon_email"), style: .plain, target: self, action: #selector(toMailBack(_:)))
    }
    
    @objc func toMailBack(_ sender: Any) {
        let mailComposerVC = configureMailController()
        
        if MFMailComposeViewController.canSendMail() {
            
            self.present(mailComposerVC, animated: true, completion: nil)
            
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
//        GAManager.createNormalScreenEventWith("SummaryVC")
        
        animationView.play()
        
        allTime = 0
        
        if summaryArray.count - 1 > 0 {
            
            for summaryArrayIndex in 0 ... summaryArray.count - 1 {
                allTime += summaryArray[summaryArrayIndex].durationLbl
            }
            
        } else if summaryArray.count == 1 {
            
            allTime = summaryArray[0].durationLbl
            
        }

        allTimeToMin = allTime / 60

        if summaryArray.count == 0 {
            
            firstView.isHidden = false
            loadAnimateView()
            
        } else {
            
            firstView.isHidden = true
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        animationView.removeFromSuperview()
        
    }
 
// MARK: - LOTAnimationView
    
    func loadAnimateView() {
       
            animationView = AnimationView(name: "empty_box")
            animationView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
            animationView.center = CGPoint(x: self.view.center.x, y: self.view.center.y-120)
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = .loop
            animationView.play()
            self.view.addSubview(animationView)
        
            workoutNowBtn.cornerRadius = 25
            workoutTomorrowBtn.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            workoutTomorrowBtn.borderWidth = 2
            workoutTomorrowBtn.cornerRadius = 25
    
    }
    
    @IBAction func workoutNowBtn(_ sender: UIButton) {
        
        tabBarController?.selectedIndex = 0
        
    }
    
    @IBAction func workoutTomorrowBtn(_ sender: UIButton) {

        notificationVCSwitch()
    }
    
// MARK: - realm
    
    @objc func updateRealm(noti: Notification) {
        
        allTime = 0
        
        if summaryArray.count - 1 > 0 {
            
            for summaryArrayIndex in 0 ... summaryArray.count - 1 {
                
                allTime += summaryArray[summaryArrayIndex].durationLbl
                
            }
            
        } else if summaryArray.count == 1 {
            
            allTime += summaryArray[0].durationLbl
        }
        
        allTimeToMin = allTime / 60
        
        animationView.stop()
       
        animationView.removeFromSuperview()
        
        summaryTableview.reloadData()
    }
    
}

extension SummaryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            
            return 160
        
        } else {
        
            return 150
        
        }
    }

}

// MARK: - UITableViewDataSource

extension SummaryViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
            
        case 0: return 1
        case 1: return summaryArray.count
        default: return 0
        
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
            
        case 0: return "运动总数"
        case 1: return "挑战项目"
        default: return "挑战项目"
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let returnedView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 25))
        returnedView.backgroundColor = .black
        
        let label = UILabel(frame: CGRect(x: 25, y: 0, width: view.frame.size.width, height: 25))
        label.text = "\(self.sectionHeaderTitleArray[section]) : "
        label.textColor = UIColor.white
        returnedView.addSubview(label)
        
        return returnedView
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        summaryTableview.separatorStyle = UITableViewCell.SeparatorStyle.none
        let index = indexPath.row
        
        switch indexPath.section {
            
        case 0:
            
            guard let cell = summaryTableview.dequeueReusableCell(withIdentifier:
                cellIdenfifierSummaryView1Cell) as? SummaryView1Cell
                else {return SummaryView1Cell()}
            cell.planNumberLbl.text = String(summaryArray.count)
            cell.allTimeLbl.text = String(allTimeToMin)
            cell.selectionStyle = .none
            
            return cell
            
        case 1:
            
            guard let cell = summaryTableview.dequeueReusableCell(withIdentifier:
                cellIdenfifierSummaryView2Cell) as? SummaryView2Cell
                else { return SummaryView2Cell()}
            
            cell.updateView(summaryModel: summaryArray.reversed()[index])
            cell.selectionStyle = .none
            
            return cell
            
        default:
            
            break
            
        }
        return SummaryView1Cell()
    }
    
}

extension SummaryViewController: MFMailComposeViewControllerDelegate {
    
    func configureMailController() -> MFMailComposeViewController {
        
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.navigationBar.barTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        mailComposerVC.setToRecipients(["hengyaxin008@zoho.com"])
        mailComposerVC.setSubject("App意见回馈")
        mailComposerVC.title = "意见回馈"
        
        return mailComposerVC
        
    }
    
    func sendEmail() {
        
        let mailComposeViewController = configureMailController()
        
        if MFMailComposeViewController.canSendMail() {
            
            self.present(mailComposeViewController, animated: true, completion: nil)
            
        }
        
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult,
                               error: Error?) {
        
        controller.dismiss(animated: true, completion: nil)
        
    }
    
}
