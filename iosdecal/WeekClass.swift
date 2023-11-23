//
//  WeekClass.swift
//  iosdecal
//
//  Created by Admin on 11/17/23.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class WeekClass : ObservableObject {
    private var scoreDict: [String: Float?]
    
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
    func SetDayScore(forDay day: String, score value: Float) throws {
        guard scoreDict.keys.contains(day) else {
            print("Invalid day: \(day)")
            throw WeekDataError.invalidDay("Invalid day: \(day)")
        }
        scoreDict[day] = value
    }
    
    func GetWeekScore() -> Float {
        let nonNilValues = scoreDict.values.compactMap { $0 }
        guard !nonNilValues.isEmpty else {
            return -1
        }
        
        let sum = nonNilValues.reduce(0, +)
        return sum / Float(nonNilValues.count)
    }
    
    func RestartWeek() {
        for key in scoreDict.keys {
            scoreDict[key] = nil
        }
    }
    
    func GetCurrDay() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: Date())
    }
    
}
