//
//  main.swift
//  Quadratic eqtn
//
//  Created by Andrey on 28/06/2020.
//  Copyright © 2020 Andrey. All rights reserved.
//

import Foundation

print("Hi! Let's assume a quadratic equation of the following formula: ax^2 - bx - c = 0")
print("Please enter 'a' value")
let a = Float(readLine()!)!
print("Please enter 'b' value")
let b = Float(readLine()!)!
print("Please enter 'c' value")
let c = Float(readLine()!)!

let bSquared = b * b
let discriminant = bSquared - (4 * a * c)
let isReal = discriminant < 0
let discrimimantAbsSqrt = sqrt(abs(discriminant))

if isReal {
    print("No real solutions available")
} else {
    let topFormula = -b + discrimimantAbsSqrt
    let bottomFormula = 2 * a
    let totalX = topFormula / bottomFormula

    let topFormula2 = -b - discrimimantAbsSqrt
    let totalX2 = topFormula2 / bottomFormula

    print("X = \(totalX) & \(totalX2)")

}
