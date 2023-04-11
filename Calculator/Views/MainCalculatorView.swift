//
//  ContentView.swift
//  Calculator
//
//  Created by Gonzalo Olvera Monroy on 10/04/23.
//

import SwiftUI

struct MainCalculatorView: View {
    
    @State var lighMode: Bool = true
    @State var currentComputation: String = ""
    @State var mainResult: String = "0"
    
    var body: some View {
        ZStack {
            
            primaryBackgroundColor.ignoresSafeArea()
            
            VStack {
                
                SunMoonView(lighMode: lighMode)
                    .onTapGesture {
                        withAnimation {
                            lighMode.toggle()
                        }
                    }
                
                Spacer()
                
                ComputationView(currentComputation: currentComputation, mainResult: mainResult)
                    .padding(.horizontal, UIDevice.isIPad ? UIScreen.main.bounds.width * 0.1 : 0)
                
                Spacer()
                
                CalcsButtonsView(currentComputation: $currentComputation, mainResult: $mainResult)
                
                if UIDevice.isIPad {
                    Spacer()
                }
                
            }
            .padding()
        }
        .environment(\.colorScheme,
                      lighMode ? .light : .dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainCalculatorView()
    }
}
