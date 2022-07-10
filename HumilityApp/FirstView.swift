//
//  FirstView.swift
//  HumilityApp
//
//  Created by Isaac M Durairaj on 7/4/22.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        VStack{
            Image("OnBoardingImage").resizable().scaledToFit()
        }.navigationBarHidden(true)
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
