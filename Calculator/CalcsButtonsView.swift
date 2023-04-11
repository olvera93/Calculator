//
//  CalcsButtonsView.swift
//  Calculator
//
//  Created by Gonzalo Olvera Monroy on 10/04/23.
//

import SwiftUI

struct CalcButtonModel: Identifiable {
    let id = UUID()
    let calcButton: CalcButton
    var color: Color = foregroundDigitsColor
}

struct RowOfCalcButtonsModel: Identifiable {
    let id = UUID()
    let row: [CalcButtonModel]
}

struct CalcsButtonsView: View {
    
    @Binding var currentComputation: String
    @Binding var mainResult: String
    
    let buttondData: [RowOfCalcButtonsModel] = [
        RowOfCalcButtonsModel(row: [
            CalcButtonModel(
            calcButton: .clear,
            color: foregroundTopButtonsColor),
            
            CalcButtonModel(
            calcButton: .negative,
            color: foregroundTopButtonsColor),
            
            CalcButtonModel(
            calcButton: .percent,
            color: foregroundTopButtonsColor),
            
            CalcButtonModel(
            calcButton: .divide,
            color: foregroundRightButtonsColor),
            
        ]),
        
        RowOfCalcButtonsModel(row: [
            CalcButtonModel(calcButton: .seven),
            CalcButtonModel(calcButton: .eight),
            CalcButtonModel(calcButton: .nine),
            CalcButtonModel(calcButton: .multiply, color: foregroundRightButtonsColor)
        
        ]),
        
        RowOfCalcButtonsModel(row: [
            CalcButtonModel(calcButton: .four),
            CalcButtonModel(calcButton: .five),
            CalcButtonModel(calcButton: .six),
            CalcButtonModel(calcButton: .subtract, color: foregroundRightButtonsColor)
        
        ]),
        
        RowOfCalcButtonsModel(row: [
            CalcButtonModel(calcButton: .one),
            CalcButtonModel(calcButton: .two),
            CalcButtonModel(calcButton: .three),
            CalcButtonModel(calcButton: .add, color: foregroundRightButtonsColor)
        
        ]),
        
        RowOfCalcButtonsModel(row: [
            CalcButtonModel(calcButton: .undo),
            CalcButtonModel(calcButton: .zero),
            CalcButtonModel(calcButton: .decimal),
            CalcButtonModel(calcButton: .equal, color: foregroundRightButtonsColor)
        
        ])
        
        
    ]
    
    var body: some View {
        Grid() {
            ForEach(buttondData) { rowOfCalcButtonsModel in
                GridRow {
                    ForEach(rowOfCalcButtonsModel.row) { calcButtonModel in
                        Button(
                            action: {
                                // Logic takes place here
                            print("Button pressed")
                                buttonPressed(calcButton: calcButtonModel.calcButton)
                        }, label: {
                            ButtonView(
                                calcButton: calcButtonModel.calcButton,
                                fgColor: calcButtonModel.color,
                                bgColor: buttonBackground)
                        })
                    }
                }
            }
        }
        .padding()
        .background(secondaryBackgroundColor.cornerRadius(20))
    }
    
    func buttonPressed(calcButton: CalcButton) {
        // Logic
        switch calcButton {
        case .clear:
            currentComputation = ""
            mainResult = "0"
            
        case .equal, .negative:
            print("eq/neg")
            if !currentComputation.isEmpty {
                if !lastCharacterIsAnOperator(str: currentComputation) {
                    let sign = calcButton == .negative ? -1.0 : 1.0
                    mainResult = formatResult(val: sign * calculateResults())
                    
                    if calcButton == .negative {
                        currentComputation = mainResult
                    }
                }
            }
            
        case .decimal:
            print("decimal")
            
        case .percent:
            print("percent")
            if lastCharIsDigit(str: currentComputation) {
                appendToCurrentComputation(calcButton: calcButton)
            }

        case .undo:
            print("undo")
            currentComputation = String(currentComputation.dropLast())
            
        case .add, .subtract, .divide, .multiply:
            // Needs futher implementation
            if lastCharIsDigitOrPercent(str: currentComputation) {
                appendToCurrentComputation(calcButton: calcButton)
            }
            
        default:
            // Needs futher implementation
            appendToCurrentComputation(calcButton: calcButton)
        }
    }
    
    // Implements the actual computation
    func calculateResults() -> Double {
        let visibleWorkings: String = currentComputation
        var workings = visibleWorkings.replacingOccurrences(of: "%", with: "*0.01")
        workings = workings.replacingOccurrences(of: multiplySymbol, with: "*")
        workings = workings.replacingOccurrences(of: divisionSymbol, with: "/")
        
        // If we have "35." this will be replaced
        // by "35.0"
        if getLastChar(str: visibleWorkings) == "." {
            workings += "0"
        }
        
        // key point !
        // Actual computation
        let expr = NSExpression(format: workings)
        let exprValue = expr.expressionValue(with: nil, context: nil) as! Double
        
        return exprValue
    }
    
    func appendToCurrentComputation(calcButton: CalcButton) {
        currentComputation += calcButton.rawValue
    }
}

struct CalcsButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        CalcsButtonsView(currentComputation: .constant("5 + 1"), mainResult: .constant("6"))
    }
}
