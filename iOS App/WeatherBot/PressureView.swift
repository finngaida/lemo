//
//  PressureView.swift
//  Lemo
//
//  Created by Finn Gaida on 12.06.16.
//  Copyright © 2016 Finn Gaida. All rights reserved.
//

import UIKit

public class PressureView: LineView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.color = .Blue
        self.titleText = "Luftdruck"
        self.averageText = "1123 hPa"
        self.todayText = "1563 hPa"
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
