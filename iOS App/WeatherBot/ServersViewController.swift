//
//  SettingsViewController.swift
//  WeatherBot
//
//  Created by Finn Gaida on 11.06.16.
//  Copyright © 2016 Finn Gaida. All rights reserved.
//

import UIKit
import GradientView

class ServersViewController: UITableViewController {
    
    var stations:[Station]?
    
    override init(style: UITableViewStyle) {
        super.init(style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bg = GradientView(frame: self.view.frame)
        bg.colors = [UIColor(red: 0.349, green: 0.780, blue: 0.980, alpha: 1.00), UIColor(red: 0.000, green: 0.392, blue: 0.992, alpha: 1.00)]
        self.view.addSubview(bg)
        
        do {
            self.stations = try Manager.sharedManager.getAllStations()
            self.tableView.reloadData()
        } catch let e {
            let cause = "Couldn't get stations, because: \(e)"
            log.error(cause)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let stations = self.stations {
            return stations.count
        } else { return 0 }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
        
        if let stations = stations {
            let station = stations[indexPath.row]
            log.verbose("station: \(station)")
            cell.textLabel?.text = station.name
            cell.detailTextLabel?.text = station.capabilities.reduce("") { "\($0), \($1.self)" }
        }
        
        cell.accessoryType = .DisclosureIndicator
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
}
