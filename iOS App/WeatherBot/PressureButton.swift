//
//  PressureButton.swift
//  Lemo
//
//  Created by Finn Gaida on 11.06.16.
//  Copyright © 2016 Finn Gaida. All rights reserved.
//

import UIKit

class PressureButton: BaseButton {
    
    init(pressure: Double, frame: CGRect, closure: () -> ()) {
        super.init(frame: frame, closure: closure)
        self.image?.image = UIImage(named: "pressure")
        setValue(pressure)
    }
    
    func setValue(val:Double) {
        let t = String(format: "%.2f", val)
        self.label?.text = "\(t) hPa"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
