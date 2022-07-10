//
//  CircleButton.swift
//  HumilityApp
//
//  Created by Isaac M Durairaj on 7/2/22.
//

import SwiftUI

struct CircleButton: View {
    var score:String
    @Binding var isSelected: Bool
    @Binding var selectedOption: String
    @EnvironmentObject var appModel: AppViewModel
    var body: some View {
     
        ZStack{
            Circle().fill(self.score == self.selectedOption ? Color.orange : Color.gray).frame(width: 75, height: 75) .onTapGesture {
                self.isSelected = true
                self.selectedOption=self.score
                appModel.model.quizModel.selectedScore=Int(self.score)
                print("touched \(self.score)")
            }
            Text(score).foregroundColor(.white)
        }
    }
}

