//
//  TemperatureView.swift
//  Lemo
//
//  Created by Finn Gaida on 12.06.16.
//  Copyright © 2016 Finn Gaida. All rights reserved.
//

import UIKit

public class TemperatureView: LineView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.color = .Orange
        self.titleText = "Temperatur"
        self.averageText = "23 °C"
        self.todayText = "22 °C"
        self.dateText = "Heute, 3:14 PM"
    }
    
    public override func majorValueFromHealthObject(obj:HealthObject) -> String {
        if let o = obj as? Steps {
            return "\(o.value)"
        } else {return ""}
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
