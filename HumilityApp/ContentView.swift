//
//  ContentView.swift
//  HumilityApp
//
//  Created by user217650 on 6/24/22.
//

import SwiftUI

struct ContentView: View {
    @State var selectedOption = "0"
    @State var isSelected = false
    @State var completed: Bool=false
//    @State var isSelected = false
    var columns: [GridItem] = Array(repeating: GridItem(.fixed(100), spacing: 0), count: 3)
    var row2: [GridItem] = Array(repeating: GridItem(.fixed(100), spacing: 0), count: 2)
    @ObservedObject var appModel : AppViewModel
    var endVM = EndViewModel()
    @State var index = 0
    @State private var total = 0
    var body: some View {
        NavigationView{
      
            ZStack{
                Image("background").resizable().scaledToFill().edgesIgnoringSafeArea(.all)
                VStack(){
                Text("Intellectual Humility Calculator").font(.headline).padding()
        
           
                    ReusableText(answer: appModel.model.quizModel.question )
         
                    LazyVGrid(columns: columns, spacing: 20) {
                        CircleButton(score:"1", isSelected: $isSelected, selectedOption: $selectedOption).environmentObject(appModel).onTapGesture {
                            isSelected = true
                        }
                        CircleButton(score:"2", isSelected: $isSelected,selectedOption: $selectedOption).environmentObject(appModel).onTapGesture {
                        isSelected = true
                    }
                    CircleButton(score:"3",isSelected: $isSelected, selectedOption: $selectedOption).environmentObject(appModel).onTapGesture {
                        isSelected = true
                    }
                    }
                    LazyVGrid(columns: row2){
                    CircleButton(score:"4", isSelected: $isSelected,selectedOption: $selectedOption).environmentObject(appModel).onTapGesture {
                        isSelected = true
                    }
                    CircleButton(score:"5", isSelected: $isSelected,selectedOption: $selectedOption).environmentObject(appModel)
                    
                    }
                    Spacer()
                    VStack(alignment:.leading){
                    Text("1 - Strongly Disagree")
                    Text("2 - Disagree")
                    Text("3 - Neither Agree nor Disagree")
                    Text("4 - Agree")
                    Text("5 - Strongly Agree")
                    }.frame(alignment: .leading)
                    Spacer()
                    if isSelected{
                     
    Button("Next Question"){
        if(appModel.totalQuestions)>AppViewModel.currentIndex{
            isSelected = false
            appModel.categorizeScore(score: appModel.model.quizModel.selectedScore ?? 0, category: appModel.model.quizModel.category)
            appModel.nextQuestion()
            selectedOption = "6"
            print(appModel.indScores)
            print(appModel.openScores)
            print(appModel.respectScores)
            print(appModel.locScores)
        }
        else{
            isSelected = false
          completed=true
            appModel.clearScores()
        }
    }.padding()
    .foregroundColor(Color.white)
     .background(Color.orange)
     .clipShape(Capsule())
                    
                    Spacer()
                    }
                    
                    NavigationLink(destination: EndView( endVM: endVM).environmentObject(appModel), isActive: $appModel.completed){
            EmptyView()
                        }

                } }  .navigationBarHidden(true)
                
        }.navigationBarHidden(true)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(appModel: AppViewModel(), index: )
//    }
//}
