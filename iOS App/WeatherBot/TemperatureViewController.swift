//
//  GraphViewController.swift
//  Lemo
//
//  Created by Finn Gaida on 11.06.16.
//  Copyright © 2016 Finn Gaida. All rights reserved.
//

import UIKit
import Charts

class TemperatureViewController: UIViewController {
    
    var dataSet:DataSet!
    var chart:TemperatureView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Graph"
        
        chart = TemperatureView(frame: CGRectMake(5, 70, self.view.frame.width - 10, self.view.frame.height - 130))
        chart.setDataSet(dataSet.data.map({ $0.temperature }))
        self.view.addSubview(chart)
        
        let timer = NSTimer(timeInterval: 1.0, target: self, selector: #selector(TemperatureViewController.reload), userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
    }
    
    func reload() {
        do {
            let data = try Manager.sharedManager.getAllData()
            
            if self.dataSet.data.count != data.data.count {
                self.dataSet = data
                chart.setDataSet(dataSet.data.map({ $0.temperature }))
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
