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
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Refresh, target: self, action: #selector(ViewController.reload))
        let bg = GradientView(frame: self.view.frame)
        bg.colors = [UIColor(red: 1.000, green: 0.725, blue: 0.255, alpha: 1.00), UIColor(red: 0.988, green: 0.294, blue: 0.239, alpha: 1.00)]
        self.view.addSubview(bg)
        
        reload()
    }
    
    func reload() {
        guard let data = try? ConnectionManager.sharedManager.getLatestData() else {
            print("An error occurred while unwrapping latest data")
            let alert = UIAlertController(title: "Oh nein!", message: "Es gab einen Fehler beim Laden der Daten, bitte versichere dich, dass mindestens eine Wetterstation online ist und versuche es dann nochmal!", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Erneut versuchen", style: .Default, handler: { (action) in
                self.reload()
            }))
            alert.addAction(UIAlertAction(title: "Schließen", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return
        }
        
        self.data = data
        setupViews(data)
    }
    
    func setupViews(data: Data) {
        
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

