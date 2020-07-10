//
//  main.swift
//  CarSubClass
//
//  Created by Andrey on 09/07/2020.
//  Copyright © 2020 Andrey. All rights reserved.
//

import Foundation

class Car {
    let make: String
    let year: Int
    let color: String
    var isEngineOn: Bool
    var isMoving: Bool
    
    enum Action {
        case park
        case drive
    }
    
    func parkOrDrive(switchTo: Action) {
        
        switch switchTo {
        case .park:
            isEngineOn = false
            isMoving = false
            print("Fine! Our car is parked now!")
        case .drive:
            isEngineOn = true
            isMoving = true
            print("Ok! We are driving!")
        }
        
    }
    
    init(make: String, year: Int, color: String) {
        self.make = make
        self.year = year
        self.color = color
        self.isEngineOn = false
        self.isMoving = false
    }
}

class SportCar: Car {
    
    var isNitroOn: Bool
    var suspensionMode: SuspensionMode
    
    enum SuspensionMode {
        case track
        case normal
    }
    
    override func parkOrDrive(switchTo: Action) {
        
        switch switchTo {
        case .park:
            suspensionMode = .normal
            isEngineOn = false
            isMoving = false
            isNitroOn = false
            print("Fine! Our sport car is parked now!")
        case .drive:
            suspensionMode = .track
            isEngineOn = true
            isMoving = true
            isNitroOn = true
            print("Ok, be ready! We are driving really fast!")
        }
        
    }
    
    init(suspensionMode: SuspensionMode, make: String, year: Int, color: String) {
        self.isNitroOn = false
        self.suspensionMode = suspensionMode
        super.init(make: make, year: year, color: color)
    }
    
}

class TrunkCar: Car {
    
    var bootStatus: BootStatus
    var speedLimit: Int
    
    enum BootStatus {
        case normal
        case overloaded
    }
    
    init(speedLimit: Int, bootStatus: BootStatus, make: String, year: Int, color: String) {
        self.speedLimit = speedLimit
        self.bootStatus = bootStatus
        super.init(make: make, year: year, color: color)
    }
    
    override func parkOrDrive(switchTo: Action) {
        
        switch switchTo {
        case .park:
            isEngineOn = false
            isMoving = false
            print("Fine! Our truck is parked now!")
        case .drive:
            isEngineOn = true
            isMoving = true
            if bootStatus == .normal {
                print("Ok! We are driving now with a speed limit of: \(speedLimit) km / h")
            } else {
                print ("Oops! It seems like you need to remove an excess load from the boot")
            }
        }
    }
}

var myCoolSportCar = SportCar(suspensionMode: .normal, make: "Pangani", year: 2010, color: "black")

print("myCoolSportCar.isNitroOn:", myCoolSportCar.isNitroOn)

myCoolSportCar.parkOrDrive(switchTo: .drive)

print("myCoolSportCar.isNitroOn:", myCoolSportCar.isNitroOn) // when the sport car is in drive mode, the nitro acceleration is on

var myAwesomeSportCar = SportCar(suspensionMode: .normal, make: "Bugatti", year: 2015, color: "white")

print("myAwesomeSportCar.suspensionMode:", myAwesomeSportCar.suspensionMode)

myAwesomeSportCar.parkOrDrive(switchTo: .drive)

print("myAwesomeSportCar.suspensionMode:", myAwesomeSportCar.suspensionMode) // when the sport car is in drive mode, the suspension switches to track / race mode

var myBestTrunkCar = TrunkCar(speedLimit: 90, bootStatus: .normal, make: "Toyota", year: 2009, color: "Silver")

print("myBestTrunkCar.bootStatus:", myBestTrunkCar.bootStatus)

myBestTrunkCar.bootStatus = .overloaded

print("myBestTrunkCar.bootStatus:", myBestTrunkCar.bootStatus)

myBestTrunkCar.parkOrDrive(switchTo: .drive) // if the boot is overloaded the car won't move

myBestTrunkCar.bootStatus = .normal

myBestTrunkCar.parkOrDrive(switchTo: .drive) // but if we take out an excess load from the boot, it will drive as normal


