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
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Refresh, target: self, action: #selector(ServersViewController.reload))
        
        let bg = GradientView(frame: CGRectMake(0, -500, self.view.frame.width, self.view.frame.height + 1000))
        bg.colors = [UIColor(red: 0.349, green: 0.780, blue: 0.980, alpha: 1.00), UIColor(red: 0.000, green: 0.392, blue: 0.992, alpha: 1.00)]
        self.view.insertSubview(bg, atIndex: 0)
        self.tableView.backgroundColor = .clearColor()
        self.tableView.separatorColor = .whiteColor()
        
        do {
            self.stations = try Manager.sharedManager.getAllStations()
            self.tableView.reloadData()
        } catch let e {
            let cause = "Couldn't get stations, because: \(e)"
            log.error(cause)
        }
    }
    
    func reload() {
        
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
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! StationCell
        cell.backgroundColor = .clearColor()
        
        if let stations = stations {
            let station = stations[indexPath.row]
            log.verbose("station: \(station)")
            cell.titleLabel.text = station.name
            cell.subtitleLabel.text = "Temperatur, Luftdruck, Luftfeuchtigkeit" //station.capabilities.reduce("") { "\($0), \($1.rawValue)" }
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
}
