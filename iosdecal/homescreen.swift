import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) var context
    @Query var checkWeeks: [WeekClass]
    
    let days = ["Sunday", "Monday", "Tuesday", "Wednesday",
                "Thursday", "Friday", "Saturday"]
    
    let vibeColors = [Color.red, Color.orange, Color(red: 0.8, green: 0.7, blue: 0.2), Color(red: 0.7, green: 1, blue: 0), Color.green]

    
    func SetDayColor(day: String) -> Color {
        if (checkWeeks.count < 1) {
            return Color.white
        } else {
            var index = checkWeeks[0].GetDayScore(forDay: day)
            if (index != nil) {
                return vibeColors[index!]
            } else {
                return Color.white
            }
        }
    }
    
    func CheckIfCanRateWeek() -> Bool {
        if (WeekClass.GetCurrDay() == "Saturday") {
            return CheckIfRatedDays()
        }
        return false
    }
    
    func CheckIfRatedDays() -> Bool {
        if (checkWeeks.count < 1) {
            //print("HOW")
            return false
        } else {
            if (checkWeeks[0].GetWeekScore() < 0) {
                //print("BUT WHY")
                return false
            } else {
                //print("YOUR SCORE WAS \(checkWeeks[0].GetWeekScore())")
                return true
            }
        }
    }

    
    @State private var action: String? = nil
    @State private var resultsAction: Bool? = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack {
                    Text("Vibe Check")
                        .foregroundStyle(.white)
                        .font(.largeTitle).bold()
                        .padding(.top, 40)
                    
                    Spacer()
                    
                    ForEach(days.indices, id: \.self) { index in
                        NavigationLink(destination: LogView().navigationBarBackButtonHidden(true), tag: days[index], selection: $action) {
                                            EmptyView()
                                        }
                        Button(action: {
                            // Action for each day button
                            self.dayButtonTapped(day: days[index])
                        }) {
                            Circle()
                                .strokeBorder(SetDayColor(day: days[index]), lineWidth: 2)
                                .frame(width: 48, height: 48)
                                .overlay(Text(days[index].prefix(1)).foregroundColor(SetDayColor(day: days[index])))
                                .font(.system(size: 25))
                            
                        }
                        .padding(10)
                    }
                    
                    Spacer()
                    if (checkWeeks.count > 0) {
                        NavigationLink(destination:ResultsScreen(score: checkWeeks[0].GetWeekScore()).navigationBarBackButtonHidden(true), tag: true, selection: $resultsAction) {
                            EmptyView()
                        }
                    }
                    Button(action: {
                        if (checkWeeks.count > 0) {
                            self.resultsAction = true
                        }
                    }) {
                        Text("Rate Your Week")
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                            .padding(.top, 10)
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                            .background(Color.blue)
                            .cornerRadius(20)
                    }
                    .disabled(!CheckIfCanRateWeek())
                    .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black)
                .foregroundColor(.white)
            }
        }
    }

    private func dayButtonTapped(day: String) {
        if (day == WeekClass.GetCurrDay()) {
            self.action = WeekClass.GetCurrDay()
        }
    }
}

#Preview {
    HomeView().modelContainer(for: WeekClass.self)
}
