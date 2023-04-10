//
//  ComputationView.swift
//  Calculator
//
//  Created by Gonzalo Olvera Monroy on 10/04/23.
//

import SwiftUI

struct ComputationView: View {
    
    let currentComputation: String
    let mainResult: String
    
    var body: some View {
        VStack {
            Text(currentComputation)
            Text(mainResult)
        }
    }
}

struct ComputationView_Previews: PreviewProvider {
    static var previews: some View {
        ComputationView(currentComputation: "5 + 1", mainResult: "6")
    }
}
