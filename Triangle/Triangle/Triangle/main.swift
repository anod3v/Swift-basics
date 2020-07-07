//
//  main.swift
//  Triangle
//
//  Created by Andrey on 28/06/2020.
//  Copyright © 2020 Andrey. All rights reserved.
//

import Foundation

print("Hi! Let's assume a right triangle with 'a' and 'b' legs")
print("Please enter 'a' leg")
let a = Float(readLine()!)!
print("Please enter 'b' leg")
let b = Float(readLine()!)!
let area = a * b / 2
let c = sqrt(a * a + b * b)
let perimeter = a + b + c
print("Great! Then, the triangle area equals to \(area), the hypotenuse equals to \(c), the perimeter is \(perimeter)")

