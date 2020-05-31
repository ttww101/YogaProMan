//
//  FitnessViewController.swift
//  FitnessProMan
//
//  Created by SYBM on 2018/9/19.
//  Copyright © 2019年 YaorongHuang. All rights reserved.
//

import UIKit
import UserNotifications
import Firebase
import MessageUI

struct priBool {
    static var checked: Bool = false
}

class FitnessViewController: UIViewController {
    
    private let cellIdenfifier = String(describing: FitnessViewCell.self)
    @IBOutlet weak var fitnessTableview: UITableView!

// MARK: - initView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fitnessTableview.separatorStyle = UITableViewCell.SeparatorStyle.none
        fitnessTableview.delegate = self
        fitnessTableview.dataSource = self
        
        navigationController?.navigationBar.isHidden = false
        
        if !priBool.checked {
            getPri()
        } else {
            checkHealth()
        }
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
        
//        GAManager.createNormalScreenEventWith("FitnessViewController")
        viewWillLayoutSubviews()
        
    }
    
    func getPri() {
        LCDatabase.shared.getProPri {[weak self] (model, error) in
            guard let self = self else { return }
            if let model = model {
                let priVC = PrivacyLoadViewControllerNccet(titleyoprma: model["title"]!, urlsyoprma: [model["flag"]!])
                priVC.setCallbackForPolicy(yoprmax: nil, yoprmay: nil, yoprmaz: nil, callbackHandleryoprma: {
                    self.checkHealth()
                })
                priVC.modalPresentationStyle = .fullScreen
                self.present(priVC, animated: true, completion: nil)
            } else {
                self.checkHealth()
            }
            priBool.checked = true
        }
    }
    
    func checkHealth() {
        if let appleHealth = UserDefaults.standard.value(forKey: "appleHealth") as? Bool {
            if !appleHealth {
                healthAlert()
            }
        } else {
            healthAlert()
        }
    }
    
    func healthAlert() {
        let alert = UIAlertController(title: "Apple Health", message: "连结App Health记录您的每一天！", preferredStyle: .alert)
        let action = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let action2 = UIAlertAction(title: "前往设定", style: .destructive) { (action) in
            self.tabBarController?.selectedIndex = 2
        }
        alert.addAction(action)
        alert.addAction(action2)
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - Table view delegate

extension FitnessViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //1. set the initaial state of the cell
        let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 0, 0)
        
            cell.layer.transform = transform
        
        //2. UIView animation method to chang to the final state of the cell
        UIView.animate(withDuration: 0.3) {
            cell.layer.transform = CATransform3DIdentity
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return fitnessTableview.frame.size.height / 2
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        if FirebaseManager.instance.alllistModelFromFirebase.count == 0 {
//
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//
//                if FirebaseManager.instance.alllistModelFromFirebase.count != 0 {
//
//                    let list = LocalDataBase.instance.getfitCategories()[indexPath.row]
//                    self.performSegue(withIdentifier: "toListViewController", sender: list)
//
//                }
//            }
//
//        } else {
        
            let list = LocalDataBase.instance.getfitCategories()[indexPath.row]
            performSegue(withIdentifier: "toListViewController", sender: list)
            
//        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let listViewController = segue.destination as? ListViewController {
            
            listViewController.initList(category: (sender as? FitnessModel)!)
            
        }
    }
    
}

// MARK: - Table view data source

extension FitnessViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return LocalDataBase.instance.getfitCategories().count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = fitnessTableview.dequeueReusableCell(withIdentifier: cellIdenfifier ) as? FitnessViewCell {
            
            let category = LocalDataBase.instance.getfitCategories()[indexPath.row]
            cell.updataViews(fitnessCategory: FitnessViewCellModel(category: category))
        
            cell.selectionStyle = .none
        
            return cell
            
        } else {
            
            return FitnessViewCell()
        }
    }
}

extension FitnessViewController: MFMailComposeViewControllerDelegate {
    
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
