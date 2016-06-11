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

class ViewController: UIViewController {
    
    var data:Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UINavigationBar.appearance().tintColor = UIColor(red: 0.988, green: 0.294, blue: 0.239, alpha: 1.00)
        UIApplication.sharedApplication().keyWindow?.tintColor = UIColor(red: 0.988, green: 0.294, blue: 0.239, alpha: 1.00)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Refresh, target: self, action: #selector(ViewController.reload))
        let bg = GradientView(frame: self.view.frame)
        bg.colors = [UIColor(red: 1.000, green: 0.725, blue: 0.255, alpha: 1.00), UIColor(red: 0.988, green: 0.294, blue: 0.239, alpha: 1.00)]
        self.view.addSubview(bg)
        
        reload()
    }
    
    func reload() {
        do {
            let data = try ConnectionManager.sharedManager.getLatestData()
            self.data = data
            setupViews(data)
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
        guard let temp = data.temperature else { log.error("no temperature found on \(data)"); return }
        guard let press = data.pressure else { log.error("no pressure found on \(data)"); return }
        guard let humid = data.humidity else { log.error("no humidity found on \(data)"); return }
        
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
        let temperatureButton = TemperatureButton(temp: temp, frame: CGRectMake(margin, yOff + margin, width, height))
        let pressureButton = PressureButton(pressure: press, frame: CGRectMake(self.view.center.x + margin, yOff + margin, width, height))
        let humidityButton = HumidityButton(humidity: humid, frame: CGRectMake(margin, yOff + self.view.center.x + margin * 3, width, height))
        //let temperatureButton = TemperatureButton(temp: temp, frame: CGRectMake(0,0,self.view.frame.width / 2,self.view.frame.width / 2))
        
        [temperatureButton, pressureButton, humidityButton].forEach {
            self.view.addSubview($0)
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

