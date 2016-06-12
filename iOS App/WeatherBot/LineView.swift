//
//  LineChartView.swift
//  HealthPad
//
//  Created by Finn Gaida on 16.03.16.
//  Copyright © 2016 Finn Gaida. All rights reserved.
//

import UIKit
import Charts
//import ResearchKit

public class LineView: ChartView {
    
    public var chart: LineChartView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public override func setupChart() {
        chart = LineChartView(frame: CGRectMake(10, 85, self.frame.width - 10, self.frame.height - 110))
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
        chart?.rightAxis.showOnlyMinMaxEnabled = false
        chart?.xAxis.enabled = true
        chart?.xAxis.labelTextColor = UIColor(white: 1.0, alpha: 0.8)
        chart?.xAxis.gridColor = UIColor(white: 1.0, alpha: 0.3)
        chart?.rightAxis.labelTextColor = UIColor(white: 1.0, alpha: 0.8)
        chart?.rightAxis.axisLineColor = UIColor(white: 1.0, alpha: 0.5)
        chart?.rightAxis.zeroLineColor = UIColor(white: 1.0, alpha: 0.5)
        chart?.leftAxis.labelTextColor = UIColor(white: 1.0, alpha: 0.8)
        chart?.leftAxis.axisLineColor = UIColor(white: 1.0, alpha: 0.5)
        chart?.leftAxis.zeroLineColor = UIColor(white: 1.0, alpha: 0.5)
        chart?.leftAxis.gridColor = UIColor(white: 1.0, alpha: 0.3)
        chart?.leftAxis.gridLineWidth = 1.0
        chart?.leftAxis.setLabelCount(5, force: true)
        chart?.gridBackgroundColor = UIColor.clearColor()
        chart?.highlightPerTapEnabled = true
        chart?.highlightPerDragEnabled = true
        chart?.backgroundColor = UIColor.clearColor()
        chart?.layer.masksToBounds
        chart?.layer.cornerRadius = 10
        self.addSubview(Helper.gradientForColor(CGRectMake(0, 0, self.frame.width, self.frame.height), color: self.color))
        self.addSubview(chart!)
        
        // test chart
        //        self.addSubview(ResearchKitGraphHelper.sharedHelper.lineChart((chart?.frame)!))
    }
    
    public override func setupLabels() {
        super.setupLabels()
        titleLabel?.text = self.titleText ?? "Steps"
        todayLabel?.text = self.todayText ?? "Daily average: 4,631"
        averageLabel?.text = self.averageText ?? "1,261 steps"
        dateLabel?.text = self.dateText ?? "Today, 8:18"
    }
    
    public override func setDataSet(data:Array<Double>) {
        self.data = data
        
        let yVals = data.enumerate().map({ChartDataEntry(value: $1, xIndex: $0)})
        let set = LineChartDataSet(yVals: yVals, label: "")
        set.lineWidth = 2
        set.circleRadius = 5
        set.setCircleColor(UIColor.whiteColor())
        set.circleHoleColor = UIColor.orangeColor()
        set.drawCircleHoleEnabled = true
        set.setColor(UIColor.whiteColor())
        set.drawValuesEnabled = false
        set.highlightEnabled = false
        set.drawCubicEnabled = false
        set.drawFilledEnabled = true
        set.drawCirclesEnabled = true
        set.fillAlpha = 1.0
        set.fill = ChartFill(linearGradient: CGGradientCreateWithColors(nil, [UIColor(white: 1.0, alpha: 0.0).CGColor, UIColor(white: 1.0, alpha: 0.4).CGColor], nil)!, angle: 90.0)
        
        var xVals = (1...data.count).map({"\($0)"})
        xVals[0] = "Jun \(xVals[0])"   // TODO Real month
        
        //let avg = yVals.map({Int($0.value)}).average
        //let average = ChartLimitLine(limit: avg)
        //average.lineColor = UIColor(white: 1.0, alpha: 0.5)
        //average.lineWidth = 1
        //average.lineDashLengths = [5.0]
        //chart?.rightAxis.addLimitLine(average)
        
        chart?.data = LineChartData(xVals: xVals, dataSet: set)
        
        // send data to test chart
        //ResearchKitGraphHelper.sharedHelper.data = data.map({ORKRangedPoint(value: CGFloat(Float(self.majorValueFromHealthObject($0)) ?? 0))})
    }
    
    public override func chartScaled(chartView: ChartViewBase, scaleX: CGFloat, scaleY: CGFloat) {
        chart?.zoom(scaleX, scaleY: 1.0, x: (chart?.centerOffsets.x)!, y: (chart?.centerOffsets.y)!)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
