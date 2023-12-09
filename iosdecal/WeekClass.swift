//
//  WeekClass.swift
//  iosdecal
//
//  Created by Admin on 11/17/23.
//

import Foundation
import SwiftData

@Model
class WeekClass {
    var scoreDict: [String: Int?]
    
    init() {
        self.scoreDict = [
            "Sunday": nil,
            "Monday": nil,
            "Tuesday": nil,
            "Wednesday": nil,
            "Thursday": nil,
            "Friday": nil,
            "Saturday": nil
        ]
    }
    
    
    enum WeekDataError: Error {
        case invalidDay(String)
    }
    
    func SetDayScore(forDay day: String, score value: Int) {
        scoreDict[day] = value
    }
    
    func GetDayScore(forDay day: String) -> Int? {
        return scoreDict[day] ?? nil
    }
    
    func GetWeekScore() -> Float {
        let nonNilValues = scoreDict.values.compactMap { $0 }
        if (nonNilValues.isEmpty) {
            return -1
        }
        let sum = nonNilValues.reduce(0, +)
        return Float(sum) / Float(nonNilValues.count * 4)
    }
    
    func RestartWeek() {
        for key in scoreDict.keys {
            scoreDict[key] = nil
        }
    }
    
    func GetCurrDayThrowaway() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: Date())
    }
    
    static func GetCurrDay() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: Date())
    }
    
}
