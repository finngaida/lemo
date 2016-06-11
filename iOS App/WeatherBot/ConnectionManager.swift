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
        let data = try getAllData().data
        guard let latest = data.first else { throw E.Unwrap(cause: "Couldn't unwrap \(data).first") }
        return latest
    }
    
    func getData(forTimestamp:NSDate) throws -> Data {
        fatalError("Not yet implemented")
    }

    func getAllData() throws -> DataSet {
        func fetchData() throws -> DataSet {
            guard let url = NSURL(string: root + "fetchall") else { throw E.Unwrap(cause: "Couldn't get URL from \(root)fetchall") }
            let data = try NSData(contentsOfURL: url, options: NSDataReadingOptions.DataReadingMappedIfSafe)
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableLeaves)
            guard let dict = json as? Array<Dictionary<String,AnyObject>> else { throw E.Conversion(cause: "Couldn't convert \(json) to Dictionary") }
            let dataset = try DataSet.fromDicts(dict)
            self.data = dataset
            return dataset
        }
            
        if let d = data {
            if NSDate().timeIntervalSinceDate(d.latestTimestamp) < 10 * 60 {
                return d
            } else {
                return try fetchData()
            }
        } else {
            return try fetchData()
        }
    }
    
}

struct DataSet {
    let data:[Data]
    let latestTimestamp:NSDate
    
    static func fromDicts(dicts:Array<Dictionary<String,AnyObject>>) throws -> DataSet {
        let data = try dicts.map { try Data.fromDict($0) }
        let times = data.sort({ $0.0.timestamp.timeIntervalSinceReferenceDate > $0.1.timestamp.timeIntervalSinceReferenceDate })
        guard let latest = times.first else { throw E.Unwrap(cause: "Couldn't unwrap \(times).first") }
        return DataSet(data: data, latestTimestamp: latest.timestamp)
    }
}

struct Data {
    var pk:Int
    var temperature:Float?
    var pressure:Float?
    var humidity:Float?
    var timestamp:NSDate
    
    static func fromDict(dict:Dictionary<String,AnyObject>) throws -> Data {
        guard let pk = dict["pk"] as? Int, fields = dict["fields"] as? Dictionary<String,AnyObject> else { throw E.Unwrap(cause: "Couldn't unwrap \(dict)") }
        guard let time = fields["timestamp"] as? Double else { throw E.Unwrap(cause: "Couldn't unwrap \(fields)") }
        
        var data = Data(pk: pk, temperature: nil, pressure: nil, humidity: nil, timestamp: NSDate(timeIntervalSinceReferenceDate:time))
        
        if let temp = fields["temp"] as? Float {
            data.temperature = temp
        }
        
        if let pressure = fields["pressure"] as? Float {
            data.pressure = pressure
        }
        
        if let humidity = fields["humidity"] as? Float {
            data.humidity = humidity
        }
        
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
