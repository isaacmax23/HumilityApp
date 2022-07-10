//
//  ReusableText.swift
//  HumilityApp
//
//  Created by user217650 on 6/25/22.
//

import SwiftUI

struct ReusableText: View {
 
    var answer: String
    var body: some View {
    
        Text(answer).fontWeight(.heavy).frame(width: 300 ,height: 150, alignment: .center)
            .multilineTextAlignment(.center)
          
        
    }
}

//struct ReusableText_Previews: PreviewProvider {
//    static var previews: some View {
//        ReusableText()
//    }
//}
