//
//  GraphViewController.swift
//  Lemo
//
//  Created by Finn Gaida on 11.06.16.
//  Copyright © 2016 Finn Gaida. All rights reserved.
//

import UIKit
import PNChart

class TemperatureViewController: UIViewController {
    
    var dataSet:DataSet!
    var chart:PNLineChart!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Graph"
        
        /*chart = PNLineChart(frame: CGRectMake(0, 66, self.view.frame.width, self.view.frame.width))
         chart.xLabels = Manager.sharedManager.xLabelsFromSet(dataSet)
         chart.showCoordinateAxis = true
         chart.axisColor = Manager.sharedManager.color
         chart.axisWidth = 2
         chart.xUnit = "Uhrzeit"
         chart.yUnit = "°C"
         
         let dataArray = Manager.sharedManager.dataArrayFromSet(dataSet, filteredCapability: .Temperature)
         let data = PNLineChartData()
         data.color = Manager.sharedManager.color
         data.lineWidth = 3
         data.itemCount = UInt(chart.xLabels.count)
         data.getData = { (index:UInt) -> PNLineChartDataItem! in
         let yValue = CGFloat(dataArray[Int(index)])
         return PNLineChartDataItem(y: yValue)
         }
         
         chart.chartData = [data]
         chart.strokeChart()
         
         self.view.addSubview(chart)*/
        
        let chart = TemperatureView(frame: CGRectMake(5, 70, self.view.frame.width - 10, self.view.frame.height - 130))
        chart.setDataSet(dataSet.data.map({ $0.temperature }))
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
