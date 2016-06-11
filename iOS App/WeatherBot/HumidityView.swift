//
//  HumidityView.swift
//  Lemo
//
//  Created by Finn Gaida on 12.06.16.
//  Copyright © 2016 Finn Gaida. All rights reserved.
//

import UIKit

public class HumidityView: BarView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.color = .Green
        self.titleText = "Luftfeuchtigkeit"
        self.averageText = "45%"
        self.todayText = "68%"
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

