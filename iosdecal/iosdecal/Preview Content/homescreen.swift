import SwiftUI

struct HomeView: View {
    let days = ["S", "M", "T", "W", "T", "F", "S"]

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Text("Vibe Check")
                    .foregroundStyle(.white)
                    .font(.largeTitle).bold()
                    .padding(.top, 40)

                Spacer()

                ForEach(days.indices, id: \.self) { index in
                    Button(action: {
                        // Action for each day button
                        self.dayButtonTapped(day: days[index])
                    }) {
                        Circle()
                            .strokeBorder(Color.white, lineWidth: 2)
                            .frame(width: 48, height: 48)
                            .overlay(Text(days[index]).foregroundColor(.white))
                            .font(.system(size: 25))

                    }
                    .padding(10)
                }

                Spacer()

                Text("Rate Your Week")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .padding(.vertical, 5)
                    .padding(.horizontal)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.bottom, 10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .foregroundColor(.white)
        }
    }

    private func dayButtonTapped(day: String) {
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
