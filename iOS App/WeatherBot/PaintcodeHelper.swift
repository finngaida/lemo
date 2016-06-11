//
//  PaintcodeHelper.swift
//  Lemo
//
//  Created by Finn Gaida on 11.06.16.
//  Copyright © 2016 Finn Gaida. All rights reserved.
//

import UIKit

class PaintcodeHelper: NSObject {

    class func drawPressure(frame frame: CGRect = CGRectMake(4, 0, 98, 100), onView:UIView) {
        //// Color Declarations
        let fillColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
        let fillColor2 = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
        
        //// Humidity_Filled.svg Group
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        let shapeLayer = CAShapeLayer()
        bezierPath.moveToPoint(CGPointMake(frame.minX - 2, frame.minY))
        bezierPath.addLineToPoint(CGPointMake(frame.minX + 40.26, frame.minY))
        bezierPath.addCurveToPoint(CGPointMake(frame.minX - 2, frame.minY + 37.61), controlPoint1: CGPointMake(frame.minX + 19.23, frame.minY - 0.08), controlPoint2: CGPointMake(frame.minX + 0.93, frame.minY + 17.14))
        bezierPath.addLineToPoint(CGPointMake(frame.minX - 2, frame.minY))
        bezierPath.closePath()
        bezierPath.miterLimit = 4;
        
        fillColor.setFill()
        bezierPath.fill()
        shapeLayer.path = bezierPath.CGPath
        onView.layer.addSublayer(shapeLayer)
        
        //// Bezier 2 Drawing
        let bezier2Path = UIBezierPath()
        let shapeLayer2 = CAShapeLayer()
        bezier2Path.moveToPoint(CGPointMake(frame.minX + 40.26, frame.minY))
        bezier2Path.addLineToPoint(CGPointMake(frame.minX + 41.89, frame.minY))
        bezier2Path.addCurveToPoint(CGPointMake(frame.minX + 83.59, frame.minY + 48.12), controlPoint1: CGPointMake(frame.minX + 66.37, frame.minY + 0.06), controlPoint2: CGPointMake(frame.minX + 86.96, frame.minY + 23.94))
        bezier2Path.addCurveToPoint(CGPointMake(frame.minX + 97.67, frame.minY + 78.62), controlPoint1: CGPointMake(frame.minX + 90.11, frame.minY + 57.29), controlPoint2: CGPointMake(frame.minX + 95.83, frame.minY + 67.35))
        bezier2Path.addLineToPoint(CGPointMake(frame.minX + 97.67, frame.minY + 82.42))
        bezier2Path.addCurveToPoint(CGPointMake(frame.minX + 77.91, frame.minY + 99.67), controlPoint1: CGPointMake(frame.minX + 95.65, frame.minY + 91.85), controlPoint2: CGPointMake(frame.minX + 87.74, frame.minY + 99.29))
        bezier2Path.addLineToPoint(CGPointMake(frame.minX + 77.35, frame.minY + 99.67))
        bezier2Path.addCurveToPoint(CGPointMake(frame.minX + 57.56, frame.minY + 82.62), controlPoint1: CGPointMake(frame.minX + 67.43, frame.minY + 99.39), controlPoint2: CGPointMake(frame.minX + 60.35, frame.minY + 91.55))
        bezier2Path.addCurveToPoint(CGPointMake(frame.minX + 23.77, frame.minY + 82.11), controlPoint1: CGPointMake(frame.minX + 46.7, frame.minY + 86.27), controlPoint2: CGPointMake(frame.minX + 34.4, frame.minY + 86.91))
        bezier2Path.addCurveToPoint(CGPointMake(frame.minX - 2, frame.minY + 47.68), controlPoint1: CGPointMake(frame.minX + 9.88, frame.minY + 76.26), controlPoint2: CGPointMake(frame.minX + 0.15, frame.minY + 62.43))
        bezier2Path.addLineToPoint(CGPointMake(frame.minX - 2, frame.minY + 37.61))
        bezier2Path.addCurveToPoint(CGPointMake(frame.minX + 40.26, frame.minY), controlPoint1: CGPointMake(frame.minX + 0.93, frame.minY + 17.14), controlPoint2: CGPointMake(frame.minX + 19.23, frame.minY - 0.08))
        bezier2Path.closePath()
        bezier2Path.miterLimit = 4;
        
        fillColor2.setFill()
        bezier2Path.fill()
        shapeLayer2.path = bezier2Path.CGPath
        onView.layer.addSublayer(shapeLayer2)
        
        
        //// Bezier 3 Drawing
        let bezier3Path = UIBezierPath()
        let shapeLayer3 = CAShapeLayer()
        bezier3Path.moveToPoint(CGPointMake(frame.minX + 41.89, frame.minY))
        bezier3Path.addLineToPoint(CGPointMake(frame.minX + 97.67, frame.minY))
        bezier3Path.addLineToPoint(CGPointMake(frame.minX + 97.67, frame.minY + 78.62))
        bezier3Path.addCurveToPoint(CGPointMake(frame.minX + 83.59, frame.minY + 48.12), controlPoint1: CGPointMake(frame.minX + 95.83, frame.minY + 67.35), controlPoint2: CGPointMake(frame.minX + 90.11, frame.minY + 57.29))
        bezier3Path.addCurveToPoint(CGPointMake(frame.minX + 41.89, frame.minY), controlPoint1: CGPointMake(frame.minX + 86.96, frame.minY + 23.94), controlPoint2: CGPointMake(frame.minX + 66.37, frame.minY + 0.06))
        bezier3Path.closePath()
        bezier3Path.miterLimit = 4;
        
        fillColor.setFill()
        bezier3Path.fill()
        shapeLayer3.path = bezier3Path.CGPath
        onView.layer.addSublayer(shapeLayer3)
        
        
        //// Bezier 4 Drawing
        let bezier4Path = UIBezierPath()
        let shapeLayer4 = CAShapeLayer()
        bezier4Path.moveToPoint(CGPointMake(frame.minX + 25.53, frame.minY + 7.18))
        bezier4Path.addCurveToPoint(CGPointMake(frame.minX + 72.75, frame.minY + 20.95), controlPoint1: CGPointMake(frame.minX + 41.89, frame.minY - 0.04), controlPoint2: CGPointMake(frame.minX + 63.08, frame.minY + 5.66))
        bezier4Path.addCurveToPoint(CGPointMake(frame.minX + 77.63, frame.minY + 44.01), controlPoint1: CGPointMake(frame.minX + 76.76, frame.minY + 27.55), controlPoint2: CGPointMake(frame.minX + 82.4, frame.minY + 36.48))
        bezier4Path.addCurveToPoint(CGPointMake(frame.minX + 68.27, frame.minY + 21.51), controlPoint1: CGPointMake(frame.minX + 74.92, frame.minY + 36.36), controlPoint2: CGPointMake(frame.minX + 73.77, frame.minY + 27.87))
        bezier4Path.addCurveToPoint(CGPointMake(frame.minX + 25.55, frame.minY + 11.52), controlPoint1: CGPointMake(frame.minX + 58.9, frame.minY + 8.31), controlPoint2: CGPointMake(frame.minX + 39.8, frame.minY + 4.94))
        bezier4Path.addCurveToPoint(CGPointMake(frame.minX + 5.91, frame.minY + 43.97), controlPoint1: CGPointMake(frame.minX + 13.63, frame.minY + 17.4), controlPoint2: CGPointMake(frame.minX + 5.26, frame.minY + 30.58))
        bezier4Path.addCurveToPoint(CGPointMake(frame.minX + 19.39, frame.minY + 70.34), controlPoint1: CGPointMake(frame.minX + 5.99, frame.minY + 54.22), controlPoint2: CGPointMake(frame.minX + 11.65, frame.minY + 63.89))
        bezier4Path.addCurveToPoint(CGPointMake(frame.minX + 59.26, frame.minY + 73.1), controlPoint1: CGPointMake(frame.minX + 30.59, frame.minY + 79.39), controlPoint2: CGPointMake(frame.minX + 46.72, frame.minY + 79.14))
        bezier4Path.addCurveToPoint(CGPointMake(frame.minX + 43.83, frame.minY + 81.45), controlPoint1: CGPointMake(frame.minX + 58.28, frame.minY + 80.61), controlPoint2: CGPointMake(frame.minX + 49.61, frame.minY + 80.65))
        bezier4Path.addCurveToPoint(CGPointMake(frame.minX + 2.01, frame.minY + 46.15), controlPoint1: CGPointMake(frame.minX + 23.2, frame.minY + 83.86), controlPoint2: CGPointMake(frame.minX + 3.54, frame.minY + 66.54))
        bezier4Path.addCurveToPoint(CGPointMake(frame.minX + 25.53, frame.minY + 7.18), controlPoint1: CGPointMake(frame.minX + 0.37, frame.minY + 29.92), controlPoint2: CGPointMake(frame.minX + 10.62, frame.minY + 13.48))
        bezier4Path.closePath()
        bezier4Path.miterLimit = 4;
        
        fillColor.setFill()
        bezier4Path.fill()
        shapeLayer4.path = bezier4Path.CGPath
        onView.layer.addSublayer(shapeLayer4)
        
        
        //// Bezier 5 Drawing
        let bezier5Path = UIBezierPath()
        let shapeLayer5 = CAShapeLayer()
        bezier5Path.moveToPoint(CGPointMake(frame.minX + 17.71, frame.minY + 52.11))
        bezier5Path.addCurveToPoint(CGPointMake(frame.minX + 39.56, frame.minY + 18.24), controlPoint1: CGPointMake(frame.minX + 10.8, frame.minY + 37.14), controlPoint2: CGPointMake(frame.minX + 23.06, frame.minY + 18.14))
        bezier5Path.addCurveToPoint(CGPointMake(frame.minX + 62.3, frame.minY + 23.32), controlPoint1: CGPointMake(frame.minX + 48.03, frame.minY + 16.19), controlPoint2: CGPointMake(frame.minX + 54.43, frame.minY + 25.12))
        bezier5Path.addCurveToPoint(CGPointMake(frame.minX + 65.81, frame.minY + 41.7), controlPoint1: CGPointMake(frame.minX + 60.71, frame.minY + 29.88), controlPoint2: CGPointMake(frame.minX + 65.79, frame.minY + 35.3))
        bezier5Path.addCurveToPoint(CGPointMake(frame.minX + 57.32, frame.minY + 61.35), controlPoint1: CGPointMake(frame.minX + 66.45, frame.minY + 49.18), controlPoint2: CGPointMake(frame.minX + 62.72, frame.minY + 56.41))
        bezier5Path.addCurveToPoint(CGPointMake(frame.minX + 53.35, frame.minY + 60.86), controlPoint1: CGPointMake(frame.minX + 56.32, frame.minY + 61.24), controlPoint2: CGPointMake(frame.minX + 54.33, frame.minY + 60.98))
        bezier5Path.addCurveToPoint(CGPointMake(frame.minX + 61.83, frame.minY + 43.95), controlPoint1: CGPointMake(frame.minX + 56.92, frame.minY + 55.67), controlPoint2: CGPointMake(frame.minX + 61.89, frame.minY + 50.67))
        bezier5Path.addCurveToPoint(CGPointMake(frame.minX + 58.28, frame.minY + 30.54), controlPoint1: CGPointMake(frame.minX + 62.21, frame.minY + 39.19), controlPoint2: CGPointMake(frame.minX + 60.13, frame.minY + 34.78))
        bezier5Path.addCurveToPoint(CGPointMake(frame.minX + 44.09, frame.minY + 45.91), controlPoint1: CGPointMake(frame.minX + 53.2, frame.minY + 35.3), controlPoint2: CGPointMake(frame.minX + 48.33, frame.minY + 40.35))
        bezier5Path.addCurveToPoint(CGPointMake(frame.minX + 36.47, frame.minY + 40.56), controlPoint1: CGPointMake(frame.minX + 41.12, frame.minY + 50.57), controlPoint2: CGPointMake(frame.minX + 33.38, frame.minY + 45.05))
        bezier5Path.addCurveToPoint(CGPointMake(frame.minX + 55.29, frame.minY + 26.99), controlPoint1: CGPointMake(frame.minX + 43.15, frame.minY + 36.64), controlPoint2: CGPointMake(frame.minX + 49.57, frame.minY + 32.25))
        bezier5Path.addCurveToPoint(CGPointMake(frame.minX + 35.67, frame.minY + 22.86), controlPoint1: CGPointMake(frame.minX + 49.55, frame.minY + 23.32), controlPoint2: CGPointMake(frame.minX + 42.47, frame.minY + 20.85))
        bezier5Path.addCurveToPoint(CGPointMake(frame.minX + 19.89, frame.minY + 43.91), controlPoint1: CGPointMake(frame.minX + 26.11, frame.minY + 24.52), controlPoint2: CGPointMake(frame.minX + 19.25, frame.minY + 34.44))
        bezier5Path.addCurveToPoint(CGPointMake(frame.minX + 28.3, frame.minY + 61.16), controlPoint1: CGPointMake(frame.minX + 19.83, frame.minY + 50.73), controlPoint2: CGPointMake(frame.minX + 24.99, frame.minY + 55.71))
        bezier5Path.addCurveToPoint(CGPointMake(frame.minX + 17.71, frame.minY + 52.11), controlPoint1: CGPointMake(frame.minX + 22.56, frame.minY + 62.83), controlPoint2: CGPointMake(frame.minX + 20.03, frame.minY + 56.07))
        bezier5Path.closePath()
        bezier5Path.miterLimit = 4;
        
        fillColor.setFill()
        bezier5Path.fill()
        shapeLayer5.path = bezier5Path.CGPath
        onView.layer.addSublayer(shapeLayer5)
        
        
        //// Bezier 6 Drawing
        let bezier6Path = UIBezierPath()
        let shapeLayer6 = CAShapeLayer()
        bezier6Path.moveToPoint(CGPointMake(frame.minX + 62.23, frame.minY + 75.57))
        bezier6Path.addCurveToPoint(CGPointMake(frame.minX + 77.73, frame.minY + 47.04), controlPoint1: CGPointMake(frame.minX + 64.88, frame.minY + 64.92), controlPoint2: CGPointMake(frame.minX + 71.61, frame.minY + 55.93))
        bezier6Path.addCurveToPoint(CGPointMake(frame.minX + 93.18, frame.minY + 75.69), controlPoint1: CGPointMake(frame.minX + 83.77, frame.minY + 56.01), controlPoint2: CGPointMake(frame.minX + 90.79, frame.minY + 64.9))
        bezier6Path.addCurveToPoint(CGPointMake(frame.minX + 79.77, frame.minY + 95.3), controlPoint1: CGPointMake(frame.minX + 95.57, frame.minY + 84.42), controlPoint2: CGPointMake(frame.minX + 88.9, frame.minY + 94.5))
        bezier6Path.addCurveToPoint(CGPointMake(frame.minX + 62.23, frame.minY + 75.57), controlPoint1: CGPointMake(frame.minX + 69.06, frame.minY + 97.25), controlPoint2: CGPointMake(frame.minX + 59.39, frame.minY + 85.85))
        bezier6Path.closePath()
        bezier6Path.miterLimit = 4;
        
        fillColor.setFill()
        bezier6Path.fill()
        shapeLayer6.path = bezier6Path.CGPath
        onView.layer.addSublayer(shapeLayer6)
        
        
        //// Bezier 7 Drawing
        let bezier7Path = UIBezierPath()
        let shapeLayer7 = CAShapeLayer()
        bezier7Path.moveToPoint(CGPointMake(frame.minX - 2, frame.minY + 47.68))
        bezier7Path.addCurveToPoint(CGPointMake(frame.minX + 23.77, frame.minY + 82.11), controlPoint1: CGPointMake(frame.minX + 0.15, frame.minY + 62.43), controlPoint2: CGPointMake(frame.minX + 9.88, frame.minY + 76.26))
        bezier7Path.addCurveToPoint(CGPointMake(frame.minX + 57.56, frame.minY + 82.62), controlPoint1: CGPointMake(frame.minX + 34.4, frame.minY + 86.91), controlPoint2: CGPointMake(frame.minX + 46.7, frame.minY + 86.27))
        bezier7Path.addCurveToPoint(CGPointMake(frame.minX + 77.35, frame.minY + 99.67), controlPoint1: CGPointMake(frame.minX + 60.35, frame.minY + 91.55), controlPoint2: CGPointMake(frame.minX + 67.43, frame.minY + 99.39))
        bezier7Path.addLineToPoint(CGPointMake(frame.minX - 2, frame.minY + 99.67))
        bezier7Path.addLineToPoint(CGPointMake(frame.minX - 2, frame.minY + 47.68))
        bezier7Path.closePath()
        bezier7Path.miterLimit = 4;
        
        fillColor.setFill()
        bezier7Path.fill()
        shapeLayer7.path = bezier7Path.CGPath
        onView.layer.addSublayer(shapeLayer7)
        
        
        //// Bezier 8 Drawing
        let bezier8Path = UIBezierPath()
        let shapeLayer8 = CAShapeLayer()
        bezier8Path.moveToPoint(CGPointMake(frame.minX + 66.87, frame.minY + 74.11))
        bezier8Path.addCurveToPoint(CGPointMake(frame.minX + 76.4, frame.minY + 61.49), controlPoint1: CGPointMake(frame.minX + 68.84, frame.minY + 69.35), controlPoint2: CGPointMake(frame.minX + 70.04, frame.minY + 61.85))
        bezier8Path.addCurveToPoint(CGPointMake(frame.minX + 69.78, frame.minY + 79.63), controlPoint1: CGPointMake(frame.minX + 74.46, frame.minY + 67.63), controlPoint2: CGPointMake(frame.minX + 70.56, frame.minY + 73.14))
        bezier8Path.addCurveToPoint(CGPointMake(frame.minX + 73.45, frame.minY + 88.88), controlPoint1: CGPointMake(frame.minX + 70.24, frame.minY + 82.96), controlPoint2: CGPointMake(frame.minX + 72.29, frame.minY + 85.77))
        bezier8Path.addCurveToPoint(CGPointMake(frame.minX + 66.87, frame.minY + 74.11), controlPoint1: CGPointMake(frame.minX + 66.03, frame.minY + 89.3), controlPoint2: CGPointMake(frame.minX + 64.5, frame.minY + 79.47))
        bezier8Path.closePath()
        bezier8Path.miterLimit = 4;
        
        fillColor2.setFill()
        bezier8Path.fill()
        shapeLayer8.path = bezier8Path.CGPath
        onView.layer.addSublayer(shapeLayer8)
        
        
        //// Bezier 9 Drawing
        let bezier9Path = UIBezierPath()
        let shapeLayer9 = CAShapeLayer()
        bezier9Path.moveToPoint(CGPointMake(frame.minX + 77.91, frame.minY + 99.67))
        bezier9Path.addCurveToPoint(CGPointMake(frame.minX + 97.67, frame.minY + 82.42), controlPoint1: CGPointMake(frame.minX + 87.74, frame.minY + 99.29), controlPoint2: CGPointMake(frame.minX + 95.65, frame.minY + 91.85))
        bezier9Path.addLineToPoint(CGPointMake(frame.minX + 97.67, frame.minY + 99.67))
        bezier9Path.addLineToPoint(CGPointMake(frame.minX + 77.91, frame.minY + 99.67))
        bezier9Path.closePath()
        bezier9Path.miterLimit = 4;
        
        fillColor.setFill()
        bezier9Path.fill()
        shapeLayer9.path = bezier9Path.CGPath
        onView.layer.addSublayer(shapeLayer9)
    }
    
    
    class func drawHumidity(frame frame: CGRect = CGRectMake(4, 0, 98, 100), onView:UIView) {
        //// Color Declarations
        let fillColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
        let fillColor3 = UIColor(red: 0.005, green: 0.005, blue: 0.005, alpha: 1.000)
        
        //// Dew Point Filled.svg Group
        //// Bezier 10 Drawing
        let bezier10Path = UIBezierPath()
        let shapeLayer10 = CAShapeLayer()
        bezier10Path.moveToPoint(CGPointMake(frame.minX + 10.59, frame.minY + 93.56))
        bezier10Path.addCurveToPoint(CGPointMake(frame.minX + 8.18, frame.minY + 56.26), controlPoint1: CGPointMake(frame.minX - 2.27, frame.minY + 87.17), controlPoint2: CGPointMake(frame.minX - 3.87, frame.minY + 64.63))
        bezier10Path.addCurveToPoint(CGPointMake(frame.minX + 11.8, frame.minY + 28.73), controlPoint1: CGPointMake(frame.minX + 11.4, frame.minY + 53.86), controlPoint2: CGPointMake(frame.minX + 11.8, frame.minY + 50.67))
        bezier10Path.addLineToPoint(CGPointMake(frame.minX + 11.8, frame.minY + 4))
        bezier10Path.addLineToPoint(CGPointMake(frame.minX + 21.84, frame.minY + 4))
        bezier10Path.addCurveToPoint(CGPointMake(frame.minX + 31.89, frame.minY + 7.99), controlPoint1: CGPointMake(frame.minX + 30.48, frame.minY + 4), controlPoint2: CGPointMake(frame.minX + 31.89, frame.minY + 4.6))
        bezier10Path.addCurveToPoint(CGPointMake(frame.minX + 34.9, frame.minY + 11.98), controlPoint1: CGPointMake(frame.minX + 31.89, frame.minY + 10.18), controlPoint2: CGPointMake(frame.minX + 33.3, frame.minY + 11.98))
        bezier10Path.addCurveToPoint(CGPointMake(frame.minX + 37.92, frame.minY + 13.97), controlPoint1: CGPointMake(frame.minX + 36.51, frame.minY + 11.98), controlPoint2: CGPointMake(frame.minX + 37.92, frame.minY + 12.98))
        bezier10Path.addCurveToPoint(CGPointMake(frame.minX + 34.9, frame.minY + 15.97), controlPoint1: CGPointMake(frame.minX + 37.92, frame.minY + 15.17), controlPoint2: CGPointMake(frame.minX + 36.51, frame.minY + 15.97))
        bezier10Path.addCurveToPoint(CGPointMake(frame.minX + 34.5, frame.minY + 20.75), controlPoint1: CGPointMake(frame.minX + 31.29, frame.minY + 15.97), controlPoint2: CGPointMake(frame.minX + 30.89, frame.minY + 19.16))
        bezier10Path.addCurveToPoint(CGPointMake(frame.minX + 34.5, frame.minY + 23.15), controlPoint1: CGPointMake(frame.minX + 36.51, frame.minY + 21.75), controlPoint2: CGPointMake(frame.minX + 36.51, frame.minY + 22.15))
        bezier10Path.addCurveToPoint(CGPointMake(frame.minX + 34.9, frame.minY + 27.93), controlPoint1: CGPointMake(frame.minX + 30.89, frame.minY + 24.74), controlPoint2: CGPointMake(frame.minX + 31.29, frame.minY + 27.93))
        bezier10Path.addCurveToPoint(CGPointMake(frame.minX + 37.92, frame.minY + 29.93), controlPoint1: CGPointMake(frame.minX + 36.51, frame.minY + 27.93), controlPoint2: CGPointMake(frame.minX + 37.92, frame.minY + 28.93))
        bezier10Path.addCurveToPoint(CGPointMake(frame.minX + 34.9, frame.minY + 31.92), controlPoint1: CGPointMake(frame.minX + 37.92, frame.minY + 31.13), controlPoint2: CGPointMake(frame.minX + 36.51, frame.minY + 31.92))
        bezier10Path.addCurveToPoint(CGPointMake(frame.minX + 34.5, frame.minY + 36.71), controlPoint1: CGPointMake(frame.minX + 31.29, frame.minY + 31.92), controlPoint2: CGPointMake(frame.minX + 30.89, frame.minY + 35.11))
        bezier10Path.addCurveToPoint(CGPointMake(frame.minX + 34.5, frame.minY + 39.1), controlPoint1: CGPointMake(frame.minX + 36.51, frame.minY + 37.71), controlPoint2: CGPointMake(frame.minX + 36.51, frame.minY + 38.11))
        bezier10Path.addCurveToPoint(CGPointMake(frame.minX + 34.9, frame.minY + 43.89), controlPoint1: CGPointMake(frame.minX + 30.89, frame.minY + 40.7), controlPoint2: CGPointMake(frame.minX + 31.29, frame.minY + 43.89))
        bezier10Path.addCurveToPoint(CGPointMake(frame.minX + 37.92, frame.minY + 45.89), controlPoint1: CGPointMake(frame.minX + 36.51, frame.minY + 43.89), controlPoint2: CGPointMake(frame.minX + 37.92, frame.minY + 44.89))
        bezier10Path.addCurveToPoint(CGPointMake(frame.minX + 34.9, frame.minY + 47.88), controlPoint1: CGPointMake(frame.minX + 37.92, frame.minY + 47.08), controlPoint2: CGPointMake(frame.minX + 36.51, frame.minY + 47.88))
        bezier10Path.addCurveToPoint(CGPointMake(frame.minX + 35.51, frame.minY + 56.26), controlPoint1: CGPointMake(frame.minX + 30.69, frame.minY + 47.88), controlPoint2: CGPointMake(frame.minX + 31.09, frame.minY + 53.07))
        bezier10Path.addCurveToPoint(CGPointMake(frame.minX + 32.49, frame.minY + 93.56), controlPoint1: CGPointMake(frame.minX + 47.76, frame.minY + 64.83), controlPoint2: CGPointMake(frame.minX + 45.96, frame.minY + 87.57))
        bezier10Path.addCurveToPoint(CGPointMake(frame.minX + 10.59, frame.minY + 93.56), controlPoint1: CGPointMake(frame.minX + 26.67, frame.minY + 96.15), controlPoint2: CGPointMake(frame.minX + 16.22, frame.minY + 96.15))
        bezier10Path.closePath()
        bezier10Path.moveToPoint(CGPointMake(frame.minX + 28.68, frame.minY + 76.8))
        bezier10Path.addCurveToPoint(CGPointMake(frame.minX + 25.66, frame.minY + 67.83), controlPoint1: CGPointMake(frame.minX + 29.88, frame.minY + 73.21), controlPoint2: CGPointMake(frame.minX + 28.27, frame.minY + 67.83))
        bezier10Path.addCurveToPoint(CGPointMake(frame.minX + 23.85, frame.minY + 47.88), controlPoint1: CGPointMake(frame.minX + 24.66, frame.minY + 67.83), controlPoint2: CGPointMake(frame.minX + 23.85, frame.minY + 58.85))
        bezier10Path.addCurveToPoint(CGPointMake(frame.minX + 21.84, frame.minY + 27.93), controlPoint1: CGPointMake(frame.minX + 23.85, frame.minY + 35.91), controlPoint2: CGPointMake(frame.minX + 23.05, frame.minY + 27.93))
        bezier10Path.addCurveToPoint(CGPointMake(frame.minX + 19.84, frame.minY + 47.28), controlPoint1: CGPointMake(frame.minX + 20.64, frame.minY + 27.93), controlPoint2: CGPointMake(frame.minX + 19.84, frame.minY + 35.71))
        bezier10Path.addCurveToPoint(CGPointMake(frame.minX + 16.82, frame.minY + 69.82), controlPoint1: CGPointMake(frame.minX + 19.84, frame.minY + 61.64), controlPoint2: CGPointMake(frame.minX + 19.03, frame.minY + 67.43))
        bezier10Path.addCurveToPoint(CGPointMake(frame.minX + 15.01, frame.minY + 76.6), controlPoint1: CGPointMake(frame.minX + 15.01, frame.minY + 71.81), controlPoint2: CGPointMake(frame.minX + 14.21, frame.minY + 74.81))
        bezier10Path.addCurveToPoint(CGPointMake(frame.minX + 28.68, frame.minY + 76.8), controlPoint1: CGPointMake(frame.minX + 16.62, frame.minY + 80.59), controlPoint2: CGPointMake(frame.minX + 27.07, frame.minY + 80.99))
        bezier10Path.closePath()
        bezier10Path.miterLimit = 4;
        
        fillColor3.setFill()
        bezier10Path.fill()
        shapeLayer10.path = bezier10Path.CGPath
        onView.layer.addSublayer(shapeLayer10)
        
        
        //// Bezier 11 Drawing
        let bezier11Path = UIBezierPath()
        let shapeLayer11 = CAShapeLayer()
        bezier11Path.moveToPoint(CGPointMake(frame.minX + 76.5, frame.minY + 81.39))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 74.09, frame.minY + 74.21), controlPoint1: CGPointMake(frame.minX + 75.09, frame.minY + 79.99), controlPoint2: CGPointMake(frame.minX + 74.09, frame.minY + 76.8))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 84.13, frame.minY + 53.86), controlPoint1: CGPointMake(frame.minX + 74.09, frame.minY + 69.42), controlPoint2: CGPointMake(frame.minX + 81.72, frame.minY + 53.86))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 89.76, frame.minY + 61.64), controlPoint1: CGPointMake(frame.minX + 84.73, frame.minY + 53.86), controlPoint2: CGPointMake(frame.minX + 87.35, frame.minY + 57.25))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 84.13, frame.minY + 83.78), controlPoint1: CGPointMake(frame.minX + 97.19, frame.minY + 74.61), controlPoint2: CGPointMake(frame.minX + 94.78, frame.minY + 83.78))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 76.5, frame.minY + 81.39), controlPoint1: CGPointMake(frame.minX + 81.32, frame.minY + 83.78), controlPoint2: CGPointMake(frame.minX + 77.9, frame.minY + 82.78))
        bezier11Path.closePath()
        bezier11Path.miterLimit = 4;
        
        fillColor3.setFill()
        bezier11Path.fill()
        shapeLayer11.path = bezier11Path.CGPath
        onView.layer.addSublayer(shapeLayer11)
        
        
        //// Bezier 12 Drawing
        let bezier12Path = UIBezierPath()
        let shapeLayer12 = CAShapeLayer()
        bezier12Path.moveToPoint(CGPointMake(frame.minX + 58.41, frame.minY + 53.46))
        bezier12Path.addCurveToPoint(CGPointMake(frame.minX + 59.42, frame.minY + 36.91), controlPoint1: CGPointMake(frame.minX + 55.2, frame.minY + 50.27), controlPoint2: CGPointMake(frame.minX + 55.4, frame.minY + 45.29))
        bezier12Path.addCurveToPoint(CGPointMake(frame.minX + 70.67, frame.minY + 36.91), controlPoint1: CGPointMake(frame.minX + 63.64, frame.minY + 28.13), controlPoint2: CGPointMake(frame.minX + 66.45, frame.minY + 28.13))
        bezier12Path.addCurveToPoint(CGPointMake(frame.minX + 65.04, frame.minY + 55.86), controlPoint1: CGPointMake(frame.minX + 76.3, frame.minY + 48.68), controlPoint2: CGPointMake(frame.minX + 74.09, frame.minY + 55.86))
        bezier12Path.addCurveToPoint(CGPointMake(frame.minX + 58.41, frame.minY + 53.46), controlPoint1: CGPointMake(frame.minX + 62.63, frame.minY + 55.86), controlPoint2: CGPointMake(frame.minX + 59.82, frame.minY + 54.86))
        bezier12Path.closePath()
        bezier12Path.miterLimit = 4;
        
        fillColor3.setFill()
        bezier12Path.fill()
        shapeLayer12.path = bezier12Path.CGPath
        onView.layer.addSublayer(shapeLayer12)
        
        
        //// Bezier 13 Drawing
        let bezier13Path = UIBezierPath()
        let shapeLayer13 = CAShapeLayer()
        bezier13Path.moveToPoint(CGPointMake(frame.minX + 78.71, frame.minY + 26.54))
        bezier13Path.addCurveToPoint(CGPointMake(frame.minX + 79.51, frame.minY + 9.78), controlPoint1: CGPointMake(frame.minX + 75.09, frame.minY + 25.14), controlPoint2: CGPointMake(frame.minX + 75.49, frame.minY + 16.57))
        bezier13Path.addCurveToPoint(CGPointMake(frame.minX + 84.13, frame.minY + 4), controlPoint1: CGPointMake(frame.minX + 81.52, frame.minY + 6.59), controlPoint2: CGPointMake(frame.minX + 83.53, frame.minY + 4))
        bezier13Path.addCurveToPoint(CGPointMake(frame.minX + 92.17, frame.minY + 20.55), controlPoint1: CGPointMake(frame.minX + 86.54, frame.minY + 4), controlPoint2: CGPointMake(frame.minX + 92.17, frame.minY + 15.77))
        bezier13Path.addCurveToPoint(CGPointMake(frame.minX + 78.71, frame.minY + 26.54), controlPoint1: CGPointMake(frame.minX + 92.17, frame.minY + 26.74), controlPoint2: CGPointMake(frame.minX + 85.94, frame.minY + 29.53))
        bezier13Path.closePath()
        bezier13Path.miterLimit = 4;
        
        fillColor3.setFill()
        bezier13Path.fill()
        shapeLayer13.path = bezier13Path.CGPath
        onView.layer.addSublayer(shapeLayer13)
        
        
        
        
        //// Group 8
        //// Bezier 14 Drawing
        let bezier14Path = UIBezierPath()
        let shapeLayer14 = CAShapeLayer()
        bezier14Path.moveToPoint(CGPointMake(frame.minX - 4, frame.minY + 50))
        bezier14Path.addLineToPoint(CGPointMake(frame.minX - 4, frame.minY))
        bezier14Path.addLineToPoint(CGPointMake(frame.minX + 46, frame.minY))
        bezier14Path.addLineToPoint(CGPointMake(frame.minX + 96, frame.minY))
        bezier14Path.addLineToPoint(CGPointMake(frame.minX + 96, frame.minY + 50))
        bezier14Path.addLineToPoint(CGPointMake(frame.minX + 96, frame.minY + 100))
        bezier14Path.addLineToPoint(CGPointMake(frame.minX + 46, frame.minY + 100))
        bezier14Path.addLineToPoint(CGPointMake(frame.minX - 4, frame.minY + 100))
        bezier14Path.addLineToPoint(CGPointMake(frame.minX - 4, frame.minY + 50))
        bezier14Path.closePath()
        bezier14Path.moveToPoint(CGPointMake(frame.minX + 38.2, frame.minY + 90.2))
        bezier14Path.addCurveToPoint(CGPointMake(frame.minX + 44, frame.minY + 74), controlPoint1: CGPointMake(frame.minX + 43.2, frame.minY + 85.2), controlPoint2: CGPointMake(frame.minX + 44, frame.minY + 82.8))
        bezier14Path.addCurveToPoint(CGPointMake(frame.minX + 38, frame.minY + 57.6), controlPoint1: CGPointMake(frame.minX + 44, frame.minY + 65.2), controlPoint2: CGPointMake(frame.minX + 43.2, frame.minY + 62.8))
        bezier14Path.addCurveToPoint(CGPointMake(frame.minX + 35, frame.minY + 48), controlPoint1: CGPointMake(frame.minX + 31.4, frame.minY + 51), controlPoint2: CGPointMake(frame.minX + 30.4, frame.minY + 48))
        bezier14Path.addCurveToPoint(CGPointMake(frame.minX + 38, frame.minY + 46), controlPoint1: CGPointMake(frame.minX + 36.6, frame.minY + 48), controlPoint2: CGPointMake(frame.minX + 38, frame.minY + 47.2))
        bezier14Path.addCurveToPoint(CGPointMake(frame.minX + 35, frame.minY + 44), controlPoint1: CGPointMake(frame.minX + 38, frame.minY + 45), controlPoint2: CGPointMake(frame.minX + 36.6, frame.minY + 44))
        bezier14Path.addCurveToPoint(CGPointMake(frame.minX + 34.6, frame.minY + 39.2), controlPoint1: CGPointMake(frame.minX + 31.4, frame.minY + 44), controlPoint2: CGPointMake(frame.minX + 31, frame.minY + 40.8))
        bezier14Path.addCurveToPoint(CGPointMake(frame.minX + 34.6, frame.minY + 36.8), controlPoint1: CGPointMake(frame.minX + 36.6, frame.minY + 38.2), controlPoint2: CGPointMake(frame.minX + 36.6, frame.minY + 37.8))
        bezier14Path.addCurveToPoint(CGPointMake(frame.minX + 35, frame.minY + 32), controlPoint1: CGPointMake(frame.minX + 31, frame.minY + 35.2), controlPoint2: CGPointMake(frame.minX + 31.4, frame.minY + 32))
        bezier14Path.addCurveToPoint(CGPointMake(frame.minX + 38, frame.minY + 30), controlPoint1: CGPointMake(frame.minX + 36.6, frame.minY + 32), controlPoint2: CGPointMake(frame.minX + 38, frame.minY + 31.2))
        bezier14Path.addCurveToPoint(CGPointMake(frame.minX + 35, frame.minY + 28), controlPoint1: CGPointMake(frame.minX + 38, frame.minY + 29), controlPoint2: CGPointMake(frame.minX + 36.6, frame.minY + 28))
        bezier14Path.addCurveToPoint(CGPointMake(frame.minX + 34.6, frame.minY + 23.2), controlPoint1: CGPointMake(frame.minX + 31.4, frame.minY + 28), controlPoint2: CGPointMake(frame.minX + 31, frame.minY + 24.8))
        bezier14Path.addCurveToPoint(CGPointMake(frame.minX + 34.6, frame.minY + 20.8), controlPoint1: CGPointMake(frame.minX + 36.6, frame.minY + 22.2), controlPoint2: CGPointMake(frame.minX + 36.6, frame.minY + 21.8))
        bezier14Path.addCurveToPoint(CGPointMake(frame.minX + 35, frame.minY + 16), controlPoint1: CGPointMake(frame.minX + 31, frame.minY + 19.2), controlPoint2: CGPointMake(frame.minX + 31.4, frame.minY + 16))
        bezier14Path.addCurveToPoint(CGPointMake(frame.minX + 38, frame.minY + 14), controlPoint1: CGPointMake(frame.minX + 36.6, frame.minY + 16), controlPoint2: CGPointMake(frame.minX + 38, frame.minY + 15.2))
        bezier14Path.addCurveToPoint(CGPointMake(frame.minX + 35, frame.minY + 12), controlPoint1: CGPointMake(frame.minX + 38, frame.minY + 13), controlPoint2: CGPointMake(frame.minX + 36.6, frame.minY + 12))
        bezier14Path.addCurveToPoint(CGPointMake(frame.minX + 32, frame.minY + 8), controlPoint1: CGPointMake(frame.minX + 33.4, frame.minY + 12), controlPoint2: CGPointMake(frame.minX + 32, frame.minY + 10.2))
        bezier14Path.addCurveToPoint(CGPointMake(frame.minX + 22, frame.minY + 4), controlPoint1: CGPointMake(frame.minX + 32, frame.minY + 4.6), controlPoint2: CGPointMake(frame.minX + 30.6, frame.minY + 4))
        bezier14Path.addLineToPoint(CGPointMake(frame.minX + 12, frame.minY + 4))
        bezier14Path.addLineToPoint(CGPointMake(frame.minX + 12, frame.minY + 27.8))
        bezier14Path.addCurveToPoint(CGPointMake(frame.minX + 6, frame.minY + 57.6), controlPoint1: CGPointMake(frame.minX + 12, frame.minY + 51.6), controlPoint2: CGPointMake(frame.minX + 12, frame.minY + 51.6))
        bezier14Path.addCurveToPoint(CGPointMake(frame.minX, frame.minY + 74), controlPoint1: CGPointMake(frame.minX + 0.8, frame.minY + 62.8), controlPoint2: CGPointMake(frame.minX, frame.minY + 65.2))
        bezier14Path.addCurveToPoint(CGPointMake(frame.minX + 5.8, frame.minY + 90.2), controlPoint1: CGPointMake(frame.minX, frame.minY + 82.8), controlPoint2: CGPointMake(frame.minX + 0.8, frame.minY + 85.2))
        bezier14Path.addCurveToPoint(CGPointMake(frame.minX + 22, frame.minY + 96), controlPoint1: CGPointMake(frame.minX + 10.8, frame.minY + 95.2), controlPoint2: CGPointMake(frame.minX + 13.2, frame.minY + 96))
        bezier14Path.addCurveToPoint(CGPointMake(frame.minX + 38.2, frame.minY + 90.2), controlPoint1: CGPointMake(frame.minX + 30.8, frame.minY + 96), controlPoint2: CGPointMake(frame.minX + 33.2, frame.minY + 95.2))
        bezier14Path.closePath()
        bezier14Path.moveToPoint(CGPointMake(frame.minX + 91.6, frame.minY + 81.6))
        bezier14Path.addCurveToPoint(CGPointMake(frame.minX + 89.8, frame.minY + 60.8), controlPoint1: CGPointMake(frame.minX + 95.2, frame.minY + 78), controlPoint2: CGPointMake(frame.minX + 94.4, frame.minY + 68.2))
        bezier14Path.addCurveToPoint(CGPointMake(frame.minX + 84, frame.minY + 54), controlPoint1: CGPointMake(frame.minX + 87.6, frame.minY + 57), controlPoint2: CGPointMake(frame.minX + 85, frame.minY + 54))
        bezier14Path.addCurveToPoint(CGPointMake(frame.minX + 74, frame.minY + 73.4), controlPoint1: CGPointMake(frame.minX + 81, frame.minY + 54), controlPoint2: CGPointMake(frame.minX + 74, frame.minY + 67.4))
        bezier14Path.addCurveToPoint(CGPointMake(frame.minX + 84, frame.minY + 84), controlPoint1: CGPointMake(frame.minX + 74, frame.minY + 80.6), controlPoint2: CGPointMake(frame.minX + 77.2, frame.minY + 84))
        bezier14Path.addCurveToPoint(CGPointMake(frame.minX + 91.6, frame.minY + 81.6), controlPoint1: CGPointMake(frame.minX + 86.8, frame.minY + 84), controlPoint2: CGPointMake(frame.minX + 90.2, frame.minY + 83))
        bezier14Path.closePath()
        bezier14Path.moveToPoint(CGPointMake(frame.minX + 73.6, frame.minY + 49.2))
        bezier14Path.addCurveToPoint(CGPointMake(frame.minX + 66.8, frame.minY + 29.8), controlPoint1: CGPointMake(frame.minX + 74.4, frame.minY + 43), controlPoint2: CGPointMake(frame.minX + 71, frame.minY + 33.4))
        bezier14Path.addCurveToPoint(CGPointMake(frame.minX + 57.4, frame.minY + 54.8), controlPoint1: CGPointMake(frame.minX + 61.4, frame.minY + 25.2), controlPoint2: CGPointMake(frame.minX + 52.2, frame.minY + 49.4))
        bezier14Path.addCurveToPoint(CGPointMake(frame.minX + 66, frame.minY + 55.6), controlPoint1: CGPointMake(frame.minX + 58.2, frame.minY + 55.6), controlPoint2: CGPointMake(frame.minX + 62, frame.minY + 56))
        bezier14Path.addCurveToPoint(CGPointMake(frame.minX + 73.6, frame.minY + 49.2), controlPoint1: CGPointMake(frame.minX + 72, frame.minY + 55), controlPoint2: CGPointMake(frame.minX + 73, frame.minY + 54.2))
        bezier14Path.closePath()
        bezier14Path.moveToPoint(CGPointMake(frame.minX + 91.6, frame.minY + 21.6))
        bezier14Path.addCurveToPoint(CGPointMake(frame.minX + 84, frame.minY + 4), controlPoint1: CGPointMake(frame.minX + 92.2, frame.minY + 15.8), controlPoint2: CGPointMake(frame.minX + 87.2, frame.minY + 4))
        bezier14Path.addCurveToPoint(CGPointMake(frame.minX + 76, frame.minY + 20.6), controlPoint1: CGPointMake(frame.minX + 81.2, frame.minY + 4), controlPoint2: CGPointMake(frame.minX + 76, frame.minY + 15))
        bezier14Path.addCurveToPoint(CGPointMake(frame.minX + 85, frame.minY + 27.6), controlPoint1: CGPointMake(frame.minX + 76, frame.minY + 27), controlPoint2: CGPointMake(frame.minX + 77.8, frame.minY + 28.4))
        bezier14Path.addCurveToPoint(CGPointMake(frame.minX + 91.6, frame.minY + 21.6), controlPoint1: CGPointMake(frame.minX + 89.8, frame.minY + 27.2), controlPoint2: CGPointMake(frame.minX + 91.2, frame.minY + 26))
        bezier14Path.closePath()
        bezier14Path.miterLimit = 4;
        
        fillColor.setFill()
        bezier14Path.fill()
        shapeLayer14.path = bezier14Path.CGPath
        onView.layer.addSublayer(shapeLayer14)
        
        
        //// Bezier 15 Drawing
        let bezier15Path = UIBezierPath()
        let shapeLayer15 = CAShapeLayer()
        bezier15Path.moveToPoint(CGPointMake(frame.minX + 16.2, frame.minY + 76.2))
        bezier15Path.addCurveToPoint(CGPointMake(frame.minX + 17, frame.minY + 70), controlPoint1: CGPointMake(frame.minX + 14.6, frame.minY + 73.4), controlPoint2: CGPointMake(frame.minX + 14.8, frame.minY + 71.8))
        bezier15Path.addCurveToPoint(CGPointMake(frame.minX + 20, frame.minY + 47.8), controlPoint1: CGPointMake(frame.minX + 19.2, frame.minY + 68.2), controlPoint2: CGPointMake(frame.minX + 20, frame.minY + 62.8))
        bezier15Path.addCurveToPoint(CGPointMake(frame.minX + 22, frame.minY + 28), controlPoint1: CGPointMake(frame.minX + 20, frame.minY + 36), controlPoint2: CGPointMake(frame.minX + 20.8, frame.minY + 28))
        bezier15Path.addCurveToPoint(CGPointMake(frame.minX + 24, frame.minY + 47), controlPoint1: CGPointMake(frame.minX + 23.2, frame.minY + 28), controlPoint2: CGPointMake(frame.minX + 24, frame.minY + 35.6))
        bezier15Path.addCurveToPoint(CGPointMake(frame.minX + 26.4, frame.minY + 69.8), controlPoint1: CGPointMake(frame.minX + 24, frame.minY + 58), controlPoint2: CGPointMake(frame.minX + 25, frame.minY + 67.6))
        bezier15Path.addCurveToPoint(CGPointMake(frame.minX + 27.4, frame.minY + 76.8), controlPoint1: CGPointMake(frame.minX + 27.6, frame.minY + 71.8), controlPoint2: CGPointMake(frame.minX + 28, frame.minY + 75))
        bezier15Path.addCurveToPoint(CGPointMake(frame.minX + 16.2, frame.minY + 76.2), controlPoint1: CGPointMake(frame.minX + 25.6, frame.minY + 81.2), controlPoint2: CGPointMake(frame.minX + 18.6, frame.minY + 80.8))
        bezier15Path.closePath()
        bezier15Path.miterLimit = 4;
        
        fillColor.setFill()
        bezier15Path.fill()
        shapeLayer15.path = bezier15Path.CGPath
        onView.layer.addSublayer(shapeLayer15)
    }

    class func drawSun(frame frame: CGRect = CGRectMake(4, 0, 98, 100), onView:UIView) {
        //// Color Declarations
        let fillColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
        let fillColor3 = UIColor(red: 0.005, green: 0.005, blue: 0.005, alpha: 1.000)
        let fillColor4 = UIColor(red: 0.660, green: 0.660, blue: 0.660, alpha: 1.000)
        
        //// ic_wb_sunny_3x.svg Group
        //// Group 2
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        let shapeLayer = CAShapeLayer()
        bezierPath.moveToPoint(CGPointMake(frame.minX + 31.4, frame.minY + 26.76))
        bezierPath.addCurveToPoint(CGPointMake(frame.minX + 33.22, frame.minY + 23.4), controlPoint1: CGPointMake(frame.minX + 31.01, frame.minY + 25.8), controlPoint2: CGPointMake(frame.minX + 31.79, frame.minY + 24.36))
        bezierPath.addCurveToPoint(CGPointMake(frame.minX + 36.6, frame.minY + 23.24), controlPoint1: CGPointMake(frame.minX + 34.78, frame.minY + 22.45), controlPoint2: CGPointMake(frame.minX + 36.08, frame.minY + 22.45))
        bezierPath.addCurveToPoint(CGPointMake(frame.minX + 34.78, frame.minY + 26.6), controlPoint1: CGPointMake(frame.minX + 36.99, frame.minY + 24.2), controlPoint2: CGPointMake(frame.minX + 36.21, frame.minY + 25.64))
        bezierPath.addCurveToPoint(CGPointMake(frame.minX + 31.4, frame.minY + 26.76), controlPoint1: CGPointMake(frame.minX + 33.22, frame.minY + 27.55), controlPoint2: CGPointMake(frame.minX + 31.92, frame.minY + 27.55))
        bezierPath.closePath()
        bezierPath.miterLimit = 4;
        
        fillColor4.setFill()
        bezierPath.fill()
        shapeLayer.path = bezierPath.CGPath
        onView.layer.addSublayer(shapeLayer)
        
        //// Group 4
        //// Bezier 2 Drawing
        let bezier2Path = UIBezierPath()
        let shapeLayer2 = CAShapeLayer()
        bezier2Path.moveToPoint(CGPointMake(frame.minX + 41.04, frame.minY + 94.44))
        bezier2Path.addCurveToPoint(CGPointMake(frame.minX + 40.76, frame.minY + 86.31), controlPoint1: CGPointMake(frame.minX + 40.62, frame.minY + 93.31), controlPoint2: CGPointMake(frame.minX + 40.48, frame.minY + 89.67))
        bezier2Path.addCurveToPoint(CGPointMake(frame.minX + 46.08, frame.minY + 80.15), controlPoint1: CGPointMake(frame.minX + 41.18, frame.minY + 80.29), controlPoint2: CGPointMake(frame.minX + 41.32, frame.minY + 80.15))
        bezier2Path.addLineToPoint(CGPointMake(frame.minX + 50.98, frame.minY + 80.15))
        bezier2Path.addLineToPoint(CGPointMake(frame.minX + 50.98, frame.minY + 87.85))
        bezier2Path.addCurveToPoint(CGPointMake(frame.minX + 46.36, frame.minY + 95.98), controlPoint1: CGPointMake(frame.minX + 50.98, frame.minY + 95.56), controlPoint2: CGPointMake(frame.minX + 50.98, frame.minY + 95.56))
        bezier2Path.addCurveToPoint(CGPointMake(frame.minX + 41.04, frame.minY + 94.44), controlPoint1: CGPointMake(frame.minX + 43.42, frame.minY + 96.26), controlPoint2: CGPointMake(frame.minX + 41.6, frame.minY + 95.7))
        bezier2Path.closePath()
        bezier2Path.miterLimit = 4;
        
        fillColor3.setFill()
        bezier2Path.fill()
        shapeLayer2.path = bezier2Path.CGPath
        onView.layer.addSublayer(shapeLayer2)
        
        
        //// Bezier 3 Drawing
        let bezier3Path = UIBezierPath()
        let shapeLayer3 = CAShapeLayer()
        bezier3Path.moveToPoint(CGPointMake(frame.minX + 12.05, frame.minY + 81.13))
        bezier3Path.addLineToPoint(CGPointMake(frame.minX + 8.26, frame.minY + 77.21))
        bezier3Path.addLineToPoint(CGPointMake(frame.minX + 13.17, frame.minY + 72.44))
        bezier3Path.addLineToPoint(CGPointMake(frame.minX + 18.07, frame.minY + 67.68))
        bezier3Path.addLineToPoint(CGPointMake(frame.minX + 22.27, frame.minY + 71.74))
        bezier3Path.addLineToPoint(CGPointMake(frame.minX + 26.47, frame.minY + 75.8))
        bezier3Path.addLineToPoint(CGPointMake(frame.minX + 21.99, frame.minY + 80.43))
        bezier3Path.addCurveToPoint(CGPointMake(frame.minX + 16.67, frame.minY + 85.05), controlPoint1: CGPointMake(frame.minX + 19.47, frame.minY + 82.95), controlPoint2: CGPointMake(frame.minX + 17.09, frame.minY + 85.05))
        bezier3Path.addCurveToPoint(CGPointMake(frame.minX + 12.05, frame.minY + 81.13), controlPoint1: CGPointMake(frame.minX + 16.25, frame.minY + 85.05), controlPoint2: CGPointMake(frame.minX + 14.15, frame.minY + 83.23))
        bezier3Path.closePath()
        bezier3Path.miterLimit = 4;
        
        fillColor3.setFill()
        bezier3Path.fill()
        shapeLayer3.path = bezier3Path.CGPath
        onView.layer.addSublayer(shapeLayer3)
        
        
        //// Bezier 4 Drawing
        let bezier4Path = UIBezierPath()
        let shapeLayer4 = CAShapeLayer()
        bezier4Path.moveToPoint(CGPointMake(frame.minX + 70.17, frame.minY + 80.43))
        bezier4Path.addLineToPoint(CGPointMake(frame.minX + 65.69, frame.minY + 75.8))
        bezier4Path.addLineToPoint(CGPointMake(frame.minX + 69.89, frame.minY + 71.74))
        bezier4Path.addLineToPoint(CGPointMake(frame.minX + 74.09, frame.minY + 67.68))
        bezier4Path.addLineToPoint(CGPointMake(frame.minX + 78.99, frame.minY + 72.44))
        bezier4Path.addLineToPoint(CGPointMake(frame.minX + 83.9, frame.minY + 77.21))
        bezier4Path.addLineToPoint(CGPointMake(frame.minX + 80.11, frame.minY + 81.13))
        bezier4Path.addCurveToPoint(CGPointMake(frame.minX + 75.49, frame.minY + 85.05), controlPoint1: CGPointMake(frame.minX + 78.01, frame.minY + 83.23), controlPoint2: CGPointMake(frame.minX + 75.91, frame.minY + 85.05))
        bezier4Path.addCurveToPoint(CGPointMake(frame.minX + 70.17, frame.minY + 80.43), controlPoint1: CGPointMake(frame.minX + 75.07, frame.minY + 85.05), controlPoint2: CGPointMake(frame.minX + 72.69, frame.minY + 82.95))
        bezier4Path.closePath()
        bezier4Path.miterLimit = 4;
        
        fillColor3.setFill()
        bezier4Path.fill()
        shapeLayer4.path = bezier4Path.CGPath
        onView.layer.addSublayer(shapeLayer4)
        
        
        //// Bezier 5 Drawing
        let bezier5Path = UIBezierPath()
        let shapeLayer5 = CAShapeLayer()
        bezier5Path.moveToPoint(CGPointMake(frame.minX + 35.58, frame.minY + 72.58))
        bezier5Path.addCurveToPoint(CGPointMake(frame.minX + 19.47, frame.minY + 47.93), controlPoint1: CGPointMake(frame.minX + 24.93, frame.minY + 67.68), controlPoint2: CGPointMake(frame.minX + 19.47, frame.minY + 59.27))
        bezier5Path.addCurveToPoint(CGPointMake(frame.minX + 35.58, frame.minY + 23.27), controlPoint1: CGPointMake(frame.minX + 19.47, frame.minY + 36.58), controlPoint2: CGPointMake(frame.minX + 24.93, frame.minY + 28.18))
        bezier5Path.addCurveToPoint(CGPointMake(frame.minX + 56.58, frame.minY + 23.27), controlPoint1: CGPointMake(frame.minX + 42.72, frame.minY + 19.91), controlPoint2: CGPointMake(frame.minX + 49.44, frame.minY + 19.91))
        bezier5Path.addCurveToPoint(CGPointMake(frame.minX + 72.69, frame.minY + 47.93), controlPoint1: CGPointMake(frame.minX + 67.23, frame.minY + 28.18), controlPoint2: CGPointMake(frame.minX + 72.69, frame.minY + 36.58))
        bezier5Path.addCurveToPoint(CGPointMake(frame.minX + 71.15, frame.minY + 58.01), controlPoint1: CGPointMake(frame.minX + 72.69, frame.minY + 51.29), controlPoint2: CGPointMake(frame.minX + 71.99, frame.minY + 55.77))
        bezier5Path.addCurveToPoint(CGPointMake(frame.minX + 46.08, frame.minY + 75.24), controlPoint1: CGPointMake(frame.minX + 67.79, frame.minY + 66.98), controlPoint2: CGPointMake(frame.minX + 55.88, frame.minY + 75.24))
        bezier5Path.addCurveToPoint(CGPointMake(frame.minX + 35.58, frame.minY + 72.58), controlPoint1: CGPointMake(frame.minX + 43.42, frame.minY + 75.24), controlPoint2: CGPointMake(frame.minX + 38.66, frame.minY + 73.98))
        bezier5Path.closePath()
        bezier5Path.miterLimit = 4;
        
        fillColor3.setFill()
        bezier5Path.fill()
        shapeLayer5.path = bezier5Path.CGPath
        onView.layer.addSublayer(shapeLayer5)
        
        
        //// Bezier 6 Drawing
        let bezier6Path = UIBezierPath()
        let shapeLayer6 = CAShapeLayer()
        bezier6Path.moveToPoint(CGPointMake(frame.minX - 0.98, frame.minY + 52.27))
        bezier6Path.addCurveToPoint(CGPointMake(frame.minX - 1.26, frame.minY + 46.25), controlPoint1: CGPointMake(frame.minX - 1.4, frame.minY + 51.15), controlPoint2: CGPointMake(frame.minX - 1.54, frame.minY + 48.49))
        bezier6Path.addCurveToPoint(CGPointMake(frame.minX + 6.16, frame.minY + 42.32), controlPoint1: CGPointMake(frame.minX - 0.84, frame.minY + 42.46), controlPoint2: CGPointMake(frame.minX - 0.42, frame.minY + 42.32))
        bezier6Path.addLineToPoint(CGPointMake(frame.minX + 13.17, frame.minY + 42.32))
        bezier6Path.addLineToPoint(CGPointMake(frame.minX + 13.17, frame.minY + 47.93))
        bezier6Path.addLineToPoint(CGPointMake(frame.minX + 13.17, frame.minY + 53.53))
        bezier6Path.addLineToPoint(CGPointMake(frame.minX + 6.44, frame.minY + 53.95))
        bezier6Path.addCurveToPoint(CGPointMake(frame.minX - 0.98, frame.minY + 52.27), controlPoint1: CGPointMake(frame.minX + 1.68, frame.minY + 54.23), controlPoint2: CGPointMake(frame.minX - 0.42, frame.minY + 53.81))
        bezier6Path.closePath()
        bezier6Path.miterLimit = 4;
        
        fillColor3.setFill()
        bezier6Path.fill()
        shapeLayer6.path = bezier6Path.CGPath
        onView.layer.addSublayer(shapeLayer6)
        
        
        //// Bezier 7 Drawing
        let bezier7Path = UIBezierPath()
        let shapeLayer7 = CAShapeLayer()
        bezier7Path.moveToPoint(CGPointMake(frame.minX + 78.85, frame.minY + 52.27))
        bezier7Path.addCurveToPoint(CGPointMake(frame.minX + 78.57, frame.minY + 46.25), controlPoint1: CGPointMake(frame.minX + 78.43, frame.minY + 51.15), controlPoint2: CGPointMake(frame.minX + 78.29, frame.minY + 48.49))
        bezier7Path.addCurveToPoint(CGPointMake(frame.minX + 86, frame.minY + 42.32), controlPoint1: CGPointMake(frame.minX + 78.99, frame.minY + 42.46), controlPoint2: CGPointMake(frame.minX + 79.41, frame.minY + 42.32))
        bezier7Path.addLineToPoint(CGPointMake(frame.minX + 93, frame.minY + 42.32))
        bezier7Path.addLineToPoint(CGPointMake(frame.minX + 93, frame.minY + 47.93))
        bezier7Path.addLineToPoint(CGPointMake(frame.minX + 93, frame.minY + 53.53))
        bezier7Path.addLineToPoint(CGPointMake(frame.minX + 86.28, frame.minY + 53.95))
        bezier7Path.addCurveToPoint(CGPointMake(frame.minX + 78.85, frame.minY + 52.27), controlPoint1: CGPointMake(frame.minX + 81.52, frame.minY + 54.23), controlPoint2: CGPointMake(frame.minX + 79.41, frame.minY + 53.81))
        bezier7Path.closePath()
        bezier7Path.miterLimit = 4;
        
        fillColor3.setFill()
        bezier7Path.fill()
        shapeLayer7.path = bezier7Path.CGPath
        onView.layer.addSublayer(shapeLayer7)
        
        
        //// Bezier 8 Drawing
        let bezier8Path = UIBezierPath()
        let shapeLayer8 = CAShapeLayer()
        bezier8Path.moveToPoint(CGPointMake(frame.minX + 12.75, frame.minY + 22.99))
        bezier8Path.addLineToPoint(CGPointMake(frame.minX + 8.26, frame.minY + 18.37))
        bezier8Path.addLineToPoint(CGPointMake(frame.minX + 12.47, frame.minY + 14.31))
        bezier8Path.addLineToPoint(CGPointMake(frame.minX + 16.67, frame.minY + 10.25))
        bezier8Path.addLineToPoint(CGPointMake(frame.minX + 21.57, frame.minY + 15.01))
        bezier8Path.addLineToPoint(CGPointMake(frame.minX + 26.47, frame.minY + 19.77))
        bezier8Path.addLineToPoint(CGPointMake(frame.minX + 22.69, frame.minY + 23.69))
        bezier8Path.addCurveToPoint(CGPointMake(frame.minX + 18.07, frame.minY + 27.62), controlPoint1: CGPointMake(frame.minX + 20.59, frame.minY + 25.79), controlPoint2: CGPointMake(frame.minX + 18.49, frame.minY + 27.62))
        bezier8Path.addCurveToPoint(CGPointMake(frame.minX + 12.75, frame.minY + 22.99), controlPoint1: CGPointMake(frame.minX + 17.65, frame.minY + 27.62), controlPoint2: CGPointMake(frame.minX + 15.27, frame.minY + 25.51))
        bezier8Path.closePath()
        bezier8Path.miterLimit = 4;
        
        fillColor3.setFill()
        bezier8Path.fill()
        shapeLayer8.path = bezier8Path.CGPath
        onView.layer.addSublayer(shapeLayer8)
        
        
        //// Bezier 9 Drawing
        let bezier9Path = UIBezierPath()
        let shapeLayer9 = CAShapeLayer()
        bezier9Path.moveToPoint(CGPointMake(frame.minX + 69.47, frame.minY + 23.69))
        bezier9Path.addLineToPoint(CGPointMake(frame.minX + 65.69, frame.minY + 19.77))
        bezier9Path.addLineToPoint(CGPointMake(frame.minX + 70.59, frame.minY + 15.01))
        bezier9Path.addLineToPoint(CGPointMake(frame.minX + 75.49, frame.minY + 10.25))
        bezier9Path.addLineToPoint(CGPointMake(frame.minX + 79.69, frame.minY + 14.31))
        bezier9Path.addLineToPoint(CGPointMake(frame.minX + 83.9, frame.minY + 18.37))
        bezier9Path.addLineToPoint(CGPointMake(frame.minX + 79.41, frame.minY + 22.99))
        bezier9Path.addCurveToPoint(CGPointMake(frame.minX + 74.09, frame.minY + 27.62), controlPoint1: CGPointMake(frame.minX + 76.89, frame.minY + 25.51), controlPoint2: CGPointMake(frame.minX + 74.51, frame.minY + 27.62))
        bezier9Path.addCurveToPoint(CGPointMake(frame.minX + 69.47, frame.minY + 23.69), controlPoint1: CGPointMake(frame.minX + 73.67, frame.minY + 27.62), controlPoint2: CGPointMake(frame.minX + 71.57, frame.minY + 25.79))
        bezier9Path.closePath()
        bezier9Path.miterLimit = 4;
        
        fillColor3.setFill()
        bezier9Path.fill()
        shapeLayer9.path = bezier9Path.CGPath
        onView.layer.addSublayer(shapeLayer9)
        
        
        //// Bezier 10 Drawing
        let bezier10Path = UIBezierPath()
        let shapeLayer10 = CAShapeLayer()
        bezier10Path.moveToPoint(CGPointMake(frame.minX + 41.46, frame.minY + 15.57))
        bezier10Path.addCurveToPoint(CGPointMake(frame.minX + 40.48, frame.minY + 7.72), controlPoint1: CGPointMake(frame.minX + 40.9, frame.minY + 15.01), controlPoint2: CGPointMake(frame.minX + 40.48, frame.minY + 11.51))
        bezier10Path.addLineToPoint(CGPointMake(frame.minX + 40.48, frame.minY + 1))
        bezier10Path.addLineToPoint(CGPointMake(frame.minX + 46.22, frame.minY + 1))
        bezier10Path.addLineToPoint(CGPointMake(frame.minX + 51.82, frame.minY + 1))
        bezier10Path.addLineToPoint(CGPointMake(frame.minX + 51.4, frame.minY + 8.42))
        bezier10Path.addCurveToPoint(CGPointMake(frame.minX + 46.78, frame.minY + 16.13), controlPoint1: CGPointMake(frame.minX + 50.98, frame.minY + 15.43), controlPoint2: CGPointMake(frame.minX + 50.84, frame.minY + 15.71))
        bezier10Path.addCurveToPoint(CGPointMake(frame.minX + 41.46, frame.minY + 15.57), controlPoint1: CGPointMake(frame.minX + 44.4, frame.minY + 16.41), controlPoint2: CGPointMake(frame.minX + 42.02, frame.minY + 16.13))
        bezier10Path.closePath()
        bezier10Path.miterLimit = 4;
        
        fillColor3.setFill()
        bezier10Path.fill()
        shapeLayer10.path = bezier10Path.CGPath
        onView.layer.addSublayer(shapeLayer10)
        
        
        
        
        //// Group 5
        //// Bezier 11 Drawing
        let bezier11Path = UIBezierPath()
        let shapeLayer11 = CAShapeLayer()
        bezier11Path.moveToPoint(CGPointMake(frame.minX - 4, frame.minY + 50))
        bezier11Path.addLineToPoint(CGPointMake(frame.minX - 4, frame.minY))
        bezier11Path.addLineToPoint(CGPointMake(frame.minX + 46, frame.minY))
        bezier11Path.addLineToPoint(CGPointMake(frame.minX + 96, frame.minY))
        bezier11Path.addLineToPoint(CGPointMake(frame.minX + 96, frame.minY + 50))
        bezier11Path.addLineToPoint(CGPointMake(frame.minX + 96, frame.minY + 100))
        bezier11Path.addLineToPoint(CGPointMake(frame.minX + 46, frame.minY + 100))
        bezier11Path.addLineToPoint(CGPointMake(frame.minX - 4, frame.minY + 100))
        bezier11Path.addLineToPoint(CGPointMake(frame.minX - 4, frame.minY + 50))
        bezier11Path.closePath()
        bezier11Path.moveToPoint(CGPointMake(frame.minX + 48.78, frame.minY + 87.5))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 46, frame.minY + 81.94), controlPoint1: CGPointMake(frame.minX + 48.78, frame.minY + 82.92), controlPoint2: CGPointMake(frame.minX + 48.36, frame.minY + 81.94))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 43.22, frame.minY + 87.5), controlPoint1: CGPointMake(frame.minX + 43.64, frame.minY + 81.94), controlPoint2: CGPointMake(frame.minX + 43.22, frame.minY + 82.92))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 46, frame.minY + 93.06), controlPoint1: CGPointMake(frame.minX + 43.22, frame.minY + 92.08), controlPoint2: CGPointMake(frame.minX + 43.64, frame.minY + 93.06))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 48.78, frame.minY + 87.5), controlPoint1: CGPointMake(frame.minX + 48.36, frame.minY + 93.06), controlPoint2: CGPointMake(frame.minX + 48.78, frame.minY + 92.08))
        bezier11Path.closePath()
        bezier11Path.moveToPoint(CGPointMake(frame.minX + 20.72, frame.minY + 78.75))
        bezier11Path.addLineToPoint(CGPointMake(frame.minX + 23.78, frame.minY + 75.42))
        bezier11Path.addLineToPoint(CGPointMake(frame.minX + 21, frame.minY + 72.92))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 14.75, frame.minY + 73.61), controlPoint1: CGPointMake(frame.minX + 18.22, frame.minY + 70.42), controlPoint2: CGPointMake(frame.minX + 18.08, frame.minY + 70.42))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 13.64, frame.minY + 79.44), controlPoint1: CGPointMake(frame.minX + 11.56, frame.minY + 76.67), controlPoint2: CGPointMake(frame.minX + 11.42, frame.minY + 77.08))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 20.72, frame.minY + 78.75), controlPoint1: CGPointMake(frame.minX + 16.56, frame.minY + 82.64), controlPoint2: CGPointMake(frame.minX + 17.11, frame.minY + 82.64))
        bezier11Path.closePath()
        bezier11Path.moveToPoint(CGPointMake(frame.minX + 78.36, frame.minY + 79.44))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 77.25, frame.minY + 73.61), controlPoint1: CGPointMake(frame.minX + 80.58, frame.minY + 77.08), controlPoint2: CGPointMake(frame.minX + 80.44, frame.minY + 76.67))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 71, frame.minY + 72.92), controlPoint1: CGPointMake(frame.minX + 73.92, frame.minY + 70.42), controlPoint2: CGPointMake(frame.minX + 73.78, frame.minY + 70.42))
        bezier11Path.addLineToPoint(CGPointMake(frame.minX + 68.22, frame.minY + 75.42))
        bezier11Path.addLineToPoint(CGPointMake(frame.minX + 71.28, frame.minY + 78.75))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 78.36, frame.minY + 79.44), controlPoint1: CGPointMake(frame.minX + 74.89, frame.minY + 82.64), controlPoint2: CGPointMake(frame.minX + 75.44, frame.minY + 82.64))
        bezier11Path.closePath()
        bezier11Path.moveToPoint(CGPointMake(frame.minX + 60.72, frame.minY + 67.36))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 69.61, frame.minY + 47.92), controlPoint1: CGPointMake(frame.minX + 67.11, frame.minY + 62.36), controlPoint2: CGPointMake(frame.minX + 69.61, frame.minY + 57.08))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 60.31, frame.minY + 28.19), controlPoint1: CGPointMake(frame.minX + 69.61, frame.minY + 38.61), controlPoint2: CGPointMake(frame.minX + 67.11, frame.minY + 33.47))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 45.86, frame.minY + 24.31), controlPoint1: CGPointMake(frame.minX + 55.86, frame.minY + 24.86), controlPoint2: CGPointMake(frame.minX + 54.06, frame.minY + 24.31))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 25.44, frame.minY + 34.72), controlPoint1: CGPointMake(frame.minX + 35.44, frame.minY + 24.31), controlPoint2: CGPointMake(frame.minX + 31.14, frame.minY + 26.53))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 24.47, frame.minY + 59.72), controlPoint1: CGPointMake(frame.minX + 21.69, frame.minY + 40.28), controlPoint2: CGPointMake(frame.minX + 21.14, frame.minY + 53.33))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 38.36, frame.minY + 71.25), controlPoint1: CGPointMake(frame.minX + 26.69, frame.minY + 64.17), controlPoint2: CGPointMake(frame.minX + 33.92, frame.minY + 70.14))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 60.72, frame.minY + 67.36), controlPoint1: CGPointMake(frame.minX + 44.61, frame.minY + 73.06), controlPoint2: CGPointMake(frame.minX + 55.86, frame.minY + 71.11))
        bezier11Path.closePath()
        bezier11Path.moveToPoint(CGPointMake(frame.minX + 11.28, frame.minY + 47.92))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 6.42, frame.minY + 44.44), controlPoint1: CGPointMake(frame.minX + 11.28, frame.minY + 44.86), controlPoint2: CGPointMake(frame.minX + 10.72, frame.minY + 44.44))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 1.56, frame.minY + 47.92), controlPoint1: CGPointMake(frame.minX + 2.11, frame.minY + 44.44), controlPoint2: CGPointMake(frame.minX + 1.56, frame.minY + 44.86))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 6.42, frame.minY + 51.39), controlPoint1: CGPointMake(frame.minX + 1.56, frame.minY + 50.97), controlPoint2: CGPointMake(frame.minX + 2.11, frame.minY + 51.39))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 11.28, frame.minY + 47.92), controlPoint1: CGPointMake(frame.minX + 10.72, frame.minY + 51.39), controlPoint2: CGPointMake(frame.minX + 11.28, frame.minY + 50.97))
        bezier11Path.closePath()
        bezier11Path.moveToPoint(CGPointMake(frame.minX + 90.44, frame.minY + 47.92))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 85.58, frame.minY + 44.44), controlPoint1: CGPointMake(frame.minX + 90.44, frame.minY + 44.86), controlPoint2: CGPointMake(frame.minX + 89.89, frame.minY + 44.44))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 80.72, frame.minY + 47.92), controlPoint1: CGPointMake(frame.minX + 81.28, frame.minY + 44.44), controlPoint2: CGPointMake(frame.minX + 80.72, frame.minY + 44.86))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 85.58, frame.minY + 51.39), controlPoint1: CGPointMake(frame.minX + 80.72, frame.minY + 50.97), controlPoint2: CGPointMake(frame.minX + 81.28, frame.minY + 51.39))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 90.44, frame.minY + 47.92), controlPoint1: CGPointMake(frame.minX + 89.89, frame.minY + 51.39), controlPoint2: CGPointMake(frame.minX + 90.44, frame.minY + 50.97))
        bezier11Path.closePath()
        bezier11Path.moveToPoint(CGPointMake(frame.minX + 21.42, frame.minY + 22.5))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 20.31, frame.minY + 16.67), controlPoint1: CGPointMake(frame.minX + 23.64, frame.minY + 20.14), controlPoint2: CGPointMake(frame.minX + 23.5, frame.minY + 19.72))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 14.06, frame.minY + 15.97), controlPoint1: CGPointMake(frame.minX + 16.97, frame.minY + 13.47), controlPoint2: CGPointMake(frame.minX + 16.83, frame.minY + 13.47))
        bezier11Path.addLineToPoint(CGPointMake(frame.minX + 11.28, frame.minY + 18.47))
        bezier11Path.addLineToPoint(CGPointMake(frame.minX + 14.33, frame.minY + 21.81))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 21.42, frame.minY + 22.5), controlPoint1: CGPointMake(frame.minX + 17.94, frame.minY + 25.69), controlPoint2: CGPointMake(frame.minX + 18.5, frame.minY + 25.69))
        bezier11Path.closePath()
        bezier11Path.moveToPoint(CGPointMake(frame.minX + 77.67, frame.minY + 21.81))
        bezier11Path.addLineToPoint(CGPointMake(frame.minX + 80.72, frame.minY + 18.47))
        bezier11Path.addLineToPoint(CGPointMake(frame.minX + 77.94, frame.minY + 15.97))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 71.69, frame.minY + 16.67), controlPoint1: CGPointMake(frame.minX + 75.17, frame.minY + 13.47), controlPoint2: CGPointMake(frame.minX + 75.03, frame.minY + 13.47))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 70.58, frame.minY + 22.5), controlPoint1: CGPointMake(frame.minX + 68.5, frame.minY + 19.72), controlPoint2: CGPointMake(frame.minX + 68.36, frame.minY + 20.14))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 77.67, frame.minY + 21.81), controlPoint1: CGPointMake(frame.minX + 73.5, frame.minY + 25.69), controlPoint2: CGPointMake(frame.minX + 74.06, frame.minY + 25.69))
        bezier11Path.closePath()
        bezier11Path.moveToPoint(CGPointMake(frame.minX + 48.78, frame.minY + 7.64))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 46, frame.minY + 1.39), controlPoint1: CGPointMake(frame.minX + 48.78, frame.minY + 2.36), controlPoint2: CGPointMake(frame.minX + 48.36, frame.minY + 1.39))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 43.22, frame.minY + 7.64), controlPoint1: CGPointMake(frame.minX + 43.64, frame.minY + 1.39), controlPoint2: CGPointMake(frame.minX + 43.22, frame.minY + 2.36))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 46, frame.minY + 13.89), controlPoint1: CGPointMake(frame.minX + 43.22, frame.minY + 12.92), controlPoint2: CGPointMake(frame.minX + 43.64, frame.minY + 13.89))
        bezier11Path.addCurveToPoint(CGPointMake(frame.minX + 48.78, frame.minY + 7.64), controlPoint1: CGPointMake(frame.minX + 48.36, frame.minY + 13.89), controlPoint2: CGPointMake(frame.minX + 48.78, frame.minY + 12.92))
        bezier11Path.closePath()
        bezier11Path.miterLimit = 4;
        
        fillColor.setFill()
        bezier11Path.fill()
        shapeLayer11.path = bezier11Path.CGPath
        onView.layer.addSublayer(shapeLayer11)
    }

}
