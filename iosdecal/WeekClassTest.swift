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
    
    var body: some View {
        VStack {
            Text("Hello world!")
            Button(action: {
                    context.insert(WeekClass())
            }) {
                Text("IDK")
            }
            WeekClassTest2()
        }
    }
}

struct WeekClassTest2: View {
    @Query var currWeek: [WeekClass]
    var body: some View {
        let score = currWeek[0].GetWeekScore()
        Text("Score: \(score)")
        //Text("Hello world!")
    }
}
#Preview {
    WeekClassTest().modelContainer(for: WeekClass.self)
}
