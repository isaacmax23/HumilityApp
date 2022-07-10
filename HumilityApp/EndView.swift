//
//  EndView.swift
//  HumilityApp
//
//  Created by user217650 on 6/26/22.
//

import SwiftUI

struct EndView: View {
//    var appViewModel=AppViewModel()
//    @Binding var total: Int
    @EnvironmentObject var  appViewModel: AppViewModel
    @State private var back: Bool=false
    @State var index = 0
    @State var sendScore = false
    @State var checkScore = false
    @State var averageScore = true
    let lock = NSLock()
    @ObservedObject var endVM : EndViewModel
    var body: some View {
        NavigationView{
           
            ZStack{
                Image("background").resizable().scaledToFill().edgesIgnoringSafeArea(.all)
                VStack(){
                    Text("Thank You!").font(.largeTitle).bold().padding()
                    Text("Your Scores").font(.headline)
                    HStack(alignment: .center ){
                        
                        VStack(alignment: .leading, spacing: 10){
                      
                            Text("Independence of Intellect and Ego")
                            Text("Openness to Revising One’s Viewpoint")
                            Text("Respect for Others’ Viewpoints")
                            Text("Lack of Intellectual Overconfidence")
            
                        }.padding()
                        
                        VStack(alignment: .leading, spacing: 10){
                            Text("\(appViewModel.indTotal)/ 25")
                            Text("\(appViewModel.openTotal)/ 25")
                            Text("\(appViewModel.respectTotal)/ 30")
                            Text("\(appViewModel.locTotal)/ 30")
                        }.padding()
                       
                    }.padding()
                    
                   
                    if endVM.displayMean{
                        HStack(alignment: .center ){
                            
                        VStack(alignment: .leading, spacing: 10){
                            Text("Mean Independence Score \(String(format: "%.2f",endVM.indScore))")
                            Text("Mean Openness Score \(String(format: "%.2f",endVM.openScore))")
                            Text("Mean Respect Score \(String(format: "%.2f",endVM.respectScore))")
                            Text("Mean Lack of Overconfidence Score \(String(format: "%.2f",endVM.locScore))")
                        }.padding()
                            
                        }.padding()
                    }
                                
                                        
                    if averageScore{
                    Button("Average Scores"){
                            endVM.getData()
                            sendScore = true
                        averageScore = false
                        
                    }.padding()
                        .foregroundColor(Color.white)
                         .background(Color.orange)
                        .clipShape(Capsule())
                    }
                    
                    if sendScore{
                    Button("I agree to submit my scores"){
                        endVM.calculateAverage(ind: appViewModel.indTotal, open: appViewModel.openTotal, respect: appViewModel.respectTotal, loc: appViewModel.locTotal)
                        endVM.setData(ind: endVM.avgInd, open: endVM.avgOpen, respect: endVM.avgRespect, loc: endVM.avgLoc)
                        sendScore = false
                    }.padding()
                        .foregroundColor(Color.white)
                         .background(Color.orange)
                        .clipShape(Capsule())
                    }
                    Button("Take it Again"){
                        back = true
                        appViewModel.endQuiz()
               
                    }.padding()
                        .foregroundColor(Color.white)
                         .background(Color.orange)
                        .clipShape(Capsule())
                                        
                                   Spacer()
                                    
                            
                    
                                        NavigationLink( destination: ContentView(appModel: appViewModel),isActive: $back){
                                    EmptyView()
                            }
                }
            }.navigationBarHidden(true)
        }.navigationBarHidden(true)
    }
}

