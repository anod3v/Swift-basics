//
//  main.swift
//  Lesson-2
//
//  Created by Andrey on 01/07/2020.
//  Copyright © 2020 Andrey. All rights reserved.
//

import Foundation

// 1. Написать функцию, которая определяет, четное число или нет.

func isEven (number: Int) -> Bool {
    if number % 2 == 0 {
        return true
    } else {
        return false
    }
}

print(isEven(number: 4))

// 2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func isEvenlyDivisibleByThree (number: Int) -> Bool {
    if number % 3 == 0 {
        return true
    } else {
        return false
    }
}

print(isEvenlyDivisibleByThree(number: 9))

// 3. Создать возрастающий массив из 100 чисел.

var array = [Int]()
var arrayOfItemsToRemove = [Int]()
var item = 0

for _ in 1...100 {
    item += 1
    array.append(item)
}

print(array)

// 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

for index in array.indices {
    if !isEvenlyDivisibleByThree(number: array[index]) {
        arrayOfItemsToRemove.append(array[index])
    }
}

for index in arrayOfItemsToRemove.indices {
    array.remove(at: array.firstIndex(of: arrayOfItemsToRemove[index])!)
}

print(array)

//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.

func generateFibonacciArray (numberOfItems: Int) -> [Double] {
    var fibArray: [Double] = [0,1]
    var fibNumber: Double = 0
    if numberOfItems == 0 || numberOfItems == 1 || numberOfItems == 2 {
        return Array(fibArray.prefix(numberOfItems))
    }
    if numberOfItems < 0 {
        return []
    }
    for _ in 2...(numberOfItems - 1) {
        let beforeLastFibNumber = fibArray[fibArray.endIndex - 2]
        let lastFibNumber = fibArray.last
        fibNumber = lastFibNumber! + beforeLastFibNumber
        fibArray.append(fibNumber)
    }
    return fibArray
}

print(generateFibonacciArray(numberOfItems: 100))

//6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу.

func generateArrayOfPrimes (numberOfItems: Int) -> [Int] {
    
    var arrayOfPrimes = [Int] ()
    var number = 1
    
    func isPrime(_ number: Int) -> Bool {
        if number < 2 || number % 2 == 0 { return false }
        if number == 2 { return true  }
        let squareRoot = Int(sqrt(Double(number)))
        for item in stride (from: 3, through: squareRoot, by: 2) {
            if number % item == 0 {
                return false
            }
        }
        return true
    }
    
    repeat {
        if isPrime(number) {
            arrayOfPrimes.append(number)
        }
        number += 1
    } while arrayOfPrimes.count < numberOfItems
    return arrayOfPrimes
}

print(generateArrayOfPrimes(numberOfItems: 100))

