//
//  WeekClassTest.swift
//  iosdecal
//
//  Created by Admin on 11/17/23.
//

import SwiftUI
import SwiftData

struct WeekClassTest: View {
    //@Environment(\.modelContext) var context
    @State var week: WeekClass?
    
    var body: some View {
        Text(week?.GetCurrDayThrowaway() ?? "no")
        .onAppear(perform: {
                week = WeekClass()
        })
    }
}

#Preview {
    WeekClassTest()
        .modelContainer(for: WeekClass.self)
}
