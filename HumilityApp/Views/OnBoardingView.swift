//
//  OnBoardingView.swift
//  HumilityApp
//
//  Created by Isaac M Durairaj on 7/4/22.
//

import SwiftUI

struct OnBoardingView: View {
    @State var selection  = 0
    var appModel = AppViewModel()
    @State var quizStarted = false
    var body: some View {
        VStack{
            if !quizStarted{
            TabView(selection: $selection){
                FirstView().tag(0)
                SecondView(quizStarted: $quizStarted).tag(1)
            }.tabViewStyle(PageTabViewStyle()).indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            else{
                ContentView( appModel: appModel)
            }
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
