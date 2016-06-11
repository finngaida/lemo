//
//  TemperatureButton.swift
//  Lemo
//
//  Created by Finn Gaida on 11.06.16.
//  Copyright © 2016 Finn Gaida. All rights reserved.
//

import UIKit

class TemperatureButton: BaseButton {
    
    init(temp: Double, frame: CGRect, closure: () -> ()) {
        super.init(frame: frame, closure: closure)
        self.image?.image = UIImage(named: "temperature")
        
        let t = String(format: "%.2f", temp)
        self.label?.text = "\(t) °C"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
