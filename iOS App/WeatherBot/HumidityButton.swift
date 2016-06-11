//
//  HumidityButton.swift
//  Lemo
//
//  Created by Finn Gaida on 11.06.16.
//  Copyright © 2016 Finn Gaida. All rights reserved.
//

import UIKit

class HumidityButton: BaseButton {

    init(humidity: Double, frame: CGRect) {
        super.init(frame: frame)
        self.image?.image = UIImage(named: "humidity")
        self.label?.text = "\(humidity) %"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
