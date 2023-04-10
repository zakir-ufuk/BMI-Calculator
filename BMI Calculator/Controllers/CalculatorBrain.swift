//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Zakir Ufuk Sahiner on 10.04.23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    func getBMIValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
            return bmiTo1DecimalPlace
        }
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    func getColor() -> UIColor {
        bmi?.color ?? UIColor.white
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height) // alternative pow(height, 2)
           
        if bmiValue < 18.5 {
            if #available(iOS 15.0, *) {
                bmi = BMI(value: bmiValue, advice: "Eat more pies", color: UIColor.systemCyan )
            } else {
                bmi = BMI(value: bmiValue, advice: "Eat more pies", color: UIColor.blue )
            }
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as fiddle", color: UIColor.systemGreen)
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies", color: UIColor.systemRed )
        }
    }
}
