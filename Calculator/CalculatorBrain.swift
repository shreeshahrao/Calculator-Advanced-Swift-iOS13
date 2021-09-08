//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Shreesha on 08/09/21.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    var dispValue: Double?
    
    private var intermediateCalculation: (n1: Double , calcMethod: String)?
    
    mutating func setNumber(_ dispValue: Double){
        self.dispValue = dispValue
    }
    
    mutating func calculate(Symbol: String) -> Double? {
        
        if let n = dispValue {
        if Symbol == "+/-" {
            return  n * -1
            
        }else if Symbol == "%" {
            return n / 100
        } else if Symbol == "AC" {
            return 0}
        
            else if Symbol == "=" {
                return performCalculation(n2: n)
            }
         else  {
            intermediateCalculation = (n1: n , calcMethod: Symbol)
        }
       
        }
        return nil
    }
    
    mutating private func performCalculation(n2: Double) -> Double? {
        
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod{
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "x":
                return n1 * n2
            case "/":
                return n1 / n2
            default:
                return nil
            }
        
    }
        return nil
}
}
