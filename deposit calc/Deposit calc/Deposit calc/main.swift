//
//  main.swift
//  Deposit calc
//
//  Created by Andrey on 29/06/2020.
//  Copyright © 2020 Andrey. All rights reserved.
//

import Foundation

print("Здравствуйте, давайте посчитаем доходность банковского вклада с ежегодной капитализацией")

var depositAmount: Float = 0
var depositYield: Float = 0
let numberOfYears = 5

while depositAmount <= 0 {
    print("Введите начальную сумму вклада в рублях.")
    depositAmount = Float(readLine()!)!;
    if depositAmount <= 0 {
        print("Сумма вклада должна быть неотрицательной")
    } else { break }
}

while depositYield <= 0 {
    print("Введите ставку в процентах")
    depositYield = Float(readLine()!)!;
    if depositYield <= 0 {
        print("Ставка по вкладу должна быть неотрицательной")
    } else { break }
}

for year in 1...numberOfYears {
    depositAmount = depositAmount * (1 + depositYield/100)
    let yieldRounded = (depositAmount * 100).rounded() / 100
    print("Сумма вклада с процентами по истичении \(year)-го года составит \(yieldRounded) рублей.")
}
