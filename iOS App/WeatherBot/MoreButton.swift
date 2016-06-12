//
//  MoreButton.swift
//  Lemo
//
//  Created by Finn Gaida on 12.06.16.
//  Copyright © 2016 Finn Gaida. All rights reserved.
//

import UIKit

class MoreButton: BaseButton {
    
    init(text: String, frame: CGRect, closure: () -> ()) {
        super.init(frame: frame, closure: closure)
        self.image?.image = UIImage(named: "more")
        setValue(text)
    }
    
    func setValue(val:String) {
        self.label?.text = "\(val)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
