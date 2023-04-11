//
//  ButtonView.swift
//  Calculator
//
//  Created by Gonzalo Olvera Monroy on 10/04/23.
//

import SwiftUI

struct ButtonView: View {
    
    let calcButton: CalcButton
    let fgColor: Color
    let bgColor: Color
    let width: CGFloat
    
    var systemImage: String? {
        let value = calcButton.rawValue
        return value.contains("IMG") ? value.replacingOccurrences(of: "IMG", with: "") : nil
    }
    
    var text: String? {
        let value = calcButton.rawValue
        
        return value.contains("IMG") ? nil : value
    }
    
    var buttonDim: CGFloat {
        UIDevice.isIPad ? width / 6 : width / 5
    }
    
    var body: some View {
        ZStack {
            if let text = text {
                Text(text)
            }
            
            if let systemImage = systemImage {
                Image(systemName: systemImage)
            }
        }
        .font(UIDevice.isIPad ? .largeTitle : .title2)
        .fontWeight(UIDevice.isIPad ? .heavy : .semibold)
        .frame(width: buttonDim, height: buttonDim)
        .foregroundColor(fgColor)
        .background(bgColor)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: bgColor.opacity(0.5), radius: 3, x: 5, y: 5)
        
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(calcButton: .one, fgColor: foregroundDigitsColor, bgColor: buttonBackground, width: 375)
    }
}
