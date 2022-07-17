//
//  SecondView.swift
//  HumilityApp
//
//  Created by Isaac M Durairaj on 7/4/22.
//

import SwiftUI

struct SecondView: View {
    @Binding var quizStarted: Bool
    
    var body: some View {
     
        VStack{
            
            Text("Intellectual Humility").font(.largeTitle).italic()
           
                VStack(alignment: .leading){
                    Group(){
            Text("Intellectual Humility is the understanding that your knowledege and cognition are limited and imperfect.").padding()
            Text("IH promotes tolerance, civil discourse and collaboration").padding()
            Text("The questions in this app are based on the Intellectual Humility Scale developed by Krumei-Mancuso and Rouse ").bold().padding()
            Text("There are total of 22 questions that evaluate the user on four different aspects").padding()
                        Text("Citation").underline().italic().padding()
                        Text("Krumrei-Mancuso, E. J., & Rouse, S. V. (2016). The development and validation of the  Comprehensive Intellectual Humility Scale. Journal of Personality Assessment, 98, 209-221. doi:10.1080/00223891.2015.1068174 ").font(.caption).padding(.leading)
                }
                }
          
        Spacer()
        Button("Get Started"){
            quizStarted = true
        }.padding()
            .foregroundColor(Color.white)
             .background(Color.orange)
            .clipShape(Capsule())
        Spacer()
        }.navigationBarHidden(true)
     
    }
}

