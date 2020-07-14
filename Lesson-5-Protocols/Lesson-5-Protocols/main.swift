//
//  main.swift
//  Lesson-5-Protocols
//
//  Created by Andrey on 13/07/2020.
//  Copyright © 2020 Andrey. All rights reserved.
//

import Foundation

protocol Car {
    var make: String { get }
    
    var year: Int { get }
    
    var color: String { get }
    
    var isEngineOn: Action.Engine { get }
    
    var isMoving: Action.Transmission { get }
    
    var areWindowsOpen: Action.Windows { get }
    
    func park()
    
    func drive()
    
    func startEngine()
    
    func openWindows()
}

enum Action {
    
    enum Transmission {
        case park
        case drive
    }
    
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

class SportCar: Car {
    
    var make: String
    
    var year: Int
    
    var color: String
    
    var isEngineOn: Action.Engine
    
    var isMoving: Action.Transmission
    
    var areWindowsOpen: Action.Windows
    
    // ----- extra properties ----- start
    
    var isNitroOn: Bool
    
    var suspensionMode: SuspensionMode
    
    enum SuspensionMode {
        case track
        case normal
    }
    
    // ----- extra properties ----- end
    
    func openWindows() {
        if areWindowsOpen == .closed || areWindowsOpen == .halfOpen {
            areWindowsOpen = .open
            print("Hurrah!! The windows are fully open!")
        }
    }
    
    func startEngine() {
        if isEngineOn == .off {
            isEngineOn = .on
            print("Get ready!! The engine is on!")
        }
    }
    
    func park() {
        if isMoving == .drive {
            isMoving = .park
            suspensionMode = .normal
            isEngineOn = .off
            isNitroOn = false
            print("Awesome! The car is parked now")
        }
    }
    
    func drive() {
        if isMoving == .park {
            isEngineOn = .on
            suspensionMode = .track
            isNitroOn = true
            print("Fantastic! The car is driving now")
        }
        
    }
    
    init(make: String, year: Int, color: String) {
        self.isMoving = .park
        self.areWindowsOpen = .closed
        self.isEngineOn = .off
        self.make = make
        self.year = year
        self.color = color
        self.isNitroOn = false
        self.suspensionMode = .normal
    }
    
}

class TrunkCar: Car {
    
    var make: String
    
    var year: Int
    
    var color: String
    
    var isEngineOn: Action.Engine
    
    var isMoving: Action.Transmission
    
    var areWindowsOpen: Action.Windows
    
    // ----- extra properties ----- start
    
    var bootStatus: BootStatus
    
    var speedLimit: Int
    
    enum BootStatus {
        case normal
        case overloaded
    }
    
    // ----- extra properties ----- end
    
    func startEngine() {
        
        if isEngineOn == .off {
            isEngineOn = .on
            print("Get ready!! The engine is on!")
        }
    }
    
    func openWindows() {
        
        if areWindowsOpen == .closed || areWindowsOpen == .halfOpen {
            areWindowsOpen = .open
            print("Hurrah!! The windows are fully open!")
        }
    }
    
    
    func park() {
        if isMoving == .drive {
            isMoving = .park
            isEngineOn = .off
            print("Fine! Our truck is parked now!")
        }
    }
    
    func drive() {
        if isMoving == .park {
            isEngineOn = .on
            isMoving = .drive
            if bootStatus == .normal {
                print("Ok! We are driving now with a speed limit of: \(speedLimit) km / h")
            } else {
                print ("Oops! It seems like you need to remove an excess load from the boot")
                print("Fantastic! The car is driving now")
            }
            
        }
        
    }
    
    init(make: String, year: Int, color: String, speedLimit: Int) {
        self.make = make
        self.year = year
        self.color = color
        self.isEngineOn = .off
        self.isMoving = .park
        self.areWindowsOpen = .closed
        self.bootStatus = .normal
        self.speedLimit = speedLimit
    }
    
}

var myCoolSportCar = SportCar(make: "Pangani", year: 2010, color: "black")

print (myCoolSportCar)

myCoolSportCar.drive()

print("myCoolSportCar.isNitroOn:", myCoolSportCar.isNitroOn) // when the sport car is in drive mode, the nitro acceleration is on

var myAwesomeSportCar = SportCar(make: "Bugatti", year: 2015, color: "white")

print (myAwesomeSportCar)

myAwesomeSportCar.drive()

print("myAwesomeSportCar.suspensionMode:", myAwesomeSportCar.suspensionMode) // when the sport car is in drive mode, the suspension switches to track mode

var myBestTrunkCar = TrunkCar(make: "Toyota", year: 2009, color: "Silver", speedLimit: 90)

print(myBestTrunkCar)

myBestTrunkCar.bootStatus = .overloaded

print("myBestTrunkCar.bootStatus:", myBestTrunkCar.bootStatus)

myBestTrunkCar.drive() // if the boot is overloaded the car won't move

myBestTrunkCar.bootStatus = .normal

myBestTrunkCar.drive() // but if we take out an excess load from the boot, it will drive as normal

extension SportCar: CustomStringConvertible {
    var description: String {
        return "make: \(make), year: \(year), color: \(color), isMoving: \(isMoving), isEngineOn: \(isEngineOn), areWindowsOpen: \(areWindowsOpen), isNitroOn: \(isNitroOn), suspensionMode: \(suspensionMode)"
    }
    
}
    
extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "make: \(make), year: \(year), color: \(color), isMoving: \(isMoving), isEngineOn: \(isEngineOn), areWindowsOpen: \(areWindowsOpen), bootStatus: \(bootStatus), speedLimit: \(speedLimit)"
    }

}
