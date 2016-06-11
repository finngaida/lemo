//
//  BaseButton.swift
//  Lemo
//
//  Created by Finn Gaida on 11.06.16.
//  Copyright © 2016 Finn Gaida. All rights reserved.
//

import UIKit

class BaseButton: UIButton {
    
    var image:UIImageView?
    var label:UILabel?
    var origFrame = CGRectZero
    let touchDownMargin:CGFloat = 5
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.origFrame = frame
        
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.layer.borderWidth = touchDownMargin / 2
        
        image = UIImageView(frame: CGRectMake(touchDownMargin * 2, touchDownMargin, self.frame.width - touchDownMargin * 4, self.frame.height - touchDownMargin * 4))
        image?.layer.masksToBounds = true
        image?.layer.cornerRadius = image!.frame.width / 2
        self.addSubview(image!)
        
        label = UILabel(frame: CGRectMake(touchDownMargin, self.frame.height - touchDownMargin * 2, self.frame.width - touchDownMargin * 2, touchDownMargin * 2))
        label?.backgroundColor = .clearColor()
        label?.textColor = .whiteColor()
        label?.font = UIFont.systemFontOfSize(20)
        label?.textAlignment = .Center
        label?.numberOfLines = 0
        self.addSubview(label!)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        UIView.animateWithDuration(0.2, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: [], animations: { 
            self.frame = CGRectMake(self.origFrame.origin.x + self.touchDownMargin, self.origFrame.origin.y + self.touchDownMargin, self.origFrame.width - self.touchDownMargin * 2, self.origFrame.height - self.touchDownMargin * 2)
            }, completion: nil)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        UIView.animateWithDuration(0.2, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: [], animations: {
            self.frame = self.origFrame
            }, completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
