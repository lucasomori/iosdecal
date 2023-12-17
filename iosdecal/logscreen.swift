import SwiftUI
import SwiftData

struct LogView: View {
    @Environment(\.modelContext) var context
    @Environment(\.presentationMode) var presentationMode

    @State private var action: Bool? = false
    @State private var canRate = false
    
    @State private var selectedOptions = 0
    @Query var checkWeeks: [WeekClass]

    var day = WeekClass.GetCurrDay()
    
    // Separate @State properties for each question
    @State private var sleepWellOption: String? = nil
    @State private var exerciseOption: String? = nil
    @State private var socializeOption: String? = nil
    @State private var eatMealsOption: String? = nil
    
    // New @State property for counting "Y" clicks
    @State private var yesCount = 0
    
    @State private var showAlert = false


    var body: some View {
        //NavigationView {
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
                        selectedOption: $sleepWellOption, yesCount: $yesCount, selectedOptions: $selectedOptions
                    )
                    
                    // Second Question
                    QuestionView(
                        question: "Did you exercise?",
                        selectedOption: $exerciseOption,  yesCount: $yesCount, selectedOptions: $selectedOptions
                    )
                    
                    // Third Question
                    QuestionView(
                        question: "Did you socialize?",
                        selectedOption: $socializeOption,  yesCount: $yesCount, selectedOptions: $selectedOptions
                    )
                    
                    // Fourth Question
                    QuestionView(
                        question: "Did you eat 3 meals?",
                        selectedOption: $eatMealsOption,  yesCount: $yesCount, selectedOptions: $selectedOptions
                    )
//                    NavigationLink(destination: HomeView().navigationBarBackButtonHidden(true), tag: true, selection: $action) {
//                        EmptyView()
//                    }
                    
                    Button(action: {
                        showAlert = true
                    }) {
                        Text("Rate Your Day")
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                            .padding(.top, 10)
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                            .background(Color.blue)
                            .cornerRadius(20)
                    }
                    .disabled(self.selectedOptions != 4)
                    .alert("Are you sure you want to submit?", isPresented: $showAlert) {
                        Button(role: .destructive) {
                            if (checkWeeks.count < 1) {
                                let newWeek = WeekClass()
                                newWeek.SetDayScore(forDay: day, score: self.yesCount)
                                context.insert(newWeek)
                            } else {
                                checkWeeks[0].SetDayScore(forDay: day, score: self.yesCount)
                            }
                            self.action = true
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Yes")
                        }
                    }
                    .padding()
                }
            }
        //}
    }
}

struct QuestionView: View {
    var question: String
    @Binding var selectedOption: String?
    @Binding var yesCount: Int  // Binding to the yes count
    @Binding var selectedOptions: Int
    
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
                    self.selectedOptions = self.selectedOption == nil ? self.selectedOptions + 1 : self.selectedOptions
                    self.yesCount = self.selectedOption != "Y" ? yesCount + 1 : yesCount
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

                Button(action: {
                    self.selectedOptions = self.selectedOption == nil ? self.selectedOptions + 1 : self.selectedOptions
                    self.yesCount = self.selectedOption == "Y" ? yesCount - 1 : yesCount
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
