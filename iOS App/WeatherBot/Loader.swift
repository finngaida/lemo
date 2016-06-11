//
//  Loader.swift
//  
//
//  Created by Finn Gaida on 16.03.16.
//
//

import Foundation
import UIKit
import Async
import ActionKit

public class Loader: UIView {
    
    public let blur = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Light))
    public var label:UILabel?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 15
        blur.frame = self.frame
        
        self.addSubview(blur)
        
        label = UILabel(frame: CGRectMake(10, frame.height-65, frame.width - 20, 50))
        label?.textAlignment = NSTextAlignment.Center
        label?.font = UIFont(name: "HelveticaNeue", size: 13)
        label?.textColor = UIColor.blackColor()
        label?.text = "Loading..."
        label?.numberOfLines = 0
        blur.contentView.addSubview(label!)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public class func showLoader(onVC: UIViewController) -> Loader {
        
        let bg = UIView(frame: onVC.view.frame)
        bg.backgroundColor = UIColor.blackColor()
        bg.alpha = 0
        bg.tag = 456
        
        let hide = UIButton(frame: bg.frame)
        hide.addControlEvent(.TouchUpInside) { () -> () in
            Loader.hideLoader(onVC)
        }
        bg.addSubview(hide)
        
        let loader = Loader(frame: CGRectMake(0, 0, 200, 200))
        loader.tag = 456
        
        
        Async.main { () -> Void in
            onVC.view.addSubview(bg)
            onVC.view.addSubview(loader)
            
            UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: [], animations: { () -> Void in
                bg.alpha = 0.4
                loader.center = onVC.view.center
                }) { (success) -> Void in
                    
            }
        }
        
        return loader
        
    }
    
    public class func hideLoader(onVC: UIViewController) {
        
        onVC.view.subviews.forEach { (loader) -> () in
            if loader.tag == 456 {
                Async.main { () -> Void in
                    UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: { () -> Void in
                        loader.center = CGPointMake(loader.center.x, (loader.superview?.frame.height)! + loader.frame.height)
                        }) { (success) -> Void in
                            loader.removeFromSuperview()
                    }
                }
            }
        }
    }
    
}
