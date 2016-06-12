//
//  ViewController.swift
//  WeatherBot
//
//  Created by Finn Gaida on 11.06.16.
//  Copyright © 2016 Finn Gaida. All rights reserved.
//

import UIKit
import SwiftyBeaver
import GradientView
import ActionKit

class ViewController: UIViewController {
    
    var data:Data?
    var temperatureButton:TemperatureButton?
    var pressureButton:PressureButton?
    var humidityButton:HumidityButton?
    var moreButton:MoreButton?
    var timer:NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Refresh, target: self, action: #selector(ViewController.reload))
        let bg = GradientView(frame: self.view.frame)
        bg.colors = [UIColor(red: 1.000, green: 0.725, blue: 0.255, alpha: 1.00), Manager.sharedManager.color]
        self.view.addSubview(bg)
        
        timer = NSTimer(timeInterval: 2.0, target: self, selector: #selector(ViewController.reload), userInfo: nil, repeats: true)
    }
    
    override func viewWillAppear(animated: Bool) {
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
    }
    
    override func viewWillDisappear(animated: Bool) {
        timer.invalidate()
    }
    
    func reload() {
        do {
            if let data = try Manager.sharedManager.getLatestData() {
                self.data = data
                setupViews(data)
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
    
    func setupViews(data: Data) {
        
        // general
        let margin = self.view.frame.width / 20
        let width = self.view.center.x - margin * 2
        let height = width * 1.2
        let yOff = (self.navigationController?.navigationBar.frame.height ?? 46) + 20
        
        // setup separators
        let vertical = UIView(frame: CGRectMake(self.view.center.x - 1, yOff + 10, 1, self.view.frame.height - yOff * 2))
        let horizontal1 = UIView(frame: CGRectMake(10, yOff + height + margin * 2, self.view.frame.width - 20, 1))
        
        [vertical, horizontal1].forEach {
            $0.backgroundColor = .whiteColor()
            self.view.addSubview($0)
        }
        
        // setup buttons
        if let temperatureButton = self.temperatureButton {
            temperatureButton.setValue(data.temperature)
        } else {
            self.temperatureButton = TemperatureButton(temp: data.temperature, frame: CGRectMake(margin, yOff + margin, width, height), closure: {
                log.verbose("Temperature tapped")
                self.performSegueWithIdentifier("showTemperature", sender: self)
            })
            self.view.addSubview(self.temperatureButton!)
        }
        
        if let pressureButton = self.pressureButton {
            pressureButton.setValue(data.pressure)
        } else {
            self.pressureButton = PressureButton(pressure: data.pressure, frame: CGRectMake(self.view.center.x + margin, yOff + margin, width, height), closure: {
                log.verbose("Pressure tapped")
                self.performSegueWithIdentifier("showPressure", sender: self)
            })
            self.view.addSubview(self.pressureButton!)
        }
        
        if let humidityButton = self.humidityButton {
            humidityButton.setValue(data.humidity)
        } else {
            self.humidityButton = HumidityButton(humidity: data.humidity, frame: CGRectMake(margin, yOff + self.view.center.x + margin * 3, width, height), closure: {
                log.verbose("Humidity tapped")
                self.performSegueWithIdentifier("showHumidity", sender: self)
            })
            self.view.addSubview(self.humidityButton!)
        }
        
        if let moreButton = self.moreButton {
            moreButton.setValue("Mehr")
        } else {
            self.moreButton = MoreButton(text: "Mehr", frame: CGRectMake(self.view.center.x + margin, yOff + self.view.center.x + margin * 3, width, height), closure: {
                log.verbose("Mehr tapped")
                let alert = UIAlertController(title: "Mehr Sensoren", message: "Für mehr Sensorik, besuche bitte den Adafruit webstore", preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "Store öffnen", style: .Default, handler: { (action) in
                    UIApplication.sharedApplication().openURL(NSURL(string: "https://www.adafruit.com/category/35")!)
                }))
                alert.addAction(UIAlertAction(title: "Später", style: .Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            })
            self.view.addSubview(self.moreButton!)
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showTemperature" {
            if let dest = segue.destinationViewController as? TemperatureViewController {
                do {
                    dest.dataSet = try Manager.sharedManager.getAllData()
                } catch let e {
                    log.error("An error occurred: \(e)")
                }
            }
        } else if segue.identifier == "showPressure" {
            if let dest = segue.destinationViewController as? PressureViewController {
                do {
                    dest.dataSet = try Manager.sharedManager.getAllData()
                } catch let e {
                    log.error("An error occurred: \(e)")
                }
            }
        } else if segue.identifier == "showHumidity" {
            if let dest = segue.destinationViewController as? HumidityViewController {
                do {
                    dest.dataSet = try Manager.sharedManager.getAllData()
                } catch let e {
                    log.error("An error occurred: \(e)")
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

