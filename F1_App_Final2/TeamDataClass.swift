//
//  TeamDataClass.swift
//  F1_App_Final2
//
//  Created by Santi Silvani on 4/27/22.
//

import Foundation

class TeamDataClass{
    
    
    struct Returned2: Codable {
        let mrData: MRData
        
        enum CodingKeys: String, CodingKey {
            case mrData = "MRData"
        }
    }
    
    struct MRData: Codable {
        let xmlns: String
        let series: String
        let url: String
        let limit, offset, total: String
        let standingsTable: StandingsTable
        
        enum CodingKeys: String, CodingKey {
            case xmlns, series, url, limit, offset, total
            case standingsTable = "StandingsTable"
        }
    }
    
    struct StandingsTable: Codable {
        let season: String
        let standingsLists: [StandingsList]
        
        enum CodingKeys: String, CodingKey {
            case season
            case standingsLists = "StandingsLists"
        }
    }
    
    struct StandingsList: Codable {
        let season, round: String
        let constructorStandings: [ConstructorStanding]
        
        enum CodingKeys: String, CodingKey {
            case season, round
            case constructorStandings = "ConstructorStandings"
        }
    }
    
    struct ConstructorStanding: Codable {
        let position, positionText, points, wins: String
        let constructor: Constructor
        
        enum CodingKeys: String, CodingKey {
            case position, positionText, points, wins
            case constructor = "Constructor"
        }
    }
    
    struct Constructor: Codable {
        let constructorID: String
        let url: String
        let name, nationality: String
        
        enum CodingKeys: String, CodingKey {
            case constructorID = "constructorId"
            case url, name, nationality
        }
    }
    
    var teamUrlString = "https://ergast.com/api/f1/current/constructorStandings.json"
    var teamNameArrays = [""]
    var teamPositionArray = [""]
    var holdNumTeam = 0
    var totalTeam = 0

    func getDataTeam(completed: @escaping () -> ()){
        guard let url = URL(string: teamUrlString) else{
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
                let returned = try JSONDecoder().decode(Returned2.self, from: data!)
                self.totalTeam = Int(returned.mrData.total) ?? 0
                
                for i in 0...self.totalTeam - 1{
                    self.teamNameArrays.append(returned.mrData.standingsTable.standingsLists[0].constructorStandings[i].constructor.name)
                    self.teamPositionArray.append(returned.mrData.standingsTable.standingsLists[0].constructorStandings[i].position)
                }
                
//              teamNameArrays[0] and teamPositionArray[0] are blank
                self.teamNameArrays.remove(at: 0)
                self.teamPositionArray.remove(at: 0)
                
              
            } catch {
                print("JSON ERROR: \(error.localizedDescription)")
            }
            completed()
        }
        task.resume()
    }
}
