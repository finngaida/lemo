//
//  HumidityButton.swift
//  Lemo
//
//  Created by Finn Gaida on 11.06.16.
//  Copyright © 2016 Finn Gaida. All rights reserved.
//

import UIKit

class HumidityButton: BaseButton {
    
    init(humidity: Double, frame: CGRect, closure: () -> ()) {
        super.init(frame: frame, closure: closure)
        self.image?.image = UIImage(named: "humidity")
        
        let h = String(format: "%.1f", humidity)
        self.label?.text = "\(h) %"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
