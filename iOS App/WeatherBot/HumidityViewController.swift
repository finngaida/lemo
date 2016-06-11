//
//  HumidityViewController.swift
//  Lemo
//
//  Created by Finn Gaida on 11.06.16.
//  Copyright © 2016 Finn Gaida. All rights reserved.
//

import UIKit
import PNChart

class HumidityViewController: UIViewController {
    
    var dataSet:DataSet!
    var chart:PNBarChart!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Luftfeuchtigkeit"
        
        // Do any additional setup after loading the view.
        chart = PNBarChart(frame: CGRectMake(0, 66, self.view.frame.width, self.view.frame.width))
        chart.xLabels = Manager.sharedManager.xLabelsFromSet(dataSet)
        chart.yValues = Manager.sharedManager.dataArrayFromSet(dataSet, filteredCapability: .Humidity)
        chart.strokeChart()
        
        self.view.addSubview(chart)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
