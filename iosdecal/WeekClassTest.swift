//
//  WeekClassTest.swift
//  iosdecal
//
//  Created by Admin on 11/17/23.
//

import SwiftUI
import SwiftData

struct WeekClassTest: View {
    @Environment(\.modelContext) var context
    //@State private var week = WeekClass()
    @Query var checkWeeks: [WeekClass]
    var body: some View {
        VStack {
            Text("Hello world!")
            Button(action: {
                CheckWeeks()
            }) {
                Text("\(checkWeeks.count)")
            }
            WeekClassTest2()
        }
    }
    
    func CheckWeeks() {
        if (checkWeeks.count < 1) {
            context.insert(WeekClass())
        }
    }
}

struct WeekClassTest2: View {
    @Query var currWeek: [WeekClass]
    var body: some View {
        if (currWeek.count > 0) {
            let score = currWeek[0].GetWeekScore()
            Text("Score: \(score)")
            Text("Count: \(currWeek.count)")
            //Text("Hello world!")
        }
    }
}
#Preview {
    WeekClassTest().modelContainer(for: WeekClass.self)
}
