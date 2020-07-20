//
//  main.swift
//  ErrorHandling
//
//  Created by Andrey on 20/07/2020.
//  Copyright © 2020 Andrey. All rights reserved.
//

import Foundation

struct InputData {
    let noOfEmployees: Int
    let typeOfService: String
    let amountToTaxInUSD: Double
}

enum CompanySize {
    case Small
    case Medium
    case Large
}

enum InputDataError: Error {
    case invalidAmount
    case invalidNoOfEmployees
    case invalidService
}

enum NoTaxError: Error {
    case notATaxableCompany
}

class Tax {
    let typeOfServiceFactors = [
        "Construction" : 0.5,
        "Transportation" : 0.4,
        "Agriculture" : 0.3,
        "Legal" : 0.2,
        "Mining" : 0.1
    ]
    let notTaxable = [
        "IT",
        "Medecine"
    ]
    
    let noOfEmployeesFactor = [
        CompanySize.Small : 0.1,
        CompanySize.Medium : 0.2,
        CompanySize.Large : 0.3
    ]
    
}

let newSmallTax = Tax()

func calculateTax  (inputData: InputData) throws -> Double {
    
    var companySize = CompanySize.Small
    
    guard let employeesFactor = newSmallTax.noOfEmployeesFactor[companySize], employeesFactor > 0 else {
        throw InputDataError.invalidNoOfEmployees
    }
    
    guard !newSmallTax.notTaxable.contains(inputData.typeOfService) else {
        throw NoTaxError.notATaxableCompany }
    
    guard let servicesFactor = newSmallTax.typeOfServiceFactors[inputData.typeOfService] else {
        throw InputDataError.invalidService }
    
    guard inputData.amountToTaxInUSD > 0 else {
        throw InputDataError.invalidAmount
    }
    
    switch inputData.noOfEmployees {
        
    case 1 ..< 10:
        companySize = .Small
    case 10 ..< 100:
        companySize = .Medium
    case 100 ..< Int.max:
        companySize = .Large
    default:
        throw InputDataError.invalidNoOfEmployees
    }
    
    let resultantTax = inputData.amountToTaxInUSD * employeesFactor * servicesFactor
    
    return resultantTax
}

let myConstructionStartup = InputData(noOfEmployees: 10, typeOfService: "Construction", amountToTaxInUSD: 1000)

let faceBook = InputData(noOfEmployees: 100000, typeOfService: "IT", amountToTaxInUSD: 1000000000)

let someCompany = InputData(noOfEmployees: 20, typeOfService: "Finance", amountToTaxInUSD: 10000)


do {
    let tax = try calculateTax(inputData: faceBook)
} catch InputDataError.invalidAmount {
    print("Please enter a positive amount")
} catch InputDataError.invalidService {
    print("Please enter a valid type of service")
} catch InputDataError.invalidNoOfEmployees {
    print("Please enter a valid number of employees")
} catch NoTaxError.notATaxableCompany {
    print("Your company does not need to pay the tax")
    
} catch let error {
    print(error.localizedDescription)
}

