//
//  ActionViewController.swift
//  FitnessProMan
//
//  Created by SYBM on 2018/9/21.
//  Copyright © 2019年 YaorongHuang. All rights reserved.
//

import UIKit
import YouTubePlayer_Swift
import AVFoundation
import Lottie
import Kingfisher

class ActionViewController: UIViewController, SwipeGestureProtocol {
    
    var actionTimer: Timer?
    var actionSec = 0
    var restTimer: Timer?
    var restSec = 0
    
    var selectSender = 0
    var nowIndex = 0
    var contentInsetNumber = 0
    
    var firstTimeplay = true
    var actionTimerjustStop = false
    var restTimerjustStop = false
    
    var actionAnimatorWidth = UIViewPropertyAnimator()
    var restAnimatorWidth = UIViewPropertyAnimator()
    
    var lists =  [NewListModel]()
    var actionLists = [NewActionModel]()
    
    var cueTone: AVAudioPlayer!
    var cueToneStatus: EffectSound = .open
    
    var synthesizer = AVSpeechSynthesizer()
    var animationView = AnimationView()
    var reachability = Reachability(hostName: "www.apple.com")
    
    private let cellIdenfifier = String(describing: ActionViewCell.self)
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var videoView: YouTubePlayerView!
    @IBOutlet weak var connectView: UIView!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoImg: UIImageView!
    @IBOutlet weak var intensityLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var actionTableView: UITableView!
    @IBOutlet weak var reconnectBtn: UIButton!
    @IBOutlet weak var playcontrolBtn: UIButton!
    
    // MARK: - initView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        swipeGesture()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
//        GAManager.createNormalScreenEventWith("ActionViewController")
        actionTableView.reloadData()
        cueToneSetting()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        videoView.pause()
        animationView.removeFromSuperview()
        
    }
    
    func initView() {
        
        actionTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        videoView.isHidden = true
        self.videoView.delegate = self
        activityIndicator.isHidden = true
        initEffectSound()
        
        actionTimer?.invalidate()
        restTimer?.invalidate()
        
        startBtn.cornerRadius = 38
        let listIndex = lists[selectSender]
        videoTitle.text = listIndex.videoTitle
        
//        guard let url = URL(string: listIndex.videoImg) else { return }
        videoImg.image = UIImage(named: listIndex.videoImg)
        
        intensityLbl.text = listIndex.intensity
        durationLbl.text = "\(listIndex.durationLbl)min"
        
        let index = IndexPath(row: nowIndex, section: 0)
        actionTableView.reloadRows(at: [index], with: UITableView.RowAnimation.automatic)
        
        cueToneSetting()
        
    }
    
    func initList(category: FitnessModel) {
        
//        lists = FirebaseManager.instance.getList(forListTitle: category.secondTitle)
        lists = LocalDataBase.instance.getList(forListTitle: category.secondTitle)
        
    }
    
    // MARK: - playBtn
    
    @IBAction func playBtn(_ sender: UIButton) {
        
        if downloadData() == true {
            
            videoView.isHidden = false
            videoView.playerVars = ["playsinline": 1 as AnyObject]
            videoView.loadVideoID(lists[selectSender].videoID)
            activityIndicator.startAnimating()
            activityIndicator.isHidden = false
            videoView.isUserInteractionEnabled = false
            
        } else {
            
            print(" downloadData() == false ")
            
        }
    }
    
    // MARK: - play control
    @IBAction func playbtnAction(_ sender: UIButton) {
        if actionLists[nowIndex].playingOrPause == .playing {
            
            videoView.pause()
            
        } else {
            
            videoView.play()
            
        }
    }
    
    @IBAction func nextbtnAction(_ sender: UIButton) {
        guard nowIndex < (actionLists.count - 1) else { return }
        moreThanNowIndex(indexPath: IndexPath(row: nowIndex + 1, section: 0))
    }
    
    @IBAction func previousbtnAction(_ sender: UIButton) {
        guard nowIndex > 0 else { return }
        lessThanNowIndex(indexPath: IndexPath(row: nowIndex - 1, section: 0))
    }
    
    func playcontrolPlayImage() {
        playcontrolBtn.setImage(UIImage(named: "icons8-circled-play"), for: .normal)
    }
    func playcontrolPauseImage() {
        playcontrolBtn.setImage(UIImage(named: "icons8-pause-button"), for: .normal)
    }
    
    
    // MARK: - EffectSound
    
    func cueToneSetting() {
        
        if let cueToneSetting = UserDefaults.standard.value(forKey: "cueTone") as? Bool {
            
            if cueToneSetting == true {
                
                cueToneStatus = .open
                
            } else {
                
                cueToneStatus = .close
                
            }
        }
    }
    
    func initEffectSound() {
        
        let soundPath = Bundle.main.url(forResource: "Wate", withExtension: "wav")
        
        do {
            
            self.cueTone = try AVAudioPlayer(contentsOf: soundPath!)
            self.cueTone.prepareToPlay()
            
        } catch {
            
            print("initEffectSound error")
            
        }
    }
    
    func sayActionDescription() {
        
        let utterance = AVSpeechUtterance(string: actionLists[nowIndex].actionDescription)
        utterance.voice =  AVSpeechSynthesisVoice(language: "zh-TW")
        synthesizer.speak(utterance)
        
    }
    
    // MARK: - CountDownReloadView
    
    func actionCountDownReloadCellView() {
        
        let indexPath = IndexPath(row: nowIndex, section: 0)
        guard let cell = self.actionTableView.cellForRow(at: indexPath) as? ActionViewCell  else {return}
        cell.timeDescription.text = "\(actionSec)"
        cell.progressView.backgroundColor = #colorLiteral(red: 0, green: 0.6980392157, blue: 0.3058823529, alpha: 1)
        
    }
    
    func actionCountDownToZeroReloadCellView() {
        
        let indexPath = IndexPath(row: nowIndex, section: 0)
        guard let cell = self.actionTableView.cellForRow(at: indexPath) as? ActionViewCell  else {return}
        cell.progressView.frame.size.width = cell.frame.size.width
        cell.progressView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        contentHeightChang()
        
        if cueToneStatus == EffectSound.open {
            
            cueTone.play()
            
        }
    }
    
    func restCountDownReloadCellView() {
        
        let indexPath = IndexPath(row: nowIndex, section: 0)
        guard let cell = self.actionTableView.cellForRow(at: indexPath) as? ActionViewCell  else {return}
        cell.timeDescription.text = "\(restSec)"
        cell.actionDescription.text = "休息时间"
        
    }
    
    func restCountDownToZeroReloadCellView() {
        
        let indexPath = IndexPath(row: nowIndex, section: 0)
        guard let cell = self.actionTableView.cellForRow(at: indexPath) as? ActionViewCell  else {return}
        cell.actionDescription.text = actionLists[nowIndex].actionDescription
        
        if cueToneStatus == .open {
            
            cueTone.play()
            sayActionDescription()
            
        } else {
            
        }
    }
    
    // MARK: - CountDown
    @objc func actionCountDown() {
        
        actionLists[nowIndex].cellStatus = .playing
        actionLists[nowIndex].actionOrRest = .action
        
        actionCountDownReloadCellView()
        
        actionSec -= 1
        
        if actionSec <= 0 {
            
            actionTimer?.invalidate()
            
            if nowIndex < actionLists.count-1 {
                
                actionAnimatorWidth.stopAnimation(true)
                
                actionLists[nowIndex].cellStatus = .played
                
                nowIndex += 1
                
                actionLists[nowIndex].cellStatus = .playing
                actionLists[nowIndex].actionOrRest = .rest
                
                actionCountDownToZeroReloadCellView()
                
                if actionLists[nowIndex].firstPlayRest == true {
                    
                    restSec = Int(actionLists[nowIndex].restTime)
                    actionLists[nowIndex].firstPlayRest = false
                    
                }
                
                restViewWidthAnimate(cell: nil)
                
                self.renewVideo()
                
                self.restTimer = Timer.scheduledTimer(timeInterval: 1,
                                                      target: self,
                                                      selector: #selector(self.restCountDown),
                                                      userInfo: nil,
                                                      repeats: true)
                
            } else {
                
                videoView.pause()
                performSegue(withIdentifier: "toScoreViewController", sender: actionLists)
                
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scoreVC = segue.destination as? ScoreViewController {
            
            scoreVC.lists = self.lists
            scoreVC.actionLists = self.actionLists
            scoreVC.selectSender = self.selectSender
            
        }
    }

  
    
    @objc func restCountDown() {
        
        restSec -= 1
        
        restCountDownReloadCellView()
        
        if restSec <= 0 {
            
            if actionLists[nowIndex].firstPlayAction == true {
                
                actionSec = Int(actionLists[nowIndex].timesDescription)
                actionLists[nowIndex].firstPlayAction = false
                
            }
            
            actionViewWidthAnimate(cell: nil)
            restCountDownToZeroReloadCellView()
            restTimer?.invalidate()
            self.actionTimer = Timer.scheduledTimer(timeInterval: 1,
                                                    target: self,
                                                    selector: #selector(self.actionCountDown),
                                                    userInfo: nil, repeats: true)
            
        }
    }
    
    // MARK: - renewVideo
    
    func renewVideo() {
        
        let floatYoutubeTime = Float(actionLists[nowIndex].youtubeTime)
        videoView.seekTo(floatYoutubeTime, seekAhead: true)
        let youtubestopTime = actionLists[nowIndex].stopTime
        let compareIndex = nowIndex
        
        DispatchQueue.main.asyncAfter(deadline: .now() + youtubestopTime) {
            if compareIndex == self.nowIndex {
                self.videoView.seekTo(Float(self.actionLists[self.nowIndex].youtubeTime), seekAhead: true)
                DispatchQueue.main.asyncAfter(deadline: .now() + youtubestopTime) {
                    if compareIndex == self.nowIndex {
                        self.videoView.seekTo(Float(self.actionLists[self.nowIndex].youtubeTime), seekAhead: true)
                        DispatchQueue.main.asyncAfter(deadline: .now() + youtubestopTime) {
                            if compareIndex == self.nowIndex {
                                self.videoView.seekTo(Float(self.actionLists[self.nowIndex].youtubeTime), seekAhead: true)
                                DispatchQueue.main.asyncAfter(deadline: .now() + youtubestopTime) {
                                    if compareIndex == self.nowIndex {
                                        self.videoView.seekTo(Float(self.actionLists[self.nowIndex].youtubeTime), seekAhead: true)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - Animate
    
    func actionViewWidthAnimate(cell: ActionViewCell?) {
        
        if Int(actionLists[nowIndex].timesDescription) == actionSec {
            
            let indexPath = IndexPath(row: nowIndex, section: 0)
            guard let cell = self.actionTableView.cellForRow(at: indexPath) as? ActionViewCell  else {return}
            cell.progressView.isHidden = false
            cell.progressView.backgroundColor = #colorLiteral(red: 0, green: 0.6980392157, blue: 0.3058823529, alpha: 1)
            cell.progressView.frame = cell.bounds
            cell.progressView.frame.size.width = 0
            
            actionAnimatorWidth = UIViewPropertyAnimator(duration: actionLists[nowIndex].timesDescription,
                                                         curve: .easeIn) {
            cell.progressView.frame.size.width = cell.frame.size.width}
            
        } else {
            
            guard let cell = cell  else {return}
            cell.progressView.isHidden = false
            cell.progressView.backgroundColor = #colorLiteral(red: 0, green: 0.6980392157, blue: 0.3058823529, alpha: 1)
            
            let timesDescription = actionLists[nowIndex].timesDescription
            let proportion =  1 - (Double(actionSec) / timesDescription)
            
            let progressViewWidthProportion = Double(cell.frame.size.width) * proportion
            
            cell.progressView.frame.size.width = CGFloat(progressViewWidthProportion)
            actionAnimatorWidth = UIViewPropertyAnimator(duration: TimeInterval(actionSec), curve: .easeIn) {
                cell.progressView.frame.size.width = cell.frame.size.width
                
            }
        }
        
        actionAnimatorWidth.startAnimation()
        playcontrolPauseImage()
    }
    
    func restViewWidthAnimate(cell: ActionViewCell?) {
        
        if Int(actionLists[nowIndex].restTime) == restSec {
            
            let indexPath = IndexPath(row: nowIndex, section: 0)
            guard let cell = self.actionTableView.cellForRow(at: indexPath) as? ActionViewCell  else {return}
            cell.progressView.isHidden = false
            print(actionLists[nowIndex].timesDescription)
            cell.progressView.frame = cell.bounds
            cell.progressView.frame.size.width = 0
            cell.progressView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            
            restAnimatorWidth = UIViewPropertyAnimator(duration: actionLists[nowIndex].restTime, curve: .easeIn) {
                
                cell.progressView.frame.size.width = cell.frame.size.width
                
            }
            
        } else {
            
            guard let cell = cell  else {return}
            cell.progressView.isHidden = false
            cell.progressView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            
            let restTimesDescription = actionLists[nowIndex].restTime
            let proportion =  1 - (Double(restSec) / restTimesDescription)
            
            let progressViewWidthProportion: Double = Double(cell.frame.size.width) * proportion
            print(Double(cell.frame.size.width) * proportion)
            print(progressViewWidthProportion)
            
            cell.progressView.frame.size.width = CGFloat(progressViewWidthProportion)
            restAnimatorWidth = UIViewPropertyAnimator(duration: TimeInterval(restSec), curve: .easeIn) {
                
                cell.progressView.frame.size.width = cell.frame.size.width
                
            }
        }
        
        restAnimatorWidth.startAnimation()
        
    }
    
    // MARK: - ToScoreViewController downloadData
    
    func checkInternetFunction() -> Bool {
        
        if reachability?.currentReachabilityStatus().rawValue == 0 {
            
            return false
            
        } else {
            
            return true
            
        }
    }
    
    func downloadData() -> Bool {
        
        if checkInternetFunction() == true {
            
            connectView.isHidden = true
            return true
            
        } else {
            
            downloadDataViewFalse()
            return false
            
        }
        
    }
    
    func downloadDataViewFalse() {
        
        connectView.isHidden = false
        animationView = AnimationView(name: "green_circle")
        reconnectBtn.cornerRadius = 25
        animationView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        animationView.center = CGPoint(x: self.view.center.x, y: self.view.center.y-120)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        
        if self.connectView.subviews.count == 3 {
            
            self.connectView.addSubview(animationView)
            
        }
        
    }
    
    @IBAction func reconnectBtnWasPressed(_ sender: UIButton) {
        
        downloadData()
        
    }
    
    func contentHeightChang() {
        
        let indexPath = IndexPath(row: nowIndex, section: 0)
        guard let cell = self.actionTableView.cellForRow(at: indexPath) as? ActionViewCell  else {return}
        let contentInsetHeight = Int(actionTableView.frame.height - cell.frame.height)
        if contentInsetNumber < contentInsetHeight {
            
            contentInsetNumber += contentInsetHeight
            actionTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: CGFloat(contentInsetNumber), right: 0)
            
        }
        
        self.actionTableView.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.top, animated: true)
        
    }
    
    // MARK: - moreThanNowIndex and lessThanNowIndex
    
    func moreThanNowIndex(indexPath: IndexPath) {
        
        guard videoView.playerState == .Playing else {return}
        
        for cellrow in 0 ..< indexPath.row {
            
            actionLists[cellrow].cellStatus = .played
            
            let moreindexPath = IndexPath(row: cellrow, section: 0)
            
           if actionTableView.isCellVisible(indexSection: 0, indexRow: cellrow) == true {

                actionTableView.reloadRows(at: [moreindexPath], with: .right)

            }
        }
        
        nowIndex = indexPath.row
        
        actionSec = Int(actionLists[nowIndex].timesDescription)
        
        if actionTimer != nil {
            actionTimer?.invalidate()
        }
        
        if actionTimer != nil {
            restTimer?.invalidate()
        }
        
        self.actionTimer = Timer.scheduledTimer(timeInterval: 1,
                                                target: self,
                                                selector: #selector(self.actionCountDown),
                                                userInfo: nil, repeats: true)
        
        renewVideo()
        contentHeightChang()
        actionViewWidthAnimate(cell: nil)
        
    }
    
    func lessThanNowIndex(indexPath: IndexPath) {
        
        guard videoView.playerState == .Playing else {return}
        for cell in indexPath.row ... nowIndex {
            
            actionLists[cell].cellStatus = .willplay
            
        }
        
        actionLists[nowIndex].firstPlayRest = true
        actionLists[nowIndex].firstPlayAction = true
        actionLists[nowIndex].actionCellDidInvisiable = false
        actionLists[nowIndex].restCellDidInvisiable = false
        
        nowIndex = indexPath.row
        
        actionTableView.reloadData()
        
        if actionTimer != nil {
            actionTimer?.invalidate()
        }
        
        if actionTimer != nil {
            restTimer?.invalidate()
        }
        
        self.actionTimer = Timer.scheduledTimer(timeInterval: 1,
                                                target: self,
                                                selector: #selector(self.actionCountDown),
                                                userInfo: nil, repeats: true)
        
        renewVideo()
        
        actionSec = Int(actionLists[nowIndex].timesDescription)
        contentHeightChang()
        actionViewWidthAnimate(cell: nil)
    }
    
}

// MARK: - UITableViewDelegate

extension ActionViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == nowIndex {
            
            if actionLists[nowIndex].playingOrPause == .playing {
                
                videoView.pause()
                
            } else {
                
                videoView.play()
                
            }
            
        } else if indexPath.row > nowIndex {
            
            moreThanNowIndex(indexPath: indexPath)
            
        } else if indexPath.row < nowIndex {
            
            lessThanNowIndex(indexPath: indexPath)
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let cellStatus = actionLists[indexPath.row].cellStatus
        let actionOrRest = actionLists[indexPath.row].actionOrRest
        
        guard let playingCell = cell as? ActionViewCell else { return }
        
        if cellStatus == .playing  && actionOrRest == .action && videoView.playerState == .Playing {
            
            actionViewWidthAnimate(cell: playingCell)
            
        } else if cellStatus == .playing && actionOrRest == .rest && videoView.playerState == .Playing {
            
            restViewWidthAnimate(cell: playingCell)
            
        }
    }
    
}

// MARK: - UITableViewDataSource

extension ActionViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return actionLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = actionTableView.dequeueReusableCell(withIdentifier: cellIdenfifier) as? ActionViewCell {
            
            cell.selectionStyle = .none
            
            let cellStatus = actionLists[indexPath.row].cellStatus
            let actionOrRest = actionLists[indexPath.row].actionOrRest
            
            if cellStatus == .playing  && actionOrRest == .action && videoView.playerState == .Playing {
                if actionTimer == nil {
                    self.actionTimer = Timer.scheduledTimer(timeInterval: 1,
                                                            target: self,
                                                            selector: #selector(self.actionCountDown),
                                                            userInfo: nil, repeats: true)
                }
                
                actionViewWidthAnimate(cell: nil)
                cell.timeDescription.text = String(actionSec)
                cell.actionDescription.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                cell.actionDescription.text = actionLists[nowIndex].actionDescription
                
            } else if cellStatus == .playing && actionOrRest == .action && videoView.playerState == .Paused {
                
                let actionTimesDescription = actionLists[nowIndex].timesDescription
                let proportion =  1 - (Double(actionSec) / actionTimesDescription)
                let progressViewWidthProportion = Double(cell.frame.size.width) * proportion
                cell.progressView.frame.size.width = CGFloat(progressViewWidthProportion)
                cell.progressView.isHidden = false
                cell.progressView.backgroundColor = #colorLiteral(red: 0, green: 0.6980392157, blue: 0.3058823529, alpha: 1)
                cell.timeDescription.text = "\(actionSec)"
                cell.actionDescription.text = actionLists[nowIndex].actionDescription
                actionLists[nowIndex].actionCellDidInvisiable = true
                cell.actionDescription.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                
            } else if cellStatus == .playing && actionOrRest == .rest && videoView.playerState == .Playing {
                
                cell.timeDescription.text = String(restSec)
                cell.actionDescription.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                
            } else if cellStatus == .playing && actionOrRest == .rest && videoView.playerState == .Paused {
                
                cell.progressView.isHidden = false
                let restTimesDescription = actionLists[nowIndex].restTime
                let proportion =  1 - (Double(restSec) / restTimesDescription)
                let progressViewWidthProportion = Double(cell.frame.size.width) * proportion
                cell.progressView.frame.size.width = CGFloat(progressViewWidthProportion)
                cell.progressView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                cell.timeDescription.text = "\(restSec)"
                cell.actionDescription.text = "休息时间"
                actionLists[nowIndex].restCellDidInvisiable = true
                cell.actionDescription.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                
            } else if cellStatus == .played {
                
                cell.progressView.isHidden = false
                cell.progressView.frame.size.width = cell.frame.size.width
                cell.timeDescription.text = "✓"
                cell.actionDescription.text = actionLists[indexPath.row].actionDescription
                cell.progressView.backgroundColor = #colorLiteral(red: 0.1529411765, green: 0.1529411765, blue: 0.1529411765, alpha: 1)
                cell.actionDescription.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                
            } else if cellStatus == .willplay {
                
                cell.actionDescription.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                let actionlistIndexRow = actionLists[indexPath.row]
                //cell.updateView(actionModel: <#T##ActionViewCellModel#>)
                cell.updateView(actionModel: ActionViewCellModel(actionModel: actionlistIndexRow))
                //cell.updateView(actionModel: ActionViewCellModel(actionModel: actionlistIndexRow))
                
            } else {
                
            }
            
            return cell
            
        } else {
            
            return ActionViewCell()
        }
    }
    
    // MARK: - YouTubePlayerStatusfunction
    func firstTimePlay() {
        
        self.actionTimer = Timer.scheduledTimer(timeInterval: 1,
                                                target: self,
                                                selector: #selector(self.actionCountDown),
                                                userInfo: nil, repeats: true)
        renewVideo()
        
        actionSec = Int(actionLists[nowIndex].timesDescription)
        
        actionViewWidthAnimate(cell: nil)
        
        firstTimeplay = false
        
    }
    
    func playerPlaying() {
        
        let indexPath = IndexPath(row: nowIndex, section: 0)
        let cell = actionTableView.cellForRow(at: indexPath) as? ActionViewCell
        
        actionLists[nowIndex].playingOrPause = .playing
        
        if firstTimeplay == true {
            
            firstTimePlay()
        }
        
        if actionTimer?.isValid == false && actionTimerjustStop == true {
            
            actionTimerjustStop = false
            
            self.actionTimer = Timer.scheduledTimer(timeInterval: 1,
                                                    target: self,
                                                    selector: #selector(self.actionCountDown),
                                                    userInfo: nil, repeats: true)
            
            if actionLists[nowIndex].actionCellDidInvisiable == true {
                
                actionViewWidthAnimate(cell: cell)
                
            } else {
                
                actionAnimatorWidth.startAnimation()
                playcontrolPauseImage()
                
            }
            
        } else if restTimer?.isValid == false && restTimerjustStop == true {
            
            restTimerjustStop = false
            
            self.restTimer = Timer.scheduledTimer(timeInterval: 1,
                                                  target: self,
                                                  selector: #selector(self.restCountDown),
                                                  userInfo: nil, repeats: true)
            
            if actionLists[nowIndex].restCellDidInvisiable == true {
                restViewWidthAnimate(cell: cell)
            } else {
                
                restAnimatorWidth.startAnimation()
            }
            
        }
    }
    
    func playerPaused() {
        
        actionLists[nowIndex].playingOrPause = .pause
        
        let index = IndexPath(row: nowIndex, section: 0)
        
        guard let cell = actionTableView.cellForRow(at: index) as? ActionViewCell else {return}
        
        if actionTimer?.isValid == true {
            
            actionTimerjustStop = true
            
            actionTimer?.invalidate()
            
            actionAnimatorWidth.pauseAnimation()
            playcontrolPlayImage()
            
            cell.progressView.isHidden = false
            
        } else if restTimer?.isValid == true {
            
            restTimerjustStop = true
            
            restTimer?.invalidate()
            
            restAnimatorWidth.pauseAnimation()
            
            cell.progressView.isHidden = false
            
        }
    }
    
}

// MARK: - YouTubePlayerDelegate

extension ActionViewController: YouTubePlayerDelegate {
    
    func playerStateChanged(_ videoPlayer: YouTubePlayerView, playerState: YouTubePlayerState) {
        
        if playerState == .Playing {
            playerPlaying()
        }
        
        if playerState == .Buffering {
            
            videoPlayer.pause()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                videoPlayer.play()
            }
        }
        
        if playerState == .Queued {
            
        }
        
        if playerState == .Paused {
            playerPaused()
        }
    }
    
    func playerQualityChanged(_ videoPlayer: YouTubePlayerView, playbackQuality: YouTubePlaybackQuality) {}
    
    func playerReady(_ videoPlayer: YouTubePlayerView) {
        
        activityIndicator.isHidden = true
        let floatYoutubeTime = Float(actionLists[nowIndex].youtubeTime)
        videoPlayer.seekTo(floatYoutubeTime, seekAhead: true)
        
    }
    
}
