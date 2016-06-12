//
//  ConnectionManager.swift
//  WeatherBot
//
//  Created by Finn Gaida on 11.06.16.
//  Copyright © 2016 Finn Gaida. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit

let root = "http://172.16.110.45:2101/Weather/"

enum Status {
    case Success, Error(reason: String)
}

class Manager: NSObject {
    
    static let sharedManager = Manager()
    var availableStations:[Station]?
    var data:DataSet?
    var latestData:Data = Data(pk: 0, temperature: 0, pressure: 0, humidity: 0, timestamp: NSDate(timeIntervalSinceReferenceDate:0))
    var latestTimestamp:NSDate = NSDate()
    
    let color = UIColor(red: 0.988, green: 0.294, blue: 0.239, alpha: 1.00)
    
    func xLabelsFromSet(set:DataSet) -> [String] {
        return set.data.map({ (data) -> String in
            let d = NSDateFormatter()
            d.dateFormat = "HH:mm"
            return d.stringFromDate(data.timestamp)
        })
    }
    
    func dataArrayFromSet(set:DataSet, filteredCapability:Capability) -> [Double] {
        return set.data.map({ (data) -> Double in
            let capabilities:[Capability] = [.Temperature, .Humidity, .Pressure]
            return [data.temperature, data.pressure, data.humidity][capabilities.indexOf(filteredCapability) ?? 0]
        })
    }
    
    func getAllStations() throws -> [Station] {
        func fetchStations() throws -> [Station] {
            log.verbose("fetching stations")
            
            guard let url = NSURL(string: root + "stations") else {
                let cause = "Couldn't get URL from \(root)stations"
                log.error(cause)
                throw E.Unwrap(cause: cause)
            }
            
            log.verbose("URL is \(url)")
            
            //let data = try NSData(contentsOfURL: url, options: NSDataReadingOptions.DataReadingMappedIfSafe)
            let data = try NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("demostations", ofType: "json")!, options: NSDataReadingOptions.DataReadingMappedIfSafe)
            log.verbose("got string from server"/*: \(String(data: data, encoding: NSUTF8StringEncoding))"*/)
            
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableLeaves)
            
            log.verbose("got json"/*: \(json)"*/)
            
            guard let dict = json as? Array<Dictionary<String,AnyObject>> else {
                let cause = "Couldn't convert \(json) to Dictionary"
                log.error(cause)
                throw E.Conversion(cause: cause)
            }
            
            log.verbose("got dictionary"/*: \(dict)"*/)
            
            let stations = try dict.map { try Station.fromDict($0) }
            log.verbose("returning dataset"/* \(dataset)"*/)
            
            self.availableStations = stations
            return stations
        }
        
        return try fetchStations()
        
        // TODO
        //if let s = availableStations {
        //log.verbose("found data already"/*: \(d)"*/)
        
        //if d.latestTimestamp == self.latestTimestamp {
        //log.verbose("data is relevant enough, return cached data")
        //return d
        //} else {
        //log.verbose("cached data is outdate, get new one")
        //return try fetchData()
        //}
        //} else {
        //log.verbose("no data cached, fetch new data")
        //return try fetchData()
        //}
    }
    
    func getLatestData() throws -> Data? {
        log.verbose("Starting to get data")
        let data = try getAllData().data
        guard let latest = data.last else { throw E.Unwrap(cause: "Couldn't unwrap \(data).first") }
        
        log.verbose("comparing \(latestData.timestamp) to \(latest.timestamp)")
        if latestData.timestamp != latest.timestamp {
            self.latestData = latest
            return latest
        } else {
            return nil
        }
    }
    
    func getData(forTimestamp:NSDate) throws -> Data {
        fatalError("Not yet implemented")
    }
    
    var cachedData:NSData?
    var cachedArray:Array<Dictionary<String,AnyObject>>?
    func getAllData() throws -> DataSet {
        func fetchData() throws -> DataSet {
            log.verbose("fetching new data")
            
            guard let url = NSURL(string: root + "fetchall") else {
                let cause = "Couldn't get URL from \(root)fetchall"
                log.error(cause)
                throw E.Unwrap(cause: cause)
            }
            
            log.verbose("URL is \(url)")
            
            let b = NSUserDefaults.standardUserDefaults().boolForKey("demo")
            log.info("getting data in " + (b ? "demo" : "live") + " mode")
            
            let data = b ? try NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("demo", ofType: "json")!, options: NSDataReadingOptions.DataReadingMappedIfSafe) : try NSData(contentsOfURL: url, options: NSDataReadingOptions.DataReadingMappedIfSafe)
            log.verbose("got string from server"/*: \(String(data: data, encoding: NSUTF8StringEncoding))"*/)
            
            // check for duplicate 1
            if let cache = cachedData where cache == data {
                log.info("nothing new, aborting")
                return self.data!
            } else {
                cachedData = data
            }
            
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableLeaves)
            
            log.verbose("got json"/*: \(json)"*/)
            
            guard var array = json as? Array<Dictionary<String,AnyObject>> else {
                let cause = "Couldn't convert \(json) to Dictionary"
                log.error(cause)
                throw E.Conversion(cause: cause)
            }
            
            // check for duplicate 2
            if let cache2 = cachedArray where cache2.count == array.count {
                log.info("new, but no new entries? aborting")
                return self.data!
            } else {
                cachedArray = array
            }
            
            // Only use first 150 entries
            log.verbose("array has \(array.count) entries")
            if array.count > 51 {
                array = Array(array[array.count-51..<array.count-1])
            }
            log.verbose("now array has \(array.count) entries")
            
            log.verbose("got dictionary"/*: \(dict)"*/)
            
            let dataset = try DataSet.fromDicts(array)
            log.info("returning new dataset"/* \(dataset)"*/)
            
            self.data = dataset
            self.latestTimestamp = dataset.latestTimestamp
            return dataset
        }
        
        return try fetchData()
        
        //if let d = data {
        //log.verbose("found data already"/*: \(d)"*/)
        
        //if d.latestTimestamp == self.latestTimestamp {
        //log.verbose("data is relevant enough, return cached data")
        //return d
        //} else {
        //log.verbose("cached data is outdate, get new one")
        //return try fetchData()
        //}
        //} else {
        //log.verbose("no data cached, fetch new data")
        //return try fetchData()
        //}
    }
    
}

struct DataSet {
    var data:[Data]
    let latestTimestamp:NSDate
    
    static func fromDicts(dicts:Array<Dictionary<String,AnyObject>>) throws -> DataSet {
        log.verbose("attempting to convert dict \(dicts) into dataset")
        
        let data = try dicts.map { try Data.fromDict($0) }
        log.verbose("converted dict into Data models: \(data)")
        
        let times = data.sort({ $0.0.timestamp.timeIntervalSinceReferenceDate > $0.1.timestamp.timeIntervalSinceReferenceDate })
        guard let latest = times.first else {
            let cause = "Couldn't unwrap \(times).first"
            log.error(cause)
            throw E.Unwrap(cause: cause)
        }
        
        let dataset = DataSet(data: data, latestTimestamp: latest.timestamp)
        log.verbose("built dataset: \(dataset)")
        
        return dataset
    }
}

public struct Data {
    var pk:Int
    var temperature:Double
    var pressure:Double
    var humidity:Double
    var timestamp:NSDate
    
    static func fromDict(dict:Dictionary<String,AnyObject>) throws -> Data {
        log.verbose("attempting to convert dict: \(dict) into Data model")
        
        guard let pk = dict["pk"] as? Int, fields = dict["fields"] as? Dictionary<String,AnyObject> else {
            let cause = "Couldn't unwrap fields from \(dict)"
            log.error(cause)
            throw E.Unwrap(cause: cause)
        }
        
        guard let time = fields["timestamp"] as? Double, temp = fields["temp"] as? Double, pressure = fields["pressure"] as? Double, let humidity = fields["humidity"] as? Double else {
            let cause = "Couldn't unwrap \(dict)"
            log.error(cause)
            throw E.Unwrap(cause: cause)
        }
        
        let data = Data(pk: pk, temperature: temp, pressure: pressure, humidity: humidity, timestamp: NSDate(timeIntervalSinceReferenceDate:time))
        
        log.verbose("completed building data model"/*: \(data)"*/)
        return data
    }
}

struct Station {
    var name:String
    var indoors:Bool
    var pk:Int
    var location:CLLocationCoordinate2D
    var capabilities:[Capability]
    
    static func fromDict(dict:Dictionary<String,AnyObject>) throws -> Station {
        log.verbose("attempting to convert dict: \(dict) into Station model")
        
        guard let pk = dict["pk"] as? Int, fields = dict["fields"] as? Dictionary<String,AnyObject> else {
            let cause = "Couldn't unwrap fields from \(dict)"
            log.error(cause)
            throw E.Unwrap(cause: cause)
        }
        
        guard let name = fields["name"] as? String, indoors = fields["indoors"] as? Bool, let location = fields["location"] as? Dictionary<String,Double>, lat = location["latitude"], long = location["longitude"] else {
            let cause = "Couldn't unwrap \(dict)"
            log.error(cause)
            throw E.Unwrap(cause: cause)
        }
        
        let station = Station(name: name, indoors: indoors, pk: pk, location: CLLocationCoordinate2DMake(lat, long), capabilities: [.Temperature, .Pressure, .Humidity])
        
        log.verbose("completed building station model"/*: \(station)"*/)
        return station
    }
}

enum Capability:String {
    case Temperature, WindSpeed, WindDirection, Humidity, Pressure
}

enum E:ErrorType {
    case Unwrap(cause:String), Conversion(cause:String)
}
