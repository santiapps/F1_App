//
//  ScheduleData.swift
//  Schedule_Test
//
//  Created by Santi Silvani on 4/30/22.
//

import Foundation

class ScheduleData{
    
    
    struct Returned3: Codable {
        var mrData: MRData
        
        enum CodingKeys: String, CodingKey {
            case mrData = "MRData"
        }
    }
    
    struct MRData: Codable {
        var xmlns: String
        var series: String
        var url: String
        var limit: String
        var offset: String
        var total: String
        var raceTable: RaceTable
        
        enum CodingKeys: String, CodingKey {
            case xmlns, series, url, limit, offset, total
            case raceTable = "RaceTable"
        }
    }
    
    struct RaceTable: Codable {
        var season: String
        var races: [Race]
        
        enum CodingKeys: String, CodingKey {
            case season
            case races = "Races"
        }
    }
    
    struct Race: Codable {
        var season, round: String
        var url: String
        var raceName: String
        var circuit: Circuit
        var date, time: String
//        var firstPractice, secondPractice: FirstPractice
//        var thirdPractice: FirstPractice?
        var qualifying: FirstPractice
        var sprint: FirstPractice?
        
        enum CodingKeys: String, CodingKey {
            case season, round, url, raceName
            case circuit = "Circuit"
            case date, time
//            case firstPractice = "FirstPractice"
//            case secondPractice = "SecondPractice"
//            case thirdPractice = "ThirdPractice"
            case qualifying = "Qualifying"
            case sprint = "Sprint"
        }
    }
    
    struct Circuit: Codable {
        let circuitID: String?
        let url: String?
        let circuitName: String?
        let location: Location?
        
        enum CodingKeys: String, CodingKey {
            case circuitID = "circuitId"
            case url, circuitName
            case location = "Location"
        }
    }
    
    struct Location: Codable {
        let lat: String
        var long: String
        var locality: String
        var country: String
    }
    
    struct FirstPractice: Codable {
        var date: String
        var time: String?
    }
    
    var scheduleUrlString = "https://ergast.com/api/f1/current.json"
    var scheduleArrays = [""]
    var dateArray = [""]
    
    var latArray = [""]
    var longArray = [""]
    
    var totalRaces = 0
    
    func getDataTeam(completed: @escaping () -> ()){
        guard let url = URL(string: scheduleUrlString) else{
            print("error")
            completed()
            return
        }
        let session = URLSession.shared
        let task = session.dataTask(with: url){ [self](data, responce, error) in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            }
            
            do{
                let returned = try JSONDecoder().decode(Returned3.self, from: data!)
                
                self.totalRaces = Int(returned.mrData.total) ?? 0
                //print(returned)
                for i in 0...self.totalRaces - 1{
                    self.scheduleArrays.append(returned.mrData.raceTable.races[i].circuit.circuitName ?? "")
                    self.dateArray.append(returned.mrData.raceTable.races[i].date)
                    self.latArray.append(returned.mrData.raceTable.races[i].circuit.location?.lat ?? "")
                    self.longArray.append(returned.mrData.raceTable.races[i].circuit.location?.long ?? "")
                }
                self.dateArray.remove(at: 0)
                self.scheduleArrays.remove(at: 0)
                self.latArray.remove(at: 0)
                self.longArray.remove(at: 0)
                
            } catch {
                print("JSON ERROR: \(error.localizedDescription)")
            }
            completed()
        }
        task.resume()
    }
   
}
