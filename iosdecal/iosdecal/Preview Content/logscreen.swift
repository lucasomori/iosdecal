import SwiftUI

struct LogView: View {
    var day = "Sunday"
    
    // Separate @State properties for each question
    @State private var sleepWellOption: String? = nil
    @State private var exerciseOption: String? = nil
    @State private var socializeOption: String? = nil
    @State private var eatMealsOption: String? = nil

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Text("Log your")
                    .foregroundStyle(.white)
                    .font(.largeTitle).bold()
                Text(day)
                    .foregroundStyle(.white)
                    .font(.largeTitle).bold()
                    .padding(.bottom, 35)
                
                // First Question
                QuestionView(
                    question: "Did you sleep well?",
                    selectedOption: $sleepWellOption
                )
                
                // Second Question
                QuestionView(
                    question: "Did you exercise?",
                    selectedOption: $exerciseOption
                )
                
                // Third Question
                QuestionView(
                    question: "Did you socialize?",
                    selectedOption: $socializeOption
                )
                
                // Fourth Question
                QuestionView(
                    question: "Did you eat 3 meals?",
                    selectedOption: $eatMealsOption
                )
            }
        }
    }
}

struct QuestionView: View {
    var question: String
    @Binding var selectedOption: String?
    
    var body: some View {
        VStack {
            Text(question)
                .font(.system(size: 25))
                .foregroundColor(.white)
                .padding(.vertical, 5)
                .padding(.horizontal)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            HStack {
                Button(action: {
                    self.selectedOption = "Y"
                }) {
                    Text("Y")
                        .font(.system(size: 25))
                        .frame(width: 48, height: 48)
                        .foregroundColor(.white)
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 2)
                        )
                        .background(selectedOption == "Y" ? Color.green : Color.clear)
                        .clipShape(Circle())
                }
                .disabled(selectedOption != nil) // Disable "Y" if an option is already selected

                Button(action: {
                    self.selectedOption = "N"
                }) {
                    Text("N")
                        .font(.system(size: 25))
                        .frame(width: 48, height: 48)
                        .foregroundColor(.white)
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 2)
                        )
                        .background(selectedOption == "N" ? Color.red : Color.clear)
                        .clipShape(Circle())
                }
                .disabled(selectedOption != nil) // Disable "N" if an option is already selected
            }
            .padding()
        }
    }
}

struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        LogView()
    }
}

