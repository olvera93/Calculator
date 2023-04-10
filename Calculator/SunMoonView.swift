//
//  SunMoonView.swift
//  Calculator
//
//  Created by Gonzalo Olvera Monroy on 10/04/23.
//

import SwiftUI

struct SunMoonView: View {
    
    var lighMode: Bool
    
    var body: some View {
        HStack(spacing: 30) {
            Image(systemName: "sun.min")
                .imageScale(.large)
                .foregroundColor(lighMode ? sunOrMoonSelectedColor : sunOrMoonNotSelectedColor)
        
            Image(systemName: "moon")
                .imageScale(.large)
                .foregroundColor(lighMode ? sunOrMoonNotSelectedColor : sunOrMoonSelectedColor)
        }.padding()
            .background(secondaryBackgroundColor)
            .cornerRadius(20)
    }
}

struct SunMoonView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SunMoonView(lighMode: true)
            SunMoonView(lighMode: false)
        }
    }
}
