//
//  ViewController.swift
//  WeatherBot
//
//  Created by Finn Gaida on 11.06.16.
//  Copyright © 2016 Finn Gaida. All rights reserved.
//

import UIKit
import SwiftyBeaver

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        if ConnectionManager.sharedManager.isConnectedToServer() {
            ConnectionManager.sharedManager.server?.getValues
        } else {
            log.debug("No server connected, showing dialog")
            self.tabBarController?.selectedIndex = 0
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

