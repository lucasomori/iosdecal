//
//  WeekClassTest.swift
//  iosdecal
//
//  Created by Admin on 11/17/23.
//

import SwiftUI

struct WeekClassTest: View {
    @State var week = WeekClass()
    var body: some View {
        Text(week.GetCurrDay())
    }
}

#Preview {
    WeekClassTest()
}
