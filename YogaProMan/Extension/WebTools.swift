import Foundation
import UIKit
import WebKit

let titleBarColoryoprma:UIColor = .white
let bottomBarColoryoprma:UIColor = .white
let titleFontyoprma:UIFont = UIFont.boldSystemFont(ofSize: CGFloat(18))
let titleTextColoryoprma:UIColor = .black
let windowMaskColoryoprma:UIColor = UIColor(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 0.75)
let btnBackgroundColoryoprma:UIColor = .white
let btnOnLineColoryoprma:UIColor = UIColor(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 0.68)
//let btnOnLineColoryoprma:UIColor = .init(red: 230/255, green: 57/255, blue: 70/255, alpha: 1.0)
let btnOffLineColoryoprma:UIColor = .lightGray

class PrivacyLoadViewControllerNccet: UIViewController, WKNavigationDelegate {
    
    var wkWebViewyoprma:WKWebView!
    var backBtnyoprma:UIButton!
    var forwardBtnyoprma:UIButton!
    var titleDesc:String = " "
    var isInityoprma = false
    var multiUrl:[String] = [String]()
    var backUrlyoprma:String?
    var callbackyoprma: (() -> Void)?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(titleyoprma:String, urlsyoprma:[String]?) {
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        
        if (titleyoprma == "" || titleyoprma.count <= 0) {
            titleDesc = " "
        } else if (titleyoprma == "fjkj2986bhjgfyunr8476nfmoi1qpogk9") {
            titleDesc = ""
        } else {
            titleDesc = titleyoprma
        }
        if (urlsyoprma != nil) {
            multiUrl = urlsyoprma!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainViewyoprma = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.view.addSubview(mainViewyoprma)
        mainViewyoprma.translatesAutoresizingMaskIntoConstraints = false
        mainViewyoprma.backgroundColor = windowMaskColoryoprma
        
        let leftViewyoprma = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        mainViewyoprma.addSubview(leftViewyoprma)
        leftViewyoprma.translatesAutoresizingMaskIntoConstraints = false
        leftViewyoprma.backgroundColor = UIColor.clear
        
        let rightViewyoprma = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        mainViewyoprma.addSubview(rightViewyoprma)
        rightViewyoprma.translatesAutoresizingMaskIntoConstraints = false
        rightViewyoprma.backgroundColor = UIColor.clear
        
        let topViewyoprma = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        mainViewyoprma.addSubview(topViewyoprma)
        topViewyoprma.translatesAutoresizingMaskIntoConstraints = false
        topViewyoprma.backgroundColor = UIColor.clear
        
        let bottmViewyoprma = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        mainViewyoprma.addSubview(bottmViewyoprma)
        bottmViewyoprma.translatesAutoresizingMaskIntoConstraints = false
        bottmViewyoprma.backgroundColor = UIColor.clear
        
        let titleViewyoprma = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        mainViewyoprma.addSubview(titleViewyoprma)
        titleViewyoprma.translatesAutoresizingMaskIntoConstraints = false
        titleViewyoprma.clipsToBounds = true
        titleViewyoprma.backgroundColor = titleBarColoryoprma
        
        let toolsViewyoprma = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        mainViewyoprma.addSubview(toolsViewyoprma)
        toolsViewyoprma.translatesAutoresizingMaskIntoConstraints = false
        toolsViewyoprma.backgroundColor = bottomBarColoryoprma
        
        wkWebViewyoprma = WKWebView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        mainViewyoprma.addSubview(wkWebViewyoprma)
        wkWebViewyoprma.translatesAutoresizingMaskIntoConstraints = false
        wkWebViewyoprma.backgroundColor = UIColor.groupTableViewBackground
        
        let titleLabelyoprma = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        titleViewyoprma.addSubview(titleLabelyoprma)
        titleLabelyoprma.translatesAutoresizingMaskIntoConstraints = false
        titleLabelyoprma.numberOfLines = 1
        titleLabelyoprma.backgroundColor = UIColor.clear
        titleLabelyoprma.font = titleFontyoprma
        titleLabelyoprma.textAlignment = NSTextAlignment.center
        
        let homeBtnyoprma = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        toolsViewyoprma.addSubview(homeBtnyoprma)
        homeBtnyoprma.translatesAutoresizingMaskIntoConstraints = false
        homeBtnyoprma.backgroundColor = btnBackgroundColoryoprma
        
        homeBtnyoprma.imageView?.contentMode = .scaleAspectFit
        homeBtnyoprma.setContentHuggingPriority(UILayoutPriority(rawValue: 100), for: NSLayoutConstraint.Axis.vertical)
        homeBtnyoprma.setContentHuggingPriority(UILayoutPriority(rawValue: 100), for: NSLayoutConstraint.Axis.horizontal)
        homeBtnyoprma.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 50), for: NSLayoutConstraint.Axis.vertical)
        homeBtnyoprma.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 50), for: NSLayoutConstraint.Axis.horizontal)
        
        homeBtnyoprma.imageView?.contentMode = .scaleAspectFit
        homeBtnyoprma.setImage(getNaviHomeLineImageyoprma(yoprmax: nil, yoprmay: nil, yoprmaz: nil, imageSizeyoprma: 100, arrowStrokeWidthyoprma: 8, arrowColoryoprma: btnOnLineColoryoprma, backgroundColoryoprma: .clear), for: UIControl.State.normal)
        homeBtnyoprma.setImage(getNaviHomeLineImageyoprma(yoprmax: nil, yoprmay: nil, yoprmaz: nil, imageSizeyoprma: 100, arrowStrokeWidthyoprma: 8, arrowColoryoprma: btnOffLineColoryoprma, backgroundColoryoprma: .clear), for: UIControl.State.highlighted)
        
        backBtnyoprma = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        toolsViewyoprma.addSubview(backBtnyoprma)
        backBtnyoprma.translatesAutoresizingMaskIntoConstraints = false
        backBtnyoprma.backgroundColor = btnBackgroundColoryoprma
        
        backBtnyoprma.imageView?.contentMode = .scaleAspectFit
        backBtnyoprma.setContentHuggingPriority(UILayoutPriority(rawValue: 100), for: NSLayoutConstraint.Axis.vertical)
        backBtnyoprma.setContentHuggingPriority(UILayoutPriority(rawValue: 100), for: NSLayoutConstraint.Axis.horizontal)
        backBtnyoprma.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 50), for: NSLayoutConstraint.Axis.vertical)
        backBtnyoprma.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 50), for: NSLayoutConstraint.Axis.horizontal)
        
        backBtnyoprma.imageView?.contentMode = .scaleAspectFit
        backBtnyoprma.setImage(getNaviBackLineImageyoprma(yoprmax: nil, yoprmay: nil, yoprmaz: nil, imageSizeyoprma: 100, arrowStrokeWidthyoprma: 8, arrowColoryoprma: btnOnLineColoryoprma, backgroundColoryoprma: .clear), for: UIControl.State.normal)
        backBtnyoprma.setImage(getNaviBackLineImageyoprma(yoprmax: nil, yoprmay: nil, yoprmaz: nil, imageSizeyoprma: 100, arrowStrokeWidthyoprma: 8, arrowColoryoprma: btnOffLineColoryoprma, backgroundColoryoprma: .clear), for: UIControl.State.highlighted)
        
        forwardBtnyoprma = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        toolsViewyoprma.addSubview(forwardBtnyoprma)
        forwardBtnyoprma.translatesAutoresizingMaskIntoConstraints = false
        forwardBtnyoprma.backgroundColor = btnBackgroundColoryoprma
        
        forwardBtnyoprma.imageView?.contentMode = .scaleAspectFit
        forwardBtnyoprma.setContentHuggingPriority(UILayoutPriority(rawValue: 100), for: NSLayoutConstraint.Axis.vertical)
        forwardBtnyoprma.setContentHuggingPriority(UILayoutPriority(rawValue: 100), for: NSLayoutConstraint.Axis.horizontal)
        forwardBtnyoprma.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 50), for: NSLayoutConstraint.Axis.vertical)
        forwardBtnyoprma.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 50), for: NSLayoutConstraint.Axis.horizontal)
        
        forwardBtnyoprma.imageView?.contentMode = .scaleAspectFit
        forwardBtnyoprma.setImage(getNaviForwardLineImageyoprma(yoprmax: nil, yoprmay: nil, yoprmaz: nil, imageSizeyoprma: 100, arrowStrokeWidthyoprma: 8, arrowColoryoprma: btnOnLineColoryoprma, backgroundColoryoprma: .clear), for: UIControl.State.normal)
        forwardBtnyoprma.setImage(getNaviForwardLineImageyoprma(yoprmax: nil, yoprmay: nil, yoprmaz: nil, imageSizeyoprma: 100, arrowStrokeWidthyoprma: 8, arrowColoryoprma: btnOffLineColoryoprma, backgroundColoryoprma: .clear), for: UIControl.State.highlighted)
        
        
        let refreshBtnyoprma = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        toolsViewyoprma.addSubview(refreshBtnyoprma)
        refreshBtnyoprma.translatesAutoresizingMaskIntoConstraints = false
        refreshBtnyoprma.backgroundColor = btnBackgroundColoryoprma
        
        refreshBtnyoprma.imageView?.contentMode = .scaleAspectFit
        refreshBtnyoprma.setContentHuggingPriority(UILayoutPriority(rawValue: 100), for: NSLayoutConstraint.Axis.vertical)
        refreshBtnyoprma.setContentHuggingPriority(UILayoutPriority(rawValue: 100), for: NSLayoutConstraint.Axis.horizontal)
        refreshBtnyoprma.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 50), for: NSLayoutConstraint.Axis.vertical)
        refreshBtnyoprma.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 50), for: NSLayoutConstraint.Axis.horizontal)
        
        refreshBtnyoprma.imageView?.contentMode = .scaleAspectFit
        refreshBtnyoprma.setImage(getNaviRefreshLineImageyoprma(yoprmax: nil, yoprmay: nil, yoprmaz: nil, imageSizeyoprma: 100, arrowStrokeWidthyoprma: 8, arrowColoryoprma: btnOnLineColoryoprma, backgroundColoryoprma: .clear), for: UIControl.State.normal)
        refreshBtnyoprma.setImage(getNaviRefreshLineImageyoprma(yoprmax: nil, yoprmay: nil, yoprmaz: nil, imageSizeyoprma: 100, arrowStrokeWidthyoprma: 8, arrowColoryoprma: btnOffLineColoryoprma, backgroundColoryoprma: .clear), for: UIControl.State.highlighted)
        
        
        let exitBtnyoprma = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        toolsViewyoprma.addSubview(exitBtnyoprma)
        exitBtnyoprma.translatesAutoresizingMaskIntoConstraints = false
        exitBtnyoprma.backgroundColor = btnBackgroundColoryoprma
        
        exitBtnyoprma.imageView?.contentMode = .scaleAspectFit
        exitBtnyoprma.setContentHuggingPriority(UILayoutPriority(rawValue: 100), for: NSLayoutConstraint.Axis.vertical)
        exitBtnyoprma.setContentHuggingPriority(UILayoutPriority(rawValue: 100), for: NSLayoutConstraint.Axis.horizontal)
        exitBtnyoprma.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 50), for: NSLayoutConstraint.Axis.vertical)
        exitBtnyoprma.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 50), for: NSLayoutConstraint.Axis.horizontal)
        
        exitBtnyoprma.imageView?.contentMode = .scaleAspectFit
        exitBtnyoprma.setImage(getNaviExitLineImageyoprma(yoprmax: nil, yoprmay: nil, yoprmaz: nil, imageSizeyoprma: 100, arrowStrokeWidthyoprma: 8, arrowColoryoprma: btnOnLineColoryoprma, backgroundColoryoprma: .clear), for: UIControl.State.normal)
        exitBtnyoprma.setImage(getNaviExitLineImageyoprma(yoprmax: nil, yoprmay: nil, yoprmaz: nil, imageSizeyoprma: 100, arrowStrokeWidthyoprma: 8, arrowColoryoprma: btnOffLineColoryoprma, backgroundColoryoprma: .clear), for: UIControl.State.highlighted)
        
        let linview = UIView()
        linview.backgroundColor = .lightGray
        toolsViewyoprma.addSubview(linview)
        linview.translatesAutoresizingMaskIntoConstraints = false
        linview.topAnchor.constraint(equalTo: toolsViewyoprma.topAnchor).isActive = true
        linview.leadingAnchor.constraint(equalTo: toolsViewyoprma.leadingAnchor).isActive = true
        linview.trailingAnchor.constraint(equalTo: toolsViewyoprma.trailingAnchor).isActive = true
        linview.bottomAnchor.constraint(equalTo: toolsViewyoprma.topAnchor, constant: 0.3).isActive = true
        
//        let closeBtnyoprma = UIView()
        
        let closeBtnyoprma = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        
        toolsViewyoprma.addSubview(closeBtnyoprma)
        closeBtnyoprma.translatesAutoresizingMaskIntoConstraints = false
        closeBtnyoprma.backgroundColor = UIColor.groupTableViewBackground
        
        let separatorView = UIView()
        closeBtnyoprma.addSubview(separatorView)
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.topAnchor.constraint(equalTo: closeBtnyoprma.topAnchor).isActive = true
        separatorView.leadingAnchor.constraint(equalTo: closeBtnyoprma.leadingAnchor).isActive = true
        separatorView.trailingAnchor.constraint(equalTo: closeBtnyoprma.trailingAnchor).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 0.3).isActive = true
        separatorView.backgroundColor = UIColor(displayP3Red: 13/255, green: 13/255, blue: 13/255, alpha: 1.0)
        
        let checkBoxButton = UIButton()
        checkBoxButton.isUserInteractionEnabled = false
        checkBoxButton.setImage(UIImage(named: "in_uncheck"), for: .normal)
        checkBoxButton.setImage(UIImage(named: "in_check"), for: .selected)
        closeBtnyoprma.addSubview(checkBoxButton)
        checkBoxButton.translatesAutoresizingMaskIntoConstraints = false
        checkBoxButton.leadingAnchor.constraint(equalTo: closeBtnyoprma.leadingAnchor, constant: 16).isActive = true
        checkBoxButton.centerYAnchor.constraint(equalTo: closeBtnyoprma.centerYAnchor).isActive = true
        checkBoxButton.heightAnchor.constraint(equalToConstant: 22).isActive = true
        checkBoxButton.widthAnchor.constraint(equalToConstant: 22).isActive = true
        
        let desLabel = UILabel()
        desLabel.text = "同意隐私权条款政策"
        desLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 16)
        desLabel.adjustsFontSizeToFitWidth = true
        closeBtnyoprma.addSubview(desLabel)
        desLabel.translatesAutoresizingMaskIntoConstraints = false
        desLabel.leadingAnchor.constraint(equalTo: checkBoxButton.trailingAnchor, constant: 8).isActive = true
        desLabel.trailingAnchor.constraint(equalTo: closeBtnyoprma.trailingAnchor, constant: -16).isActive = true
        desLabel.centerYAnchor.constraint(equalTo: closeBtnyoprma.centerYAnchor).isActive = true
        
        let titleLabelHeightyoprma = NSLayoutConstraint(item: titleLabelyoprma,
                                                        attribute: .height,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .notAnAttribute,
                                                        multiplier: 1.0,
                                                        constant: 21.0)
        titleLabelHeightyoprma.priority = UILayoutPriority(rawValue: 249)
        titleLabelyoprma.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: NSLayoutConstraint.Axis.vertical)
        titleLabelyoprma.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 750), for: NSLayoutConstraint.Axis.vertical)
        
        titleLabelyoprma.setContentHuggingPriority(UILayoutPriority(rawValue: 50), for: NSLayoutConstraint.Axis.horizontal)
        titleLabelyoprma.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 50), for: NSLayoutConstraint.Axis.horizontal)
        
        titleLabelyoprma.addConstraint(titleLabelHeightyoprma)
        
        
        titleViewyoprma.addConstraints([NSLayoutConstraint(item: titleLabelyoprma,
                                                           attribute: NSLayoutConstraint.Attribute.centerY,
                                                           relatedBy: .equal,
                                                           toItem: titleViewyoprma,
                                                           attribute: .centerY,
                                                           multiplier: 1.0,
                                                           constant: 0.0),
                                        NSLayoutConstraint(item: titleLabelyoprma,
                                                           attribute: .trailing,
                                                           relatedBy: .equal,
                                                           toItem: titleViewyoprma,
                                                           attribute: .trailing,
                                                           multiplier: 1.0,
                                                           constant: 0.0),
                                        NSLayoutConstraint(item: titleLabelyoprma,
                                                           attribute: .leading,
                                                           relatedBy: .equal,
                                                           toItem: titleViewyoprma,
                                                           attribute: .leading,
                                                           multiplier: 1.0,
                                                           constant: 0.0),
                                        NSLayoutConstraint(item: titleLabelyoprma,
                                                           attribute: .height,
                                                           relatedBy: .equal,
                                                           toItem: titleViewyoprma,
                                                           attribute: .height,
                                                           multiplier: 0.5,
                                                           constant: 0.0)])
        
        self.view.addConstraints([NSLayoutConstraint(item: mainViewyoprma,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: self.view,
                                                     attribute: .leading,
                                                     multiplier: 1.0,
                                                     constant: 0.0),
                                  NSLayoutConstraint(item: mainViewyoprma,
                                                     attribute: .top,
                                                     relatedBy: .equal,
                                                     toItem: self.topLayoutGuide,
                                                     attribute: .bottom,
                                                     multiplier: 1.0,
                                                     constant: 0.0),
                                  NSLayoutConstraint(item: mainViewyoprma,
                                                     attribute: .trailing,
                                                     relatedBy: .equal,
                                                     toItem: self.view,
                                                     attribute: .trailing,
                                                     multiplier: 1.0,
                                                     constant: 0.0),
                                  NSLayoutConstraint(item: mainViewyoprma,
                                                     attribute: .bottom,
                                                     relatedBy: .equal,
                                                     toItem: self.bottomLayoutGuide,
                                                     attribute: .top,
                                                     multiplier: 1.0,
                                                     constant: 0.0)])
        
        mainViewyoprma.addConstraints([NSLayoutConstraint(item: leftViewyoprma,
                                                          attribute: .leading,
                                                          relatedBy: .equal,
                                                          toItem: mainViewyoprma,
                                                          attribute: .leading,
                                                          multiplier: 1.0,
                                                          constant: 0.0),
                                       NSLayoutConstraint(item: leftViewyoprma,
                                                          attribute: .top,
                                                          relatedBy: .equal,
                                                          toItem: mainViewyoprma,
                                                          attribute: .top,
                                                          multiplier: 1.0,
                                                          constant: 0.0),
                                       NSLayoutConstraint(item: leftViewyoprma,
                                                          attribute: .bottom,
                                                          relatedBy: .equal,
                                                          toItem: mainViewyoprma,
                                                          attribute: .bottom,
                                                          multiplier: 1.0,
                                                          constant: 0.0),
                                       NSLayoutConstraint(item: leftViewyoprma,
                                                          attribute: .trailing,
                                                          relatedBy: .equal,
                                                          toItem: bottmViewyoprma,
                                                          attribute: .leading,
                                                          multiplier: 1.0,
                                                          constant: 0.0),
                                       NSLayoutConstraint(item: leftViewyoprma,
                                                          attribute: .trailing,
                                                          relatedBy: .equal,
                                                          toItem: toolsViewyoprma,
                                                          attribute: .leading,
                                                          multiplier: 1.0,
                                                          constant: 0.0),
                                       NSLayoutConstraint(item: leftViewyoprma,
                                                          attribute: .trailing,
                                                          relatedBy: .equal,
                                                          toItem: wkWebViewyoprma,
                                                          attribute: .leading,
                                                          multiplier: 1.0,
                                                          constant: 0.0),
                                       NSLayoutConstraint(item: leftViewyoprma,
                                                          attribute: .trailing,
                                                          relatedBy: .equal,
                                                          toItem: titleViewyoprma,
                                                          attribute: .leading,
                                                          multiplier: 1.0,
                                                          constant: 0.0),
                                       NSLayoutConstraint(item: leftViewyoprma,
                                                          attribute: .trailing,
                                                          relatedBy: .equal,
                                                          toItem: topViewyoprma,
                                                          attribute: .leading,
                                                          multiplier: 1.0,
                                                          constant: 0.0),
                                       NSLayoutConstraint(item: leftViewyoprma, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: titleViewyoprma, attribute: NSLayoutConstraint.Attribute.height, multiplier: 0.5, constant: 0),
                                       NSLayoutConstraint(item: rightViewyoprma,
                                                          attribute: .trailing,
                                                          relatedBy: .equal,
                                                          toItem: mainViewyoprma,
                                                          attribute: .trailing,
                                                          multiplier: 1.0,
                                                          constant: 0.0),
                                       NSLayoutConstraint(item: rightViewyoprma,
                                                          attribute: .bottom,
                                                          relatedBy: .equal,
                                                          toItem: mainViewyoprma,
                                                          attribute: .bottom,
                                                          multiplier: 1.0,
                                                          constant: 0.0),
                                       NSLayoutConstraint(item: rightViewyoprma,
                                                          attribute: .top,
                                                          relatedBy: .equal,
                                                          toItem: mainViewyoprma,
                                                          attribute: .top,
                                                          multiplier: 1.0,
                                                          constant: 0.0),
                                       NSLayoutConstraint(item: rightViewyoprma,
                                                          attribute: .leading,
                                                          relatedBy: .equal,
                                                          toItem: bottmViewyoprma,
                                                          attribute: .trailing,
                                                          multiplier: 1.0,
                                                          constant: 0.0),
                                       NSLayoutConstraint(item: rightViewyoprma,
                                                          attribute: .leading,
                                                          relatedBy: .equal,
                                                          toItem: topViewyoprma,
                                                          attribute: .trailing,
                                                          multiplier: 1.0,
                                                          constant: 0.0),
                                       NSLayoutConstraint(item: rightViewyoprma,
                                                          attribute: .leading,
                                                          relatedBy: .equal,
                                                          toItem: toolsViewyoprma,
                                                          attribute: .trailing,
                                                          multiplier: 1.0,
                                                          constant: 0.0),
                                       NSLayoutConstraint(item: rightViewyoprma,
                                                          attribute: .leading,
                                                          relatedBy: .equal,
                                                          toItem: titleViewyoprma,
                                                          attribute: .trailing,
                                                          multiplier: 1.0,
                                                          constant: 0.0),
                                       NSLayoutConstraint(item: rightViewyoprma,
                                                          attribute: .leading,
                                                          relatedBy: .equal,
                                                          toItem: wkWebViewyoprma,
                                                          attribute: .trailing,
                                                          multiplier: 1.0,
                                                          constant: 0.0),
                                       NSLayoutConstraint(item: rightViewyoprma, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: titleViewyoprma, attribute: NSLayoutConstraint.Attribute.height, multiplier: 0.5, constant: 0),
                                       NSLayoutConstraint(item: topViewyoprma,
                                                          attribute: .top,
                                                          relatedBy: .equal,
                                                          toItem: mainViewyoprma,
                                                          attribute: .top,
                                                          multiplier: 1.0,
                                                          constant: 0.0),
                                       NSLayoutConstraint(item: topViewyoprma,
                                                          attribute: .bottom,
                                                          relatedBy: .equal,
                                                          toItem: titleViewyoprma,
                                                          attribute: .top,
                                                          multiplier: 1.0,
                                                          constant: 0.0),
                                       NSLayoutConstraint(item: topViewyoprma, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: titleViewyoprma, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1.5, constant: 0),
                                       NSLayoutConstraint(item: bottmViewyoprma,
                                                          attribute: .bottom,
                                                          relatedBy: .equal,
                                                          toItem: mainViewyoprma,
                                                          attribute: .bottom,
                                                          multiplier: 1.0,
                                                          constant: 0.0),
                                       NSLayoutConstraint(item: bottmViewyoprma,
                                                          attribute: .top,
                                                          relatedBy: .equal,
                                                          toItem: toolsViewyoprma,
                                                          attribute: .bottom,
                                                          multiplier: 1.0,
                                                          constant: 0.0),
                                       NSLayoutConstraint(item: bottmViewyoprma, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: titleViewyoprma, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1.5, constant: 0),
                                       NSLayoutConstraint(item: titleViewyoprma,
                                                          attribute: .bottom,
                                                          relatedBy: .equal,
                                                          toItem: wkWebViewyoprma,
                                                          attribute: .top,
                                                          multiplier: 1.0,
                                                          constant: 0.0),
                                       NSLayoutConstraint(item: toolsViewyoprma,
                                                          attribute: .top,
                                                          relatedBy: .equal,
                                                          toItem: wkWebViewyoprma,
                                                          attribute: .bottom,
                                                          multiplier: 1.0,
                                                          constant: 0.0)])
        
        
        
        toolsViewyoprma.addConstraints([NSLayoutConstraint(item: closeBtnyoprma,
                                                           attribute: .leading,
                                                           relatedBy: .equal,
                                                           toItem: toolsViewyoprma,
                                                           attribute: .leading,
                                                           multiplier: 1.0,
                                                           constant: 0.0),
                                        NSLayoutConstraint(item: closeBtnyoprma,
                                                           attribute: .top,
                                                           relatedBy: .equal,
                                                           toItem: toolsViewyoprma,
                                                           attribute: .top,
                                                           multiplier: 1.0,
                                                           constant: 0.0),
                                        NSLayoutConstraint(item: closeBtnyoprma,
                                                           attribute: .trailing,
                                                           relatedBy: .equal,
                                                           toItem: toolsViewyoprma,
                                                           attribute: .trailing,
                                                           multiplier: 1.0,
                                                           constant: 0.0),
                                        NSLayoutConstraint(item: closeBtnyoprma,
                                                           attribute: .bottom,
                                                           relatedBy: .equal,
                                                           toItem: toolsViewyoprma,
                                                           attribute: .bottom,
                                                           multiplier: 1.0,
                                                           constant: 0.0),
                                        NSLayoutConstraint(item: toolsViewyoprma,
                                                           attribute: .height,
                                                           relatedBy: .equal,
                                                           toItem: nil,
                                                           attribute: .notAnAttribute,
                                                           multiplier: 1.0,
                                                           constant: 44.0),
                                        NSLayoutConstraint(item: homeBtnyoprma,
                                                           attribute: .leading,
                                                           relatedBy: .equal,
                                                           toItem: toolsViewyoprma,
                                                           attribute: .leading,
                                                           multiplier: 1.0,
                                                           constant: 5.0),
                                        NSLayoutConstraint(item: homeBtnyoprma,
                                                           attribute: .bottom,
                                                           relatedBy: .equal,
                                                           toItem: toolsViewyoprma,
                                                           attribute: .bottom,
                                                           multiplier: 1.0,
                                                           constant: -5.0),
                                        NSLayoutConstraint(item: homeBtnyoprma,
                                                           attribute: .top,
                                                           relatedBy: .equal,
                                                           toItem: toolsViewyoprma,
                                                           attribute: .top,
                                                           multiplier: 1.0,
                                                           constant: 5.0),
                                        NSLayoutConstraint(item: homeBtnyoprma,
                                                           attribute: .trailing,
                                                           relatedBy: .equal,
                                                           toItem: backBtnyoprma,
                                                           attribute: .leading,
                                                           multiplier: 1.0,
                                                           constant: -5.0),
                                        NSLayoutConstraint(item: homeBtnyoprma,
                                                           attribute: .width,
                                                           relatedBy: .equal,
                                                           toItem: backBtnyoprma,
                                                           attribute: .width,
                                                           multiplier: 1.0,
                                                           constant: 0.0),
                                        NSLayoutConstraint(item: homeBtnyoprma,
                                                           attribute: .width,
                                                           relatedBy: .equal,
                                                           toItem: forwardBtnyoprma,
                                                           attribute: .width,
                                                           multiplier: 1.0,
                                                           constant: 0.0),
                                        NSLayoutConstraint(item: homeBtnyoprma,
                                                           attribute: .width,
                                                           relatedBy: .equal,
                                                           toItem: refreshBtnyoprma,
                                                           attribute: .width,
                                                           multiplier: 1.0,
                                                           constant: 0.0),
                                        NSLayoutConstraint(item: homeBtnyoprma,
                                                           attribute: .width,
                                                           relatedBy: .equal,
                                                           toItem: exitBtnyoprma,
                                                           attribute: .width,
                                                           multiplier: 1.0,
                                                           constant: 0.0),
                                        NSLayoutConstraint(item: backBtnyoprma,
                                                           attribute: .bottom,
                                                           relatedBy: .equal,
                                                           toItem: toolsViewyoprma,
                                                           attribute: .bottom,
                                                           multiplier: 1.0,
                                                           constant: -5.0),
                                        NSLayoutConstraint(item: backBtnyoprma,
                                                           attribute: .top,
                                                           relatedBy: .equal,
                                                           toItem: toolsViewyoprma,
                                                           attribute: .top,
                                                           multiplier: 1.0,
                                                           constant: 5.0),
                                        NSLayoutConstraint(item: backBtnyoprma,
                                                           attribute: .trailing,
                                                           relatedBy: .equal,
                                                           toItem: forwardBtnyoprma,
                                                           attribute: .leading,
                                                           multiplier: 1.0,
                                                           constant: -5.0),
                                        NSLayoutConstraint(item: forwardBtnyoprma,
                                                           attribute: .bottom,
                                                           relatedBy: .equal,
                                                           toItem: toolsViewyoprma,
                                                           attribute: .bottom,
                                                           multiplier: 1.0,
                                                           constant: -5.0),
                                        NSLayoutConstraint(item: forwardBtnyoprma,
                                                           attribute: .top,
                                                           relatedBy: .equal,
                                                           toItem: toolsViewyoprma,
                                                           attribute: .top,
                                                           multiplier: 1.0,
                                                           constant: 5.0),
                                        NSLayoutConstraint(item: forwardBtnyoprma,
                                                           attribute: .trailing,
                                                           relatedBy: .equal,
                                                           toItem: refreshBtnyoprma,
                                                           attribute: .leading,
                                                           multiplier: 1.0,
                                                           constant: -5.0),
                                        NSLayoutConstraint(item: refreshBtnyoprma,
                                                           attribute: .bottom,
                                                           relatedBy: .equal,
                                                           toItem: toolsViewyoprma,
                                                           attribute: .bottom,
                                                           multiplier: 1.0,
                                                           constant: -5.0),
                                        NSLayoutConstraint(item: refreshBtnyoprma,
                                                           attribute: .top,
                                                           relatedBy: .equal,
                                                           toItem: toolsViewyoprma,
                                                           attribute: .top,
                                                           multiplier: 1.0,
                                                           constant: 5.0),
                                        NSLayoutConstraint(item: refreshBtnyoprma,
                                                           attribute: .trailing,
                                                           relatedBy: .equal,
                                                           toItem: exitBtnyoprma,
                                                           attribute: .leading,
                                                           multiplier: 1.0,
                                                           constant: -5.0),
                                        NSLayoutConstraint(item: exitBtnyoprma,
                                                           attribute: .bottom,
                                                           relatedBy: .equal,
                                                           toItem: toolsViewyoprma,
                                                           attribute: .bottom,
                                                           multiplier: 1.0,
                                                           constant: -5.0),
                                        NSLayoutConstraint(item: exitBtnyoprma,
                                                           attribute: .top,
                                                           relatedBy: .equal,
                                                           toItem: toolsViewyoprma,
                                                           attribute: .top,
                                                           multiplier: 1.0,
                                                           constant: 5.0),
                                        NSLayoutConstraint(item: exitBtnyoprma,
                                                           attribute: .trailing,
                                                           relatedBy: .equal,
                                                           toItem: toolsViewyoprma,
                                                           attribute: .trailing,
                                                           multiplier: 1.0,
                                                           constant: -5.0)])
        
        titleViewyoprma.backgroundColor = titleBarColoryoprma
        titleLabelyoprma.textColor = titleTextColoryoprma
        toolsViewyoprma.backgroundColor = bottomBarColoryoprma
        homeBtnyoprma.backgroundColor = btnBackgroundColoryoprma
        backBtnyoprma.backgroundColor = btnBackgroundColoryoprma
        forwardBtnyoprma.backgroundColor = btnBackgroundColoryoprma
        refreshBtnyoprma.backgroundColor = btnBackgroundColoryoprma
        exitBtnyoprma.backgroundColor = btnBackgroundColoryoprma
//        closeBtnyoprma.backgroundColor = titleBarColoryoprma
        
        titleLabelyoprma.text = titleDesc
        if (titleDesc.count != 0) { // close
            toolsViewyoprma.backgroundColor = titleBarColoryoprma
            closeBtnyoprma.isHidden = false
            homeBtnyoprma.isHidden = true
            forwardBtnyoprma.isHidden = true
            backBtnyoprma.isHidden = true
            refreshBtnyoprma.isHidden = true
            exitBtnyoprma.isHidden = true
        } else { // open
            toolsViewyoprma.backgroundColor = bottomBarColoryoprma
            closeBtnyoprma.isHidden = true
            homeBtnyoprma.isHidden = false
            forwardBtnyoprma.isHidden = false
            backBtnyoprma.isHidden = false
            refreshBtnyoprma.isHidden = false
            exitBtnyoprma.isHidden = false
        }
        wkWebViewyoprma.navigationDelegate = self
        
        homeBtnyoprma.addTarget(self, action: #selector(homeBtnClickyoprma(sender:)), for: UIControl.Event.touchUpInside)
        
        forwardBtnyoprma.addTarget(self, action: #selector(forwardBtnClickyoprma(sender:)), for: UIControl.Event.touchUpInside)
        
        backBtnyoprma.addTarget(self, action: #selector(backBtnClickyoprma(sender:)), for: UIControl.Event.touchUpInside)
        
        refreshBtnyoprma.addTarget(self, action: #selector(refreshBtnClickyoprma(sender:)), for: UIControl.Event.touchUpInside)
        
        exitBtnyoprma.addTarget(self, action: #selector(exitBtnClickyoprma(sender:)), for: UIControl.Event.touchUpInside)
        
//        let tapGes = UITapGestureRecognizer(target: self, action: #selector(closeBtnClickyoprma(sender:))
//        closeBtnyoprma.addGestureRecognizer(tapGes)
        closeBtnyoprma.addTarget(self, action: #selector(closeBtnClickyoprma(sender:)), for: UIControl.Event.touchUpInside)
        
        resetBtnColoryoprma(yoprmax: nil, yoprmay: nil, yoprmaz: nil)
        
        if (multiUrl.count > 0) {
            isInityoprma = true
            while (multiUrl.count > 0) {
                if let gotoUrlyoprma:URL = URL(string: multiUrl[0]) {
                    let requestyoprma:URLRequest = URLRequest(url: gotoUrlyoprma)
                    self.multiUrl.removeFirst()
                    self.wkWebViewyoprma.load(requestyoprma)
                    break
                } else {
                    self.multiUrl.removeFirst()
                    if (self.multiUrl.count == 0) {
                        isInityoprma = false
                    }
                }
            }
        }
        
    }
    
    func setCallbackForPolicy(yoprmax: String?, yoprmay: String?, yoprmaz: String?, callbackHandleryoprma: (() -> Void)?) {
        callbackyoprma = callbackHandleryoprma
    }
    
    func loadMultiyoprma(yoprmax: String?, yoprmay: String?, yoprmaz: String?, urlsyoprma:[String]) {
        multiUrl = urlsyoprma
        if (multiUrl.count > 0) {
            while (multiUrl.count > 0) {
                if let gotoUrlyoprma:URL = URL(string: multiUrl[0]) {
                    let requestyoprma:URLRequest = URLRequest(url: gotoUrlyoprma)
                    self.multiUrl.removeFirst()
                    self.wkWebViewyoprma.load(requestyoprma)
                    break
                } else {
                    self.multiUrl.removeFirst()
                }
            }
        }
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        self.resetBtnColoryoprma(yoprmax: nil, yoprmay: nil, yoprmaz: nil)
        
        if let urlyoprma = navigationAction.request.url {
            
            let htyoprma:[Character] = ["h", "-", "t", "-", "t", "-", "p", "-", ":", "-", "/", "-", "/"]
            let htsyoprma:[Character] = ["h", "-", "t", "-", "t", "-", "p", "-", "s", "-", ":", "-", "/", "-", "/"]
            let ftyoprma:[Character] = ["f", "-", "t", "-", "p", "-", ":", "-", "/", "-", "/"]
            
            if (!(urlyoprma.absoluteString.hasPrefix(String(htyoprma).replacingOccurrences(of: "-", with: "")) || urlyoprma.absoluteString.hasPrefix(String(htsyoprma).replacingOccurrences(of: "-", with: "")) || urlyoprma.absoluteString.hasPrefix(String(ftyoprma).replacingOccurrences(of: "-", with: "")))) {
                
                decisionHandler(WKNavigationActionPolicy.cancel)
                
                if (self.wkWebViewyoprma.backForwardList.backList.count > 0) {
                    backUrlyoprma = self.wkWebViewyoprma.backForwardList.backList[self.wkWebViewyoprma.backForwardList.backList.count - 1].url.absoluteString
                } else {
                    backUrlyoprma = nil
                }
                
                UIApplication.shared.open(urlyoprma, options: [:], completionHandler: nil)
                return
                
            }
            
        }
        backUrlyoprma = nil
        decisionHandler(.allow)
        
        return
        
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.resetBtnColoryoprma(yoprmax: nil, yoprmay: nil, yoprmaz: nil)
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        self.resetBtnColoryoprma(yoprmax: nil, yoprmay: nil, yoprmaz: nil)
        if (isInityoprma) {
            if (multiUrl.count > 0) {
                while (multiUrl.count > 0) {
                    if let gotoUrlyoprma:URL = URL(string: multiUrl[0]) {
                        let requestyoprma:URLRequest = URLRequest(url: gotoUrlyoprma)
                        self.multiUrl.removeFirst()
                        self.wkWebViewyoprma.load(requestyoprma)
                        break
                    } else {
                        self.multiUrl.removeFirst()
                        if (self.multiUrl.count == 0) {
                            isInityoprma = false
                        }
                    }
                }
            } else {
                isInityoprma = false
            }
        } else {
            if (multiUrl.count > 0) {
                while (multiUrl.count > 0) {
                    if let gotoUrlyoprma:URL = URL(string: multiUrl[0]) {
                        let requestyoprma:URLRequest = URLRequest(url: gotoUrlyoprma)
                        self.multiUrl.removeFirst()
                        self.wkWebViewyoprma.load(requestyoprma)
                        break
                    } else {
                        self.multiUrl.removeFirst()
                    }
                }
            }
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.resetBtnColoryoprma(yoprmax: nil, yoprmay: nil, yoprmaz: nil)
    }
    
    func resetBtnColoryoprma(yoprmax: String?, yoprmay: String?, yoprmaz: String?) {
        
        DispatchQueue.main.async {
            
            if (self.wkWebViewyoprma.canGoBack) {
                self.backBtnyoprma.setImage(getNaviBackLineImageyoprma(yoprmax: nil, yoprmay: nil, yoprmaz: nil, imageSizeyoprma: 100, arrowStrokeWidthyoprma: 8, arrowColoryoprma: btnOnLineColoryoprma, backgroundColoryoprma: .clear), for: UIControl.State.normal)
            } else {
                self.backBtnyoprma.setImage(getNaviBackLineImageyoprma(yoprmax: nil, yoprmay: nil, yoprmaz: nil, imageSizeyoprma: 100, arrowStrokeWidthyoprma: 8, arrowColoryoprma: btnOffLineColoryoprma, backgroundColoryoprma: .clear), for: UIControl.State.normal)
            }
            
            if (self.wkWebViewyoprma.canGoForward) {
                self.forwardBtnyoprma.setImage(getNaviForwardLineImageyoprma(yoprmax: nil, yoprmay: nil, yoprmaz: nil, imageSizeyoprma: 100, arrowStrokeWidthyoprma: 8, arrowColoryoprma: btnOnLineColoryoprma, backgroundColoryoprma: .clear), for: UIControl.State.normal)
            } else {
                self.forwardBtnyoprma.setImage(getNaviForwardLineImageyoprma(yoprmax: nil, yoprmay: nil, yoprmaz: nil, imageSizeyoprma: 100, arrowStrokeWidthyoprma: 8, arrowColoryoprma: btnOffLineColoryoprma, backgroundColoryoprma: .clear), for: UIControl.State.normal)
            }
            
        }
        
    }
    
    @objc func homeBtnClickyoprma(sender: UIButton) {
        if (self.wkWebViewyoprma.canGoBack) {
            self.wkWebViewyoprma.load(URLRequest(url: self.wkWebViewyoprma.backForwardList.backList[0].url))
        }
    }
    
    @objc func backBtnClickyoprma(sender: UIButton) {
        if (self.titleDesc.count > 0) {
            if (self.wkWebViewyoprma.canGoBack) {
                self.wkWebViewyoprma.goBack()
            } else {
                self.dismiss(animated: true) {
                    if (self.callbackyoprma != nil) {
                        self.callbackyoprma!()
                    }
                }
            }
        } else {
            
            if (self.wkWebViewyoprma.canGoBack) {
                if (backUrlyoprma != nil) {
                    var lastIndexyoprma = self.wkWebViewyoprma.backForwardList.backList.count - 1
                    for i in 0..<self.wkWebViewyoprma.backForwardList.backList.count {
                        if (self.wkWebViewyoprma.backForwardList.backList[self.wkWebViewyoprma.backForwardList.backList.count - i - 1].url.absoluteString == backUrlyoprma!) {
                            lastIndexyoprma = self.wkWebViewyoprma.backForwardList.backList.count - i - 1
                            break
                        }
                    }
                    self.wkWebViewyoprma.go(to: self.wkWebViewyoprma.backForwardList.backList[lastIndexyoprma])
                } else {
                    self.wkWebViewyoprma.goBack()
                }
            }
        }
    }
    
    @objc func forwardBtnClickyoprma(sender: UIButton) {
        if (self.wkWebViewyoprma.canGoForward) {
            self.wkWebViewyoprma.goForward()
        }
    }
    
    @objc func refreshBtnClickyoprma(sender: UIButton) {
        self.wkWebViewyoprma.reload()
    }
    
    @objc func exitBtnClickyoprma(sender: UIButton) {
        if (self.titleDesc.count > 0) {
            self.dismiss(animated: true) {
                if (self.callbackyoprma != nil) {
                    self.callbackyoprma!()
                }
            }
        } else {
            exit(0)
        }
    }
    
    @objc func closeBtnClickyoprma(sender: UIView) {
        for subview in sender.subviews {
            if let button = subview as? UIButton {
                button.isSelected = true
            }
        }
        self.dismiss(animated: true) {
            if (self.callbackyoprma != nil) {
                self.callbackyoprma!()
            }
        }
    }
    
}

func radiansToDegreesyoprma(yoprmax: String?, yoprmay: String?, yoprmaz: String?, radiansyoprma:CGFloat) -> CGFloat {
    //
    // 弧度轉成角度
    return radiansyoprma * 180 / CGFloat.pi
}
func degreesToRadiansyoprma(yoprmax: String?, yoprmay: String?, yoprmaz: String?, degreesyoprma:CGFloat) -> CGFloat {
    //
    // 角度轉成弧度
    return degreesyoprma * CGFloat.pi / 180
}

func getXrightPlusByRadiusyoprma(yoprmax: String?, yoprmay: String?, yoprmaz: String?, lengthyoprma:CGFloat, degreesRightyoprma:CGFloat) -> CGFloat {
    //
    // 中心向右為0度，逆時針旋轉，X左為正Y上為正
    return lengthyoprma * cos(degreesRightyoprma * CGFloat.pi / 180)
}

func getYtopPlusByRadiusyoprma(yoprmax: String?, yoprmay: String?, yoprmaz: String?, lengthyoprma:CGFloat, degreesRightyoprma:CGFloat) -> CGFloat {
    //
    // 中心向右為0度，逆時針旋轉，X左為正Y上為正
    return lengthyoprma * sin(degreesRightyoprma * CGFloat.pi / 180)
}

func getSideLengthByXyoprma(yoprmax: String?, yoprmay: String?, yoprmaz: String?, lengthyoprma:CGFloat, degreesRightyoprma:CGFloat) -> CGFloat {
    //
    // 中心向右為0度，逆時針旋轉，X左為正Y上為正
    let yLenyoprma = lengthyoprma * tan(degreesRightyoprma * CGFloat.pi / 180)
    return sqrt(lengthyoprma*lengthyoprma + yLenyoprma*yLenyoprma)
}

func getSideLengthByYyoprma(yoprmax: String?, yoprmay: String?, yoprmaz: String?, lengthyoprma:CGFloat, degreesRightyoprma:CGFloat) -> CGFloat {
    //
    // 中心向右為0度，逆時針旋轉，X左為正Y上為正
    let xLenyoprma = lengthyoprma / tan(degreesRightyoprma * CGFloat.pi / 180)
    return sqrt(lengthyoprma*lengthyoprma + xLenyoprma*xLenyoprma)
}

func getYtopPlusByXyoprma(yoprmax: String?, yoprmay: String?, yoprmaz: String?, lengthyoprma:CGFloat, degreesRightyoprma:CGFloat) -> CGFloat {
    //
    // 中心向右為0度，逆時針旋轉，X左為正Y上為正
    return lengthyoprma * tan(degreesRightyoprma * CGFloat.pi / 180)
}

func getXrightPlusByYyoprma(yoprmax: String?, yoprmay: String?, yoprmaz: String?, lengthyoprma:CGFloat, degreesRightyoprma:CGFloat) -> CGFloat {
    //
    // 中心向右為0度，逆時針旋轉，X左為正Y上為正
    return lengthyoprma / tan(degreesRightyoprma * CGFloat.pi / 180)
}

func imageToBase64yoprma(yoprmax: String?, yoprmay: String?, yoprmaz: String?, imageyoprma:UIImage) -> String {
    //
    // 將圖片轉為 base64 字串
    if let imageDatayoprma = imageyoprma.pngData() {
        return imageDatayoprma.base64EncodedString()
    } else {
        if let imageDatayoprma = imageyoprma.jpegData(compressionQuality: 0.75) {
            return imageDatayoprma.base64EncodedString()
        } else {
            return ""
        }
    }
}

func base64ToImageyoprma(yoprmax: String?, yoprmay: String?, yoprmaz: String?, base64yoprma:String) -> UIImage? {
    
    if let dataDecodedyoprma = Data(base64Encoded: base64yoprma, options: Data.Base64DecodingOptions.init()) {
        if let decodedimageyoprma = UIImage(data: dataDecodedyoprma) {
            return decodedimageyoprma
        }
    }
    
    return nil
}

func getNaviHomeLineImageyoprma(yoprmax: String?, yoprmay: String?, yoprmaz: String?, imageSizeyoprma:CGFloat?, arrowStrokeWidthyoprma:CGFloat?, arrowColoryoprma:UIColor?, backgroundColoryoprma:UIColor?) -> UIImage? {
    
    var contextSizeyoprma:CGFloat = 100
    if (imageSizeyoprma != nil) {
        contextSizeyoprma = imageSizeyoprma!
    }
    let sideLangthyoprma:CGFloat = contextSizeyoprma * 0.7
    var strokeWidthyoprma:CGFloat = 4
    if (arrowStrokeWidthyoprma != nil) {
        strokeWidthyoprma = arrowStrokeWidthyoprma!
    }
    
    UIGraphicsBeginImageContextWithOptions(CGSize(width: contextSizeyoprma, height: contextSizeyoprma), false, 0.0)
    
    if let contextyoprma = UIGraphicsGetCurrentContext() {
        
        contextyoprma.beginPath()
        contextyoprma.move(to: CGPoint(x: 0, y: 0))
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma, y: 0))
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma, y: contextSizeyoprma))
        contextyoprma.addLine(to: CGPoint(x: 0, y: contextSizeyoprma))
        contextyoprma.closePath()
        if let coloryoprma = backgroundColoryoprma {
            contextyoprma.setFillColor(coloryoprma.cgColor)
        } else {
            contextyoprma.setFillColor(UIColor.clear.cgColor)
        }
        contextyoprma.fillPath()
    }
    
    if let contextyoprma = UIGraphicsGetCurrentContext() {
        contextyoprma.beginPath()
        contextyoprma.setLineCap(.round)
        contextyoprma.setLineJoin(.round)
        contextyoprma.move(to: CGPoint(x: contextSizeyoprma * 0.1 , y: contextSizeyoprma * 0.1 + sideLangthyoprma / 2.0))
        
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma * 0.1 + sideLangthyoprma / 2, y: contextSizeyoprma * 0.1))
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma * 0.1 + sideLangthyoprma, y: contextSizeyoprma * 0.1 + sideLangthyoprma / 2.0))
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.85, y: contextSizeyoprma * 0.1 + sideLangthyoprma / 2.0))
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.85, y: contextSizeyoprma * 0.1 + sideLangthyoprma))
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.7, y: contextSizeyoprma * 0.1 + sideLangthyoprma))
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.7, y: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.7))
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.3, y: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.7))
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.3, y: contextSizeyoprma * 0.1 + sideLangthyoprma))
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.15, y: contextSizeyoprma * 0.1 + sideLangthyoprma))
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.15, y: contextSizeyoprma * 0.1 + sideLangthyoprma / 2.0))
        
        contextyoprma.setLineWidth(strokeWidthyoprma)
        if let coloryoprma = arrowColoryoprma {
            contextyoprma.setStrokeColor(coloryoprma.cgColor)
        } else {
            contextyoprma.setStrokeColor(UIColor.clear.cgColor)
        }
        contextyoprma.strokePath()
    }
    
    let imgyoprma = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return imgyoprma
}

func getNaviBackLineImageyoprma(yoprmax: String?, yoprmay: String?, yoprmaz: String?, imageSizeyoprma:CGFloat?, arrowStrokeWidthyoprma:CGFloat?, arrowColoryoprma:UIColor?, backgroundColoryoprma:UIColor?) -> UIImage? {
    
    var contextSizeyoprma:CGFloat = 100
    if (imageSizeyoprma != nil) {
        contextSizeyoprma = imageSizeyoprma!
    }
    let sideLangthyoprma:CGFloat = contextSizeyoprma * 0.7
    var strokeWidthyoprma:CGFloat = 4
    if (arrowStrokeWidthyoprma != nil) {
        strokeWidthyoprma = arrowStrokeWidthyoprma!
    }
    
    UIGraphicsBeginImageContextWithOptions(CGSize(width: contextSizeyoprma, height: contextSizeyoprma), false, 0.0)
    
    if let contextyoprma = UIGraphicsGetCurrentContext() {
        
        contextyoprma.beginPath()
        contextyoprma.move(to: CGPoint(x: 0, y: 0))
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma, y: 0))
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma, y: contextSizeyoprma))
        contextyoprma.addLine(to: CGPoint(x: 0, y: contextSizeyoprma))
        contextyoprma.closePath()
        if let coloryoprma = backgroundColoryoprma {
            contextyoprma.setFillColor(coloryoprma.cgColor)
        } else {
            contextyoprma.setFillColor(UIColor.clear.cgColor)
        }
        contextyoprma.fillPath()
    }
    
    if let contextyoprma = UIGraphicsGetCurrentContext() {
        contextyoprma.beginPath()
        contextyoprma.setLineCap(.round)
        contextyoprma.setLineJoin(.round)
        contextyoprma.move(to: CGPoint(x: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.4, y: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.9))
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma * 0.1, y: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.5))
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.4, y: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.1))
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.4, y: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.3))
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma * 0.1 + sideLangthyoprma, y: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.3))
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma * 0.1 + sideLangthyoprma, y: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.7))
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.4, y: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.7))
        
        contextyoprma.setLineWidth(strokeWidthyoprma)
        if let coloryoprma = arrowColoryoprma {
            contextyoprma.setStrokeColor(coloryoprma.cgColor)
        } else {
            contextyoprma.setStrokeColor(UIColor.clear.cgColor)
        }
        contextyoprma.strokePath()
    }
    
    let imgyoprma = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return imgyoprma
}

func getNaviForwardLineImageyoprma(yoprmax: String?, yoprmay: String?, yoprmaz: String?, imageSizeyoprma:CGFloat?, arrowStrokeWidthyoprma:CGFloat?, arrowColoryoprma:UIColor?, backgroundColoryoprma:UIColor?) -> UIImage? {
    
    var contextSizeyoprma:CGFloat = 100
    if (imageSizeyoprma != nil) {
        contextSizeyoprma = imageSizeyoprma!
    }
    let sideLangthyoprma:CGFloat = contextSizeyoprma * 0.7
    var strokeWidthyoprma:CGFloat = 4
    if (arrowStrokeWidthyoprma != nil) {
        strokeWidthyoprma = arrowStrokeWidthyoprma!
    }
    
    UIGraphicsBeginImageContextWithOptions(CGSize(width: contextSizeyoprma, height: contextSizeyoprma), false, 0.0)
    
    if let contextyoprma = UIGraphicsGetCurrentContext() {
        
        contextyoprma.beginPath()
        contextyoprma.move(to: CGPoint(x: 0, y: 0))
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma, y: 0))
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma, y: contextSizeyoprma))
        contextyoprma.addLine(to: CGPoint(x: 0, y: contextSizeyoprma))
        contextyoprma.closePath()
        if let coloryoprma = backgroundColoryoprma {
            contextyoprma.setFillColor(coloryoprma.cgColor)
        } else {
            contextyoprma.setFillColor(UIColor.clear.cgColor)
        }
        contextyoprma.fillPath()
    }
    
    if let contextyoprma = UIGraphicsGetCurrentContext() {
        contextyoprma.beginPath()
        contextyoprma.setLineCap(.round)
        contextyoprma.setLineJoin(.round)
        contextyoprma.move(to: CGPoint(x: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.6, y: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.9))
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma * 0.1 + sideLangthyoprma, y: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.5))
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.6, y: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.1))
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.6, y: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.3))
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma * 0.1, y: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.3))
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma * 0.1, y: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.7))
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.6, y: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.7))
        
        contextyoprma.setLineWidth(strokeWidthyoprma)
        if let coloryoprma = arrowColoryoprma {
            contextyoprma.setStrokeColor(coloryoprma.cgColor)
        } else {
            contextyoprma.setStrokeColor(UIColor.clear.cgColor)
        }
        contextyoprma.strokePath()
    }
    
    let imgyoprma = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return imgyoprma
}

func getNaviRefreshLineImageyoprma(yoprmax: String?, yoprmay: String?, yoprmaz: String?, imageSizeyoprma:CGFloat?, arrowStrokeWidthyoprma:CGFloat?, arrowColoryoprma:UIColor?, backgroundColoryoprma:UIColor?) -> UIImage? {
    
    var contextSizeyoprma:CGFloat = 100
    if (imageSizeyoprma != nil) {
        contextSizeyoprma = imageSizeyoprma!
    }
    let sideLangthyoprma:CGFloat = contextSizeyoprma * 0.7
    var strokeWidthyoprma:CGFloat = 4
    if (arrowStrokeWidthyoprma != nil) {
        strokeWidthyoprma = arrowStrokeWidthyoprma!
    }
    
    UIGraphicsBeginImageContextWithOptions(CGSize(width: contextSizeyoprma, height: contextSizeyoprma), false, 0.0)
    
    if let contextyoprma = UIGraphicsGetCurrentContext() {
        
        contextyoprma.beginPath()
        contextyoprma.move(to: CGPoint(x: 0, y: 0))
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma, y: 0))
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma, y: contextSizeyoprma))
        contextyoprma.addLine(to: CGPoint(x: 0, y: contextSizeyoprma))
        contextyoprma.closePath()
        if let coloryoprma = backgroundColoryoprma {
            contextyoprma.setFillColor(coloryoprma.cgColor)
        } else {
            contextyoprma.setFillColor(UIColor.clear.cgColor)
        }
        contextyoprma.fillPath()
    }
    
    if let contextyoprma = UIGraphicsGetCurrentContext() {
        contextyoprma.beginPath()
        contextyoprma.setLineCap(.round)
        contextyoprma.setLineJoin(.round)
        contextyoprma.move(to: CGPoint(x: contextSizeyoprma * 0.1 + sideLangthyoprma / 2.0 + getXrightPlusByRadiusyoprma(yoprmax: nil, yoprmay: nil, yoprmaz: nil, lengthyoprma: sideLangthyoprma * 0.4, degreesRightyoprma: 150), y: contextSizeyoprma * 0.1 + sideLangthyoprma / 2.0 - getYtopPlusByRadiusyoprma(yoprmax: nil, yoprmay: nil, yoprmaz: nil, lengthyoprma: sideLangthyoprma * 0.4, degreesRightyoprma: 150)))
        contextyoprma.addArc(center: CGPoint(x: contextSizeyoprma * 0.1 + sideLangthyoprma / 2.0, y: contextSizeyoprma * 0.1 + sideLangthyoprma / 2.0), radius: sideLangthyoprma * 0.4, startAngle: 210 * CGFloat.pi / 180 , endAngle: 0, clockwise: false)
        
        contextyoprma.move(to: CGPoint(x: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.8, y: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.4))
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.9, y: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.5))
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma * 0.1 + sideLangthyoprma * 1, y: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.4))
        
        
        contextyoprma.move(to: CGPoint(x: contextSizeyoprma * 0.1 + sideLangthyoprma / 2.0 + getXrightPlusByRadiusyoprma(yoprmax: nil, yoprmay: nil, yoprmaz: nil, lengthyoprma: sideLangthyoprma * 0.4, degreesRightyoprma: 330), y: contextSizeyoprma * 0.1 + sideLangthyoprma / 2.0 - getYtopPlusByRadiusyoprma(yoprmax: nil, yoprmay: nil, yoprmaz: nil, lengthyoprma: sideLangthyoprma * 0.4, degreesRightyoprma: 330)))
        contextyoprma.addArc(center: CGPoint(x: contextSizeyoprma * 0.1 + sideLangthyoprma / 2.0, y: contextSizeyoprma * 0.1 + sideLangthyoprma / 2.0), radius: sideLangthyoprma * 0.4, startAngle: 30 * CGFloat.pi / 180 , endAngle: 180 * CGFloat.pi / 180, clockwise: false)
        
        contextyoprma.move(to: CGPoint(x: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.2, y: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.6))
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.1, y: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.5))
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma * 0.1, y: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.6))
        
        contextyoprma.setLineWidth(strokeWidthyoprma)
        if let coloryoprma = arrowColoryoprma {
            contextyoprma.setStrokeColor(coloryoprma.cgColor)
        } else {
            contextyoprma.setStrokeColor(UIColor.clear.cgColor)
        }
        contextyoprma.strokePath()
    }
    
    let imgyoprma = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return imgyoprma
}

func getNaviExitLineImageyoprma(yoprmax: String?, yoprmay: String?, yoprmaz: String?, imageSizeyoprma:CGFloat?, arrowStrokeWidthyoprma:CGFloat?, arrowColoryoprma:UIColor?, backgroundColoryoprma:UIColor?) -> UIImage? {
    
    var contextSizeyoprma:CGFloat = 100
    if (imageSizeyoprma != nil) {
        contextSizeyoprma = imageSizeyoprma!
    }
    let sideLangthyoprma:CGFloat = contextSizeyoprma * 0.7
    var strokeWidthyoprma:CGFloat = 4
    if (arrowStrokeWidthyoprma != nil) {
        strokeWidthyoprma = arrowStrokeWidthyoprma!
    }
    
    UIGraphicsBeginImageContextWithOptions(CGSize(width: contextSizeyoprma, height: contextSizeyoprma), false, 0.0)
    
    if let contextyoprma = UIGraphicsGetCurrentContext() {
        
        contextyoprma.beginPath()
        contextyoprma.move(to: CGPoint(x: 0, y: 0))
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma, y: 0))
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma, y: contextSizeyoprma))
        contextyoprma.addLine(to: CGPoint(x: 0, y: contextSizeyoprma))
        contextyoprma.closePath()
        if let coloryoprma = backgroundColoryoprma {
            contextyoprma.setFillColor(coloryoprma.cgColor)
        } else {
            contextyoprma.setFillColor(UIColor.clear.cgColor)
        }
        contextyoprma.fillPath()
    }
    
    if let contextyoprma = UIGraphicsGetCurrentContext() {
        contextyoprma.beginPath()
        contextyoprma.setLineCap(.round)
        contextyoprma.setLineJoin(.round)
        contextyoprma.move(to: CGPoint(x: contextSizeyoprma * 0.1 + sideLangthyoprma / 2.0 + getXrightPlusByRadiusyoprma(yoprmax: nil, yoprmay: nil, yoprmaz: nil, lengthyoprma: sideLangthyoprma * 0.4, degreesRightyoprma: 120), y: contextSizeyoprma * 0.1 + sideLangthyoprma / 2.0 - getYtopPlusByRadiusyoprma(yoprmax: nil, yoprmay: nil, yoprmaz: nil, lengthyoprma: sideLangthyoprma * 0.4, degreesRightyoprma: 120)))
        contextyoprma.addArc(center: CGPoint(x: contextSizeyoprma * 0.1 + sideLangthyoprma / 2.0, y: contextSizeyoprma * 0.1 + sideLangthyoprma / 2.0), radius: sideLangthyoprma * 0.4, startAngle: 240 * CGFloat.pi / 180 , endAngle: 300 * CGFloat.pi / 180, clockwise: true)
        
        contextyoprma.move(to: CGPoint(x: contextSizeyoprma * 0.1 + sideLangthyoprma / 2.0, y: contextSizeyoprma * 0.1))
        contextyoprma.addLine(to: CGPoint(x: contextSizeyoprma * 0.1 + sideLangthyoprma / 2.0, y: contextSizeyoprma * 0.1 + sideLangthyoprma * 0.4))
        
        contextyoprma.setLineWidth(strokeWidthyoprma)
        if let coloryoprma = arrowColoryoprma {
            contextyoprma.setStrokeColor(coloryoprma.cgColor)
        } else {
            contextyoprma.setStrokeColor(UIColor.clear.cgColor)
        }
        contextyoprma.strokePath()
    }
    
    let imgyoprma = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return imgyoprma
}
