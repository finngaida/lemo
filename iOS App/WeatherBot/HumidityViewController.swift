//
//  HumidityViewController.swift
//  Lemo
//
//  Created by Finn Gaida on 11.06.16.
//  Copyright © 2016 Finn Gaida. All rights reserved.
//

import UIKit

class HumidityViewController: UIViewController {
    
    var dataSet:DataSet!
    var chart:HumidityView!
    var timer:NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Graph"
        
        chart = HumidityView(frame: CGRectMake(5, 70, self.view.frame.width - 10, self.view.frame.height - 130))
        chart.setDataSet(dataSet.data.map({ $0.humidity }))
        self.view.addSubview(chart)
        
        timer = NSTimer(timeInterval: 5.0, target: self, selector: #selector(HumidityViewController.reload), userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
    }
    
    func reload() {
        do {
            let data = try Manager.sharedManager.getAllData()
            
            if self.dataSet.data.count != data.data.count {
                self.dataSet = data
                chart.setDataSet(dataSet.data.map({ $0.humidity }))
                //chart.chart?.zoomAndCenterViewAnimated(scaleX: CGFloat(dataSet.data.count) / 15, scaleY: 1.0, xIndex: CGFloat(dataSet.data.count) - 1, yValue: 0.0, axis: (chart.chart?.rightAxis.axisDependency)!, duration: 0.0)
            }
        } catch let e {
            log.error("An error occurred while unwrapping latest data: \(e)")
            let alert = UIAlertController(title: "Oh nein!", message: "Es gab einen Fehler beim Laden der Daten, bitte versichere dich, dass mindestens eine Wetterstation online ist und versuche es dann nochmal!", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Erneut versuchen", style: .Default, handler: { (action) in
                self.reload()
            }))
            alert.addAction(UIAlertAction(title: "Schließen", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        timer.invalidate()
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
