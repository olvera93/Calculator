//
//  IpadSupport.swift
//  Calculator
//
//  Created by Gonzalo Olvera Monroy on 11/04/23.
//

import SwiftUI

extension UIDevice {
    static var isIPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
    
    static var isIhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
}
