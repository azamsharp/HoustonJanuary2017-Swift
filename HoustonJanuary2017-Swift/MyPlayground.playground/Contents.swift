
import UIKit

class Address {
    
    var street :String?
    var city :String?
}

class User {
    
    var address :Address?
}

let user = User()
user.address = Address()
user.address?.city = "Houston"


print(user.address!)

//print((user.address?.city)!)

if let address = user.address {
    if let city = address.city {
        print(city)
    }
}

guard let address = user.address,
        let city = address.city
    else {
    fatalError("")
}

print(address)
print(city)



// optionals 

let age :Int?
age = 23

let name :String?

name = "John"

if let name = name {
    print(name)
}

guard let n = name else {
    fatalError("name is nil")
}

// all code over here

print(name!)
print(age!)



// availability API 


// extensions

class Palindrome {
    
    func isPalindrom(string :String) -> Bool {
        return true
    }
    
}

extension Int {
    
    func isPrime() -> Bool {
        
        print(self)
        
        return true
    }
    
}

extension String {
    
    func isPalindrom() -> Bool {
        
        if self == "Cat" {
            return false
        }
        
        return true
    }
}

extension UIColor {
    
    static func initWithHex(hexCode :String) -> UIColor {
        
        if hexCode == "FFFFFF" {
            return UIColor.white
        }
        
        return UIColor.green
        
    }
}

UIColor.initWithHex(hexCode: "FFFFFF")



let word = "Cat"
word.isPalindrom()

let number  = 7
number.isPrime()


/* 
 
  UIColor+Additions.h 
  UIColor+Additions.m
 
 */

// protocols

// protocols extensions 

protocol Flyable : class {
    func fly()
}

extension Flyable {
    
    func fly() {
        print("I can fly")
    }
}

class Bird : Flyable {
//    func fly() {
//        print("Birds can fly")
//    }
}

class Pelican : Bird {
    
//    override func fly() {
//        print("Pelican can fly")
//    }
    
}

let pelican = Pelican()
pelican.fly()


// error handling 

func add(a :Int, b:Int) throws {
    
}

do {
    
    try add(a: 2, b: 4)

    
} catch {
    print("error caught")
}









// generics

