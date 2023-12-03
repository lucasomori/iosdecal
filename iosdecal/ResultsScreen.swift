import SwiftUI

struct ResultsScreen: View {
    
    var faces = [":(", ":/", ":|", ":)"]
    var statuses = ["Bad", "Alright", "Good", "Great"]
    var suggestions = ["Next week will be better! Try doing the things you love more!",
                       "Spend more time with friends! you can go out, get food, and explore!",
                       "A good week is good! Try being more well-rounded each day!",
                       "Keep doing what you're doing! Glad you had a great week!"]
    var vibeColors = [Color.red, Color.orange, Color(red: 0.8, green: 0.7, blue: 0.2), Color.green]
    
    var face, status, suggest : String
    var vibeColor : Color
    init(score: Float) {
        switch score {
        case 0...0.25:
            face = faces[0]; status = statuses[0]; suggest = suggestions[0]; vibeColor = vibeColors[0];
        case 0.25...0.5:
            face = faces[1]; status = statuses[1]; suggest = suggestions[1]; vibeColor = vibeColors[1];
        case 0.5...0.75:
            face = faces[2]; status = statuses[2]; suggest = suggestions[2]; vibeColor = vibeColors[2];
        case 0.75...1:
            face = faces[3]; status = statuses[3]; suggest = suggestions[3]; vibeColor = vibeColors[3];
        default:
            fatalError("How the hell did you get here? The score was \(score)")
        }
    }
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Text("The Vibe of this Week")
                    .foregroundStyle(.white)
                    .font(.largeTitle).bold()
                    .padding(.top, 40)
                
                
                Text(face)
                    .foregroundStyle(.white)
                    .font(.system(size: 200))
                    .bold()
                    .padding(.top, 40)
                
                
                Text(status)
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .padding(.vertical, 5)
                    .padding(.horizontal)
                    .background(vibeColor)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.bottom, 10)
                
                
                Text(suggest)
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .padding(.vertical, 5)
                    .padding(.horizontal)
                    .background(vibeColor)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.bottom, 10)
                
                Spacer()
                
                Button(action: {
                           // Action to perform when the button is tapped
                           // You can add your recording logic here
                       }) {
                           Text("Record new week")
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
        }
    }
}

#Preview {
    ResultsScreen(score: 0.75)
}
