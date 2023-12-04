import SwiftUI

struct HomeView: View {
    let days = ["Sunday", "Monday", "Tuesday", "Wednesday",
                "Thursday", "Friday", "Saturday"]
    
    @State private var action: String? = nil
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
                                .strokeBorder(Color.white, lineWidth: 2)
                                .frame(width: 48, height: 48)
                                .overlay(Text(days[index].prefix(1)).foregroundColor(.white))
                                .font(.system(size: 25))
                            
                        }
                        .padding(10)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        // Action to perform when the button is tapped
                        // You can add your recording logic here
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
