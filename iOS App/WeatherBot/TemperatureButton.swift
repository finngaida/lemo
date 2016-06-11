//
//  TemperatureButton.swift
//  Lemo
//
//  Created by Finn Gaida on 11.06.16.
//  Copyright © 2016 Finn Gaida. All rights reserved.
//

import UIKit

class TemperatureButton: BaseButton {
    
    init(temp: Double, frame: CGRect) {
        super.init(frame: frame)
        self.image?.image = UIImage(named: "temperature")
        self.label?.text = "\(temp) °C"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
