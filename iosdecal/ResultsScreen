import SwiftUI

struct ResultsScreen: View {
    
    var face = ":/"
    var status = "Alright"
    var suggest = "Spend more time with friends! You can go out, get food, and explore!"
    var vibeColor = "theColor"
    
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
                    .background(.orange)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.bottom, 10)
                
                
                Text(suggest)
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .padding(.vertical, 5)
                    .padding(.horizontal)
                    .background(.orange)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.bottom, 10)
                
                Spacer()
                
                Text("Record new week")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .padding(.vertical, 5)
                    .padding(.horizontal)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.bottom, 10)
            }
        }
    }
}

struct ResultsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ResultsScreen()
    }
}
