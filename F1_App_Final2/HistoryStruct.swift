//
//  HistoryStruct.swift
//  History
//
//  Created by Santi Silvani on 5/1/22.
//

import Foundation


struct History{
    var timePeriod: String
    var stats: Stats?
    var image: [String]
    var audio: [String]
    var gif: [String]
}

struct Stats{
    var horsepower: Int
    var forcedInduction: Bool
    var downforce: Int
}
