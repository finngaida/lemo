//
//  Helper.swift
//  HealthPad Companion
//
//  Created by Finn Gaida on 16.03.16.
//  Copyright © 2016 Finn Gaida. All rights reserved.
//

import Foundation
import UIKit
import CloudKit
import Async
import HealthKit
import GradientView
//import ResearchKit

public class Helper: NSObject {
    
    public static let sharedHelper = Helper()
    public let db = CKContainer.defaultContainer().publicCloudDatabase
    public var latestData:Dictionary<String,Array<Day>> = Dictionary()
    
    public let typeSelectedNotification = "typeSelectedNotification"
    public let showLineChartSegue = "showLineChart"
    public let showStepsSegue = "showSteps"
    public let showWeightSegue = "showWeight"
    public let showSleepSegue = "showSleep"
    public let showHeartRateSegue = "showHeartRate"
    public let showBloodPressureSegue = "showBloodPressure"
    
    public override init() {
        super.init()
        
    }
    
    public class func gradientForColor(frame: CGRect, color: FGColor) -> UIView {
        
        let gradient = GradientView(frame: frame)
        
        switch color {
        case .Orange:
            gradient.colors = [UIColor(red: 0.992, green: 0.584, blue: 0.345, alpha: 1.00), UIColor(red: 0.988, green: 0.243, blue: 0.224, alpha: 1.00)]
            break
        case .Gray:
            gradient.colors = [UIColor(red: 0.820, green: 0.820, blue: 0.839, alpha: 1.00), UIColor(red: 0.549, green: 0.549, blue: 0.573, alpha: 1.00)]
            break
        case .Yellow:
            gradient.colors = [UIColor(red: 0.992, green: 0.831, blue: 0.212, alpha: 1.00), UIColor(red: 0.988, green: 0.635, blue: 0.161, alpha: 1.00)]
            break
        case .Purple:
            gradient.colors = [UIColor(red: 0.859, green: 0.651, blue: 0.988, alpha: 1.00), UIColor(red: 0.545, green: 0.263, blue: 0.980, alpha: 1.00)]
            break
        case .Blue:
            gradient.colors = [UIColor(red: 0.349, green: 0.780, blue: 0.980, alpha: 1.00), UIColor(red: 0.000, green: 0.392, blue: 0.992, alpha: 1.00)]
            break
        case .Green:
            gradient.colors = [UIColor(red: 0.263, green: 0.941, blue: 0.333, alpha: 1.00), UIColor(red: 0.000, green: 0.710, blue: 0.000, alpha: 1.00)]
            break
        case .Turquoise:
            gradient.colors = [UIColor(red: 0.298, green: 0.914, blue: 0.800, alpha: 1.00), UIColor(red: 0.204, green: 0.675, blue: 0.863, alpha: 1.00)]
            break
            
        }
        
        return gradient
    }
    
    public func dataTypes() -> Set<HKObjectType> {
        
        var readset:Set<HKObjectType> = Set()
        
        quantityTypes.forEach { (type) -> () in
            readset.insert(type)
        }
        
        categoryTypes.forEach { (type) -> () in
            readset.insert(type)
        }
        
        characteristicTypes.forEach { (type) -> () in
            readset.insert(type)
        }
        
        correlationTypes.forEach { (type) -> () in
            //            readset.insert(type)
        }
        
        workoutTypes.forEach { (type) -> () in
            readset.insert(type)
        }
        
        return readset
        
    }
    
    public let quantityTypes:[HKQuantityType] = [HKQuantityTypeIdentifierBodyMassIndex, HKQuantityTypeIdentifierBodyFatPercentage, HKQuantityTypeIdentifierHeight, HKQuantityTypeIdentifierBodyMass, HKQuantityTypeIdentifierLeanBodyMass, HKQuantityTypeIdentifierStepCount, HKQuantityTypeIdentifierDistanceWalkingRunning, HKQuantityTypeIdentifierDistanceCycling, HKQuantityTypeIdentifierBasalEnergyBurned, HKQuantityTypeIdentifierActiveEnergyBurned, HKQuantityTypeIdentifierFlightsClimbed, HKQuantityTypeIdentifierNikeFuel, HKQuantityTypeIdentifierHeartRate, HKQuantityTypeIdentifierBodyTemperature, HKQuantityTypeIdentifierBasalBodyTemperature, HKQuantityTypeIdentifierBloodPressureSystolic, HKQuantityTypeIdentifierBloodPressureDiastolic, HKQuantityTypeIdentifierRespiratoryRate, HKQuantityTypeIdentifierOxygenSaturation, HKQuantityTypeIdentifierPeripheralPerfusionIndex, HKQuantityTypeIdentifierBloodGlucose, HKQuantityTypeIdentifierNumberOfTimesFallen, HKQuantityTypeIdentifierElectrodermalActivity, HKQuantityTypeIdentifierInhalerUsage, HKQuantityTypeIdentifierBloodAlcoholContent, HKQuantityTypeIdentifierForcedVitalCapacity, HKQuantityTypeIdentifierForcedExpiratoryVolume1, HKQuantityTypeIdentifierPeakExpiratoryFlowRate, HKQuantityTypeIdentifierDietaryFatTotal, HKQuantityTypeIdentifierDietaryFatPolyunsaturated, HKQuantityTypeIdentifierDietaryFatMonounsaturated, HKQuantityTypeIdentifierDietaryFatSaturated, HKQuantityTypeIdentifierDietaryCholesterol, HKQuantityTypeIdentifierDietarySodium, HKQuantityTypeIdentifierDietaryCarbohydrates, HKQuantityTypeIdentifierDietaryFiber, HKQuantityTypeIdentifierDietarySugar, HKQuantityTypeIdentifierDietaryEnergyConsumed, HKQuantityTypeIdentifierDietaryProtein, HKQuantityTypeIdentifierDietaryVitaminA, HKQuantityTypeIdentifierDietaryVitaminB6, HKQuantityTypeIdentifierDietaryVitaminB12, HKQuantityTypeIdentifierDietaryVitaminC, HKQuantityTypeIdentifierDietaryVitaminD, HKQuantityTypeIdentifierDietaryVitaminE, HKQuantityTypeIdentifierDietaryVitaminK, HKQuantityTypeIdentifierDietaryCalcium, HKQuantityTypeIdentifierDietaryIron, HKQuantityTypeIdentifierDietaryThiamin, HKQuantityTypeIdentifierDietaryRiboflavin, HKQuantityTypeIdentifierDietaryNiacin, HKQuantityTypeIdentifierDietaryFolate, HKQuantityTypeIdentifierDietaryBiotin, HKQuantityTypeIdentifierDietaryPantothenicAcid, HKQuantityTypeIdentifierDietaryPhosphorus, HKQuantityTypeIdentifierDietaryIodine, HKQuantityTypeIdentifierDietaryMagnesium, HKQuantityTypeIdentifierDietaryZinc, HKQuantityTypeIdentifierDietarySelenium, HKQuantityTypeIdentifierDietaryCopper, HKQuantityTypeIdentifierDietaryManganese, HKQuantityTypeIdentifierDietaryChromium, HKQuantityTypeIdentifierDietaryMolybdenum, HKQuantityTypeIdentifierDietaryChloride, HKQuantityTypeIdentifierDietaryPotassium, HKQuantityTypeIdentifierDietaryCaffeine, HKQuantityTypeIdentifierDietaryWater, HKQuantityTypeIdentifierUVExposure].map {HKSampleType.quantityTypeForIdentifier($0)!}
    
    public let categoryTypes:[HKCategoryType] = [HKCategoryTypeIdentifierSleepAnalysis, HKCategoryTypeIdentifierAppleStandHour, HKCategoryTypeIdentifierCervicalMucusQuality, HKCategoryTypeIdentifierOvulationTestResult, HKCategoryTypeIdentifierMenstrualFlow, HKCategoryTypeIdentifierIntermenstrualBleeding, HKCategoryTypeIdentifierSexualActivity].map {HKSampleType.categoryTypeForIdentifier($0)!}
    
    public let characteristicTypes:[HKCharacteristicType] = [HKCharacteristicTypeIdentifierBiologicalSex, HKCharacteristicTypeIdentifierBloodType, HKCharacteristicTypeIdentifierDateOfBirth, HKCharacteristicTypeIdentifierFitzpatrickSkinType].map {HKObjectType.characteristicTypeForIdentifier($0)!}
    
    public let correlationTypes:[HKCorrelationType] = [HKCorrelationTypeIdentifierBloodPressure, HKCorrelationTypeIdentifierFood].map {HKSampleType.correlationTypeForIdentifier($0)!}
    
    public let workoutTypes:[HKWorkoutType] = [HKSampleType.workoutType()]
    
}

/*public class ResearchKitGraphHelper:NSObject, ORKGraphChartViewDataSource, ORKGraphChartViewDelegate {
    
    public static let sharedHelper = ResearchKitGraphHelper()
    public var lineChart:ORKLineGraphChartView?
    public var candleChart:ORKDiscreteGraphChartView?
    public var data:[ORKRangedPoint]? = [[120, 43], [130, 50], [125, 55], [120, 55], [125, 45], [130, 40]].map({ORKRangedPoint(minimumValue: $0[1], maximumValue: $0[0])}) {
        didSet {
            if let line = lineChart {
                line.dataSource = self
                line.animateWithDuration(0.5)
            }
            
            if let candle = candleChart {
                candle.dataSource = self
                candle.animateWithDuration(0.5)
            }
        }
    }
    
    public func lineChart(frame: CGRect) -> ORKLineGraphChartView {
        let lineChart = ORKLineGraphChartView(frame: frame)
        lineChart.delegate = self
        lineChart.dataSource = self
        lineChart.showsVerticalReferenceLines = false
        lineChart.showsHorizontalReferenceLines = false
        lineChart.axisColor = UIColor(white: 1.0, alpha: 0.9)
        lineChart.tintColor = UIColor(white: 1.0, alpha: 0.5)
        lineChart.scrubberLineColor = UIColor(white: 1.0, alpha: 0.9)
        lineChart.referenceLineColor = UIColor(white: 1.0, alpha: 0.9)
        lineChart.scrubberThumbColor = UIColor(white: 1.0, alpha: 0.9)
        lineChart.verticalAxisTitleColor = UIColor(white: 1.0, alpha: 0.9)
        self.lineChart = lineChart
        return lineChart
    }
    
    public func candleChart(frame: CGRect) -> ORKDiscreteGraphChartView {
        let candleChart = ORKDiscreteGraphChartView(frame: frame)
        candleChart.delegate = self
        candleChart.dataSource = self
        candleChart.showsVerticalReferenceLines = false
        candleChart.showsHorizontalReferenceLines = false
        candleChart.axisColor = UIColor(white: 1.0, alpha: 0.7)
        candleChart.scrubberLineColor = UIColor(white: 1.0, alpha: 0.7)
        candleChart.referenceLineColor = UIColor(white: 1.0, alpha: 0.4)
        candleChart.scrubberThumbColor = UIColor(white: 1.0, alpha: 0.2)
        candleChart.verticalAxisTitleColor = UIColor(white: 1.0, alpha: 0.9)
        candleChart.referenceLineColor = UIColor(white: 1.0, alpha: 0.3)
        candleChart.noDataText = "No data available"
        //        candleChart.maximumValueImage
        candleChart.tintColor = UIColor(white: 1.0, alpha: 0.5)
        candleChart.alpha = 0
        self.candleChart = candleChart
        return candleChart
    }
    
    public func numberOfPlotsInGraphChartView(graphChartView: ORKGraphChartView) -> Int {
        return 1
    }
    
    public func graphChartView(graphChartView: ORKGraphChartView, pointForPointIndex pointIndex: Int, plotIndex: Int) -> ORKRangedPoint {
        guard let p = data else {return ORKRangedPoint(value: 0)}
        return p[pointIndex]
    }
    
    public func graphChartView(graphChartView: ORKGraphChartView, numberOfPointsForPlotIndex plotIndex: Int) -> Int {
        guard let p = data else {return 0}
        return p.count
    }
    
    public func graphChartView(graphChartView: ORKGraphChartView, titleForXAxisAtPointIndex pointIndex: Int) -> String? {
        return "\(pointIndex + 1)"
    }
    
    public func graphChartViewTouchesBegan(graphChartView: ORKGraphChartView) {
        
    }
    
    public func graphChartView(graphChartView: ORKGraphChartView, touchesMovedToXPosition xPosition: CGFloat) {
        
    }
    
    public func graphChartViewTouchesEnded(graphChartView: ORKGraphChartView) {
        
    }
    
    public func maximumValueForGraphChartView(graphChartView: ORKGraphChartView) -> CGFloat {
        guard let d = data else {return 0}
        return (d.map({$0.maximumValue}).maxElement() ?? 0) + 40
    }
    
    public func minimumValueForGraphChartView(graphChartView: ORKGraphChartView) -> CGFloat {
        guard let _ = data else {return 0}
        //        return (d.map({$0.minimumValue}).minElement() ?? 0) - 40
        return 0
    }
    
    public func scrubbingPlotIndexForGraphChartView(graphChartView: ORKGraphChartView) -> Int {
        return 0
    }
    
    //    public func numberOfDivisionsInXAxisForGraphChartView(graphChartView: ORKGraphChartView) -> Int {
    //        
    //    }
    
    public func graphChartView(graphChartView: ORKGraphChartView, colorForPlotIndex plotIndex: Int) -> UIColor {
        return UIColor(white: 1.0, alpha: 0.8)
    }
    
    public func graphChartView(graphChartView: ORKGraphChartView, drawsVerticalReferenceLineAtPointIndex pointIndex: Int) -> Bool {
        return false
    }
    
}*/

extension Array where Element: IntegerType {
    var total: Element {
        guard !isEmpty else { return 0 }
        return reduce(0){$0 + $1}
    }
    var average: Double {
        guard let total = total as? Int where !isEmpty else { return 0 }
        return Double(total)/Double(count)
    }
}

extension NSDate {
    var day: Int {
        return NSCalendar.currentCalendar().components([NSCalendarUnit.Day], fromDate: self).day
    }
}
