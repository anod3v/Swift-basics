//
//  main.swift
//  Cars
//
//  Created by Andrey on 06/07/2020.
//  Copyright © 2020 Andrey. All rights reserved.
//

import Foundation

struct Car {
    let make: String
    let year: Int
    let color: String
    let bootVolume: Int
    var isEngineOn: Bool
    var isMoving: Bool
    var signalLight: Action.LightState

    enum Action {
        
        enum Direction {
            case forward
            case back
            case left
            case right
        }
        
        enum LightState {
            case leftTurnLightOn
            case rightTurnLightOn
            case allLightsOff
        }

    }
    
    init(make: String, year: Int, color: String, bootVolume: Int) {
        self.make = make
        self.year = year
        self.color = color
        self.bootVolume = bootVolume
        isEngineOn = false
        isMoving = false
        signalLight = .allLightsOff
    }
    
    mutating func moveCar(direction: Action.Direction) {
        isEngineOn = true
        isMoving = true
        signalLight = .allLightsOff
        switch direction {
        case .forward:
            print("Cool! We are moving forward!")
            signalLight = .allLightsOff
        case .back:
            print("Nice! We are moving backward!")
            signalLight = .allLightsOff
        case .left:
            print("Awesome! We are moving left!")
            signalLight = .leftTurnLightOn
            print("Wow! Left signals are on!")
        case .right:
            print("Great! We are moving right!")
            signalLight = .rightTurnLightOn
        
        }
    }
}

var myAwesomeCar = Car(make: "toyota", year: 2009, color: "black", bootVolume: 400)

print("myAwesomeCar.isMoving", myAwesomeCar.isMoving)

myAwesomeCar.moveCar(direction: .forward)

print("myAwesomeCar.isMoving", myAwesomeCar.isMoving)

print("signalLight", myAwesomeCar.signalLight)

myAwesomeCar.moveCar(direction: .left)

print("signalLight", myAwesomeCar.signalLight)

var myNotSoAwesomeCar = Car(make: "nissan", year: 1999, color: "white", bootVolume: 600)

myNotSoAwesomeCar.moveCar(direction: .forward)
myNotSoAwesomeCar.moveCar(direction: .right)
myNotSoAwesomeCar.moveCar(direction: .back)

struct Truck {
    let make: String
    let year: Int
    let color: String
    let bootVolume: Int
    var engineStatus: Action.Engine
    var windowsStatus: Action.Windows

    enum Action {
        case park
        case drive
        
        enum Windows {
            case open
            case closed
            case halfOpen
        }
        
        enum Engine {
            case on
            case off
        }

    }
    
    init(make: String, year: Int, color: String, bootVolume: Int) {
        self.make = make
        self.year = year
        self.color = color
        self.bootVolume = bootVolume
        self.engineStatus = .off
        self.windowsStatus = .closed
    }
    
    mutating func parkOrDrive(switchTo: Action) {

        switch switchTo {
        case .park:
            windowsStatus = .closed
            engineStatus = .off
            print("Fine! Our truck is parked now!")
        case .drive:
            windowsStatus = .open
            engineStatus = .on
            print("Ok! We are driving!")
        }
    }

}

var myAwesomeTruck = Truck(make: "tesla", year: 2036, color: "white", bootVolume: 100000)

print("myAwesomeTruck.engineStatus", myAwesomeTruck.engineStatus)
print("myAwesomeTruck.windowsStatus", myAwesomeTruck.windowsStatus)

myAwesomeTruck.parkOrDrive(switchTo: .drive)

print("myAwesomeTruck.engineStatus", myAwesomeTruck.engineStatus)
print("myAwesomeTruck.windowsStatus", myAwesomeTruck.windowsStatus)

myAwesomeTruck.parkOrDrive(switchTo: .park)

print("myAwesomeTruck.engineStatus", myAwesomeTruck.engineStatus)
print("myAwesomeTruck.windowsStatus", myAwesomeTruck.windowsStatus)

