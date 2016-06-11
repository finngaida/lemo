//
//  ConnectionManager.swift
//  WeatherBot
//
//  Created by Finn Gaida on 11.06.16.
//  Copyright © 2016 Finn Gaida. All rights reserved.
//

import Foundation

enum Status {
    case Success, Error(reason: String)
}

class ConnectionManager: NSObject {

    static let sharedManager = ConnectionManager()
    var server:Server?
    var availableServers:[Server]?
    
    func isConnectedToServer() -> Bool {
        return server != nil
    }
    
    func connect(withPromt:(([Server]) -> Server)) -> Status {
        if isConnectedToServer() {
            return .Success
        } else {
            if let servers = searchServers() {
                self.availableServers = servers
                return connect(withPromt(servers))
            } else {
                return .Error(reason: "No servers found")
            }
        }
    }
    
    func connect(server: Server) -> Status {
        return Status.Error(reason: "Not implemented")
    }
    
    func searchServers() -> [Server]? {
        // TODO
        return nil
    }
}

struct Server {
    var ip:String
    var connected:Bool
    var capabilities:[Capability]
}

enum Capability {
    case Temperature, WindSpeed, WindDirection, Humidity
}
