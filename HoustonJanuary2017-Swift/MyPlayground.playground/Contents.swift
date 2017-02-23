//: Playground - noun: a place where people can play

import UIKit

func sayHello() {
    print("sayHello fired")
}

func sayHello(to name :String) {
    print(name)
}

func add(firstValue :Int, secondValue :Int) -> Int {
    return firstValue + secondValue
}

func verifyAge(name :String, age :Int) -> Bool {
    return true
}


var age = 10
age = 11

let name = "John"
//name = "Mary" // cannot change the let constant

sayHello()

sayHello(to :"John")

// add(10,10) Swift 2.X

let result = add(firstValue: 10, secondValue: 20)

let isVerified = verifyAge(name: "John", age: 29)

// collections 

let numbers = [2,3,1,2,12,45,67]

//numbers.append(400)
//numbers.remove(at: 2)

var names = ["Alex","John","Mary"]
names.append("Sally")

names[2]

names.append("23")

for name in names {
    print(name)
}

for index in 0..<10 {
    print(index)
}


for index in 0...names.count - 1 {
    print(index)
}

for index in 0..<names.count {
    print(index)
}

// dictionaries 

var airports = ["IAH":"Intercontinental Airport","SJO":"San Jose Airport"]

airports["MX"] = "Mexico City"

airports["MX"]

for (key,value) in airports {
    print(key)
    print(value)
}


// conditions 

let myAge = 20

if myAge < 20 {
    
} else {
    
}

// classes 

class GroceryCategory {
    
    var title :String // defining a property
    var address :String
    
    init(title :String,address :String) {
        self.title = title
        self.address = address
    }
    
    func showGroceryList() {
        
    }
    
    func showItemsByStoreId(storeId :String) {
        
    }
}

let gc = GroceryCategory(title: "Walmart", address: "Richmond Ave")
gc.showGroceryList()

gc.showItemsByStoreId(storeId: "2345")



//gc.title?.uppercased()
//gc.address = "Richmond Ave"
//print(gc.address!.uppercased())
//gc.address?.capitalized
//let gc = GroceryCategory(title: "Walmart", address: "Richmond Ave")
//gc.showGroceryList()

class Animal {
    
    func walk() {
        
    }
    
}

class Dog : Animal {
    
    override func walk() {
        print("Dog is walking")
    }
    
    func sleep(_ numberOfHours :Int) {
        
    }
}

let dog = Dog()
dog.walk()

//dog.sleep(numberOfHours: 12)

dog.sleep(10)

class GroceryCategoryTableViewController : UITableViewController {
    
    @IBOutlet weak var firstNameTextField :UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    @IBAction func buttonPressed() {
        
    }
    
    @IBAction func someButtonPressed(sender :Any) {
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        return cell
    }
    
}










