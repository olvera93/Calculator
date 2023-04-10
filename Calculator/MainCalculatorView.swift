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
                
                Spacer()
                
                CalcsButtonsView(currentComputation: $currentComputation, mainResult: $mainResult)
                
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
