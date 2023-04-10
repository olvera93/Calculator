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
        Text("Sun Moon View")
    }
}

struct SunMoonView_Previews: PreviewProvider {
    static var previews: some View {
        SunMoonView(lighMode: true)
    }
}
