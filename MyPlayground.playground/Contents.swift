//: Playground - noun: a place where people can play

import UIKit

// If I'm defining an index to an array, but I haven't defined my array yet, I can make the index variable optional. Then its initial value is nil because there's no valid index yet at this point.
var arrayIndex: Int?
print("arrayIndex = \(String(describing: arrayIndex))")

var myColor: UIColor? = nil
// nil coalescing operator - if myColor is nil, then use the value UIColor.red to assign to realColor, otherwise if myColor is non-nil, then assign its value to realColor
var realColor: UIColor = myColor ?? UIColor.red
print("color = \(realColor)")


// Dictionary ([String : String])
let studentsGrades = [ "Bob" : "A", "Joe" : "A" ]

// Get Bob's grade
// bobsGrade is an optional String (String?) because there's no guarantee that "Bob" in in the dictionary studentsGrades, so if it can't find it, it'll be given the value nil
// The compiler infers the type for bobsGrade based on the type for studentsGrade
let bobsGrade = studentsGrades["Bob"]
print("Bob's grade is \(bobsGrade)")



//
// Unwrapping optionals
//

var instructors = ["cory", "hirad", "ian"]
var myIndex = instructors.index(of: "cory")

// Check if myIndex is nil
if myIndex != nil {
    // Since myIndex is not nil, I can force unwrap (!) it to get the Int value, and assign it to index
    let index = myIndex!
    // Since index is an Int, I can use it to index instructors
    let instructor = instructors[index]
    print("Hi, I’m \(instructor)")
}

// A better way is as follows...

// Take myIndex (which is optional, so could contain nil) and do a safe unwrap -- if it's not nil, then take its Int value and assign it to index. If it is nil, then the if fails, and the if block is not executed
if let index = myIndex {
    print("Hi, I’m \(instructors[index])")
}






//
// Downcasting
//

class Vehicle {
    
    private var myInt: Int = 0  // The member variable myInt is not accessible outside of Vehicle
}

func ==(lhs: Vehicle, rhs: Vehicle) -> Bool {
    // Compare left-hand-side to right-hand-side and determine if they're equal or not
    // I.e. if model, year and mileage are the same, then return true, else return false
    return true
}

class Car: Vehicle {
    
}

// Initialise an array of Vehicle objects
var vehicles = [Vehicle]()

// Create a vehicle and a car
let newVehicle = Vehicle()
let newCar = Car()

if (newCar == newVehicle) {
    
}


// Add them to the array
vehicles.append(newVehicle)
vehicles.append(newCar)   // ok, because a car is a vehicle

// Take out the object at index 1, which is a car
let vehicleAtIndex1 = vehicles[1]
let sedan = vehicleAtIndex1 as? Car  // as? is a conditional downcast, if the element is a Car, then it succeeds, otherwise it fails
print("sedan: \(sedan)")  // Sedan here is type Car? (optional)

// This is a big NO-NO. A force downcast can potentially crash if the downcast fails
//let unsafeSedan = vehicleAtIndex1 as! Car
//print("unsafe sedan: \(unsafeSedan)")

// Another way to do this
if let sedan = vehicleAtIndex1 as? Car {
    // We will only get here if the downcast was successful
    print("sedan: \(sedan)")  // Sedan here is type Car (not optional)
    
    let anotherVehicle: Vehicle = sedan   // I can upcast anytime without using "as", sedan is a car, so I can assign it to a Vehicle
}



