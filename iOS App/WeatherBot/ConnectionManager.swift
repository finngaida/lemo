//
//  ConnectionManager.swift
//  WeatherBot
//
//  Created by Finn Gaida on 11.06.16.
//  Copyright © 2016 Finn Gaida. All rights reserved.
//

import Foundation
import CoreLocation

let root = "http://172.16.110.45:2101/Weather/"

enum Status {
    case Success, Error(reason: String)
}

class ConnectionManager: NSObject {

    static let sharedManager = ConnectionManager()
    var availableServers:[Server]?
    var data:DataSet?
    
    func getLatestData() throws -> Data {
        log.verbose("Starting to get data")
        let data = try getAllData().data
        guard let latest = data.first else { throw E.Unwrap(cause: "Couldn't unwrap \(data).first") }
        return latest
    }
    
    func getData(forTimestamp:NSDate) throws -> Data {
        fatalError("Not yet implemented")
    }

    func getAllData() throws -> DataSet {
        func fetchData() throws -> DataSet {
            log.verbose("fetching new data")
            
            guard let url = NSURL(string: root + "fetchall") else {
                let cause = "Couldn't get URL from \(root)fetchall"
                log.error(cause)
                throw E.Unwrap(cause: cause)
            }
            
            log.verbose("URL is \(url)")
            
            let data = try NSData(contentsOfURL: url, options: NSDataReadingOptions.DataReadingMappedIfSafe)
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableLeaves)
            
            log.verbose("got json: \(json)")
            
            guard let dict = json as? Array<Dictionary<String,AnyObject>> else {
                let cause = "Couldn't convert \(json) to Dictionary"
                log.error(cause)
                throw E.Conversion(cause: cause)
            }
            
            log.verbose("got dictionary: \(dict)")
            
            let dataset = try DataSet.fromDicts(dict)
            log.verbose("returning dataset. \(dataset)")
            
            self.data = dataset
            return dataset
        }
            
        if let d = data {
            log.verbose("found data already: \(d)")
            if NSDate().timeIntervalSinceDate(d.latestTimestamp) < 10 * 60 {
                log.verbose("data is relevant enough, return cached data")
                return d
            } else {
                log.verbose("cached data is outdate, get new one")
                return try fetchData()
            }
        } else {
            log.verbose("no data cached, fetch new data")
            return try fetchData()
        }
    }
    
}

struct DataSet {
    let data:[Data]
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

struct Data {
    var pk:Int
    var temperature:Float?
    var pressure:Float?
    var humidity:Float?
    var timestamp:NSDate
    
    static func fromDict(dict:Dictionary<String,AnyObject>) throws -> Data {
        log.verbose("attempting to convert dict: \(dict) into Data model")
        
        guard let pk = dict["pk"] as? Int, fields = dict["fields"] as? Dictionary<String,AnyObject>, time = fields["timestamp"] as? Double else {
            let cause = "Couldn't unwrap \(dict)"
            log.error(cause)
            throw E.Unwrap(cause: cause)
        }
        
        var data = Data(pk: pk, temperature: nil, pressure: nil, humidity: nil, timestamp: NSDate(timeIntervalSinceReferenceDate:time))
        log.verbose("built half-empty data object: \(data)")
        
        if let temp = fields["temp"] as? Float {
            log.verbose("adding temperature: \(temp)")
            data.temperature = temp
        }
        
        if let pressure = fields["pressure"] as? Float {
            log.verbose("adding pressure: \(pressure)")
            data.pressure = pressure
        }
        
        if let humidity = fields["humidity"] as? Float {
            log.verbose("adding humidity: \(humidity)")
            data.humidity = humidity
        }
        
        log.verbose("completed building data model: \(data)")
        return data
    }
}

struct Server {
    var name:String
    var indoors:Bool
    var pk:Int
    var location:CLLocationCoordinate2D
    var capabilities:[Capability]
}

enum Capability {
    case Temperature, WindSpeed, WindDirection, Humidity, Pressure
}

enum E:ErrorType {
    case Unwrap(cause:String), Conversion(cause:String)
}
