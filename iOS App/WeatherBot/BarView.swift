//
//  LineChartView.swift
//  HealthPad
//
//  Created by Finn Gaida on 16.03.16.
//  Copyright © 2016 Finn Gaida. All rights reserved.
//

import UIKit
import Charts

public class BarView: ChartView {
    
    public var chart: BarChartView?
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public override func setupChart() {
        chart = BarChartView(frame: CGRectMake(10, 85, self.frame.width - 10, self.frame.height - 110))
        chart?.delegate = self
        chart?.setScaleEnabled(true)
        chart?.dragEnabled = true
        chart?.pinchZoomEnabled = true
        chart?.drawGridBackgroundEnabled = true
        chart?.leftAxis.enabled = true
        chart?.rightAxis.enabled = true
        chart?.legend.enabled = false
        chart?.descriptionText = ""
        chart?.rightAxis.gridColor = UIColor.whiteColor()
        chart?.rightAxis.showOnlyMinMaxEnabled = true
        chart?.xAxis.enabled = true
        chart?.xAxis.labelTextColor = UIColor(white: 1.0, alpha: 0.8)
        chart?.xAxis.gridColor = UIColor(white: 1.0, alpha: 0.3)
        chart?.rightAxis.labelTextColor = UIColor(white: 1.0, alpha: 0.8)
        chart?.rightAxis.axisLineColor = UIColor(white: 1.0, alpha: 0.5)
        chart?.rightAxis.zeroLineColor = UIColor(white: 1.0, alpha: 0.5)
        chart?.leftAxis.startAtZeroEnabled = true
        chart?.leftAxis.labelTextColor = UIColor(white: 1.0, alpha: 0.8)
        chart?.leftAxis.axisLineColor = UIColor(white: 1.0, alpha: 0.5)
        chart?.leftAxis.zeroLineColor = UIColor(white: 1.0, alpha: 0.5)
        chart?.leftAxis.gridColor = UIColor(white: 1.0, alpha: 0.3)
        chart?.leftAxis.gridLineWidth = 1.0
        chart?.leftAxis.setLabelCount(5, force: true)
        chart?.zoom(2.0, scaleY: 1.0, x: self.frame.width * 2 - 20, y: 0)
        
        chart?.gridBackgroundColor = UIColor.clearColor()
        
        chart?.backgroundColor = UIColor.clearColor()
        chart?.layer.masksToBounds
        chart?.layer.cornerRadius = 10
        self.addSubview(Helper.gradientForColor(CGRectMake(0, 0, self.frame.width, self.frame.height), color: self.color))
        self.addSubview(chart!)
        
    }
    
    public override func setupLabels() {
        super.setupLabels()
        titleLabel?.text = self.titleText ?? "Sleep Analysis"
        todayLabel?.text = self.todayText ?? "Daily average: 7h 33m"
        averageLabel?.text = self.averageText ?? "7h 22m"
        dateLabel?.text = self.dateText ?? "Yesterday, 6:24 AM"
    }
    
    public override func setDataSet(data:Array<Double>) {
        
        let yVals = data.enumerate().map({BarChartDataEntry(value: $1, xIndex: $0)})
        let set = BarChartDataSet(yVals: yVals, label: "")
        set.drawValuesEnabled = false
        set.highlightEnabled = false
        set.colors = [UIColor(white: 1.0, alpha: 0.5)]
        
        var xVals = (1...data.count).map({"\($0)"})
        xVals[0] = "Mar \(xVals[0])"   // TODO Real month
        
        let avg = yVals.map({Int($0.value)}).average
        let average = ChartLimitLine(limit: avg)
        average.lineColor = UIColor(white: 1.0, alpha: 0.5)
        average.lineWidth = 1
        average.lineDashLengths = [5.0]
        chart?.rightAxis.addLimitLine(average)
        
        chart?.data = BarChartData(xVals: xVals, dataSet: set)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
