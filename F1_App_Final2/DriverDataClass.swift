//
//  DriversClass.swift
//  F1_App_Final2
//
//  Created by Santi Silvani on 4/29/22.
//

import Foundation


class DriverDataClass{
    
    private struct Returned: Codable{
        var MRData: MRData
    }
    
    struct MRData: Codable {
        var xmlns: String
        var series: String
        var url: String
        var limit: String
        var offset: String
        var total: String
        var standingsTable: StandingsTable
        
        enum CodingKeys: String, CodingKey {
            case xmlns, series, url, limit, offset, total
            case standingsTable = "StandingsTable"
        }
    }
    
    struct StandingsTable: Codable {
        var season: String
        var standingsLists: [StandingsList]
        
        enum CodingKeys: String, CodingKey {
            case season
            case standingsLists = "StandingsLists"
        }
    }
    
    struct StandingsList: Codable {
        var season: String
        var round: String
        var driverStandings: [DriverStanding]
        
        enum CodingKeys: String, CodingKey {
            case season, round
            case driverStandings = "DriverStandings"
        }
    }
    
    struct DriverStanding: Codable {
        var position, positionText, points, wins: String
        var driver: Driver
        var constructors: [Constructor]
        
        enum CodingKeys: String, CodingKey {
            case position, positionText, points, wins
            case driver = "Driver"
            case constructors = "Constructors"
        }
    }
    
    struct Constructor: Codable {
        var constructorID: String
        var url: String
        var name, nationality: String
        
        enum CodingKeys: String, CodingKey {
            case constructorID = "constructorId"
            case url, name, nationality
        }
    }
    
    struct Driver: Codable {
        var driverID, permanentNumber, code: String
        var url: String
        var givenName, familyName, dateOfBirth, nationality: String
        
        enum CodingKeys: String, CodingKey {
            case driverID = "driverId"
            case permanentNumber, code, url, givenName, familyName, dateOfBirth, nationality
        }
    }
    
    var driverUrlString = "https://ergast.com/api/f1/current/driverStandings.json"
    
    var driverNameArrays = [""]
    var driverPositionArray = [""]
    
    var holdNum = 0
    
    var total = 0
    
    func getDataDriver(completed: @escaping () -> ()){
        guard let url = URL(string: driverUrlString) else{
            print("error")
            completed()
            return
        }
        let session = URLSession.shared
        let task = session.dataTask(with: url){(data, responce, error) in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            }
            
            do{
                let returned = try JSONDecoder().decode(Returned.self, from: data!)
                
                self.total = Int(returned.MRData.total) ?? 0
                
                for i in 0...self.total - 1{
                    self.driverNameArrays.append(returned.MRData.standingsTable.standingsLists[0].driverStandings[i].driver.familyName)
                    self.driverPositionArray.append(returned.MRData.standingsTable.standingsLists[0].driverStandings[i].position)
                }
//              driverNameArrays[0] and driverPositionArray[0] are blank
                self.driverNameArrays.remove(at: 0)
                self.driverPositionArray.remove(at: 0)
            } catch {
                print("JSON ERROR: \(error.localizedDescription)")
            }
            completed()
        }
        task.resume()
    }
}

