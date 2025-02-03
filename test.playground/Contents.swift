import Foundation

class BankAccount {
  var person: Person12? = nil
  var accountNumber: Int
  
  init(_accountNumber: Int) {
    accountNumber = _accountNumber
    print("Bank account number \(accountNumber) is initialized")
  }
  
  deinit {
    print("Bank account number \(accountNumber) is de-initialized")
  }
}

class Person12 {
  var name: String
  var bankAccount: BankAccount? = nil
  
  init(_name: String) {
    self.name = _name
    print("Person \(name) is initialized")
  }
  deinit {
    print("Person \(name) is de-initialized")
  }
}

var codeCatBank: BankAccount? = BankAccount(_accountNumber: 29)
var manasPersonObj: Person12? = Person12(_name: "Manas")
//codeCatBank = nil
//manasPersonObj = nil

manasPersonObj?.bankAccount = codeCatBank
codeCatBank?.person = manasPersonObj
//manasPersonObj = nil
//codeCatBank = nil

manasPersonObj?.bankAccount = nil
//codeCatBank?.person = nil




// 1. Array
var someInt: [Int] = []
someInt.append(5)
someInt = []

var newVe = Array(repeating: 5.5, count: 3)
var anotherVe = Array(repeating: 3.5, count: 2)
var conVe = newVe + anotherVe
conVe.count
conVe.append(4.8)
conVe.prefix(2)
conVe.suffix(2)
var opVa: [Double] = [3.33]
conVe += opVa
conVe.insert(9.0, at: 7)
conVe.sorted()
conVe[4]
conVe.isEmpty
conVe.remove(at: 7)
conVe.contains(5.5)
conVe[4]=2.5 // update
conVe.removeAll()

conVe
for(index, value) in conVe.enumerated() {
  print("IndexNumber \(index) : \(value)")
}

// 2. Sets
var letter = Set<Character>()
letter.count
letter.insert("a")
letter = []
var fav: Set<String> = ["Rock","Classical"]
//or... var fav: Set = ["Rock","Classical"]
fav.count
fav.insert("funk")
fav.count
fav.contains("kanishk")
fav.contains("funk")
fav
fav.sorted()
fav.isEmpty
fav.remove("funk")
fav.removeAll()

// 3. Dictionary
var nameOfInt:[Int: String] = [:]
nameOfInt[16] = "Sixteen"
nameOfInt
nameOfInt = [:]
var airpods: [String: String] = ["LHS":"Lodon","DUB":"Dublin","APL":"Andhra","IGI":"Indira ghandi Airport"]
airpods.count
airpods.isEmpty
airpods["LHS"]
airpods["LHS"] = "lONDON hEAT"
airpods.removeValue(forKey: "APL")
airpods["IGI"] = nil
airpods
for(key, value) in airpods {
  print("\(key) : \(value)")
}
for(key) in airpods.keys {
  print("\(key)")
}
for(value) in airpods.values {
  print("\(value)")
}

// 4. Tuples
var product = ("Mac",100)
product.0
product.1
product.1 = 50
product
var company = (productName: "App", version: 1.0)
company
company.productName

// 5. Map()
let numbers = [1,2,3,4,5]
let doubled = numbers.map{$0*2}
doubled

// 6. CompactMap()
let compMapNum = ["5", "42", "nine", "100", "Bob"]
Int(compMapNum[0])
let result = compMapNum.compactMap{Int($0)}
result

// 7. FLatMap() (deconstructor for arrays...)
let codes = [["abc","def","ghi"],["jkl","mno","pqr"]]
let newCodes = codes.flatMap{$0}
newCodes
let anotherCode = newCodes.flatMap{$0.map{$0.uppercased()}}
anotherCode

// 8. Sort()
let sortArr = [1, 5, 2, 10, 6, 2, 7, 4, 10, 15]
let newSortArr = sortArr.sorted()
newSortArr
let anotherDescSort = sortArr.sorted {$0 > $1 }
anotherDescSort
let anotherAscSort = sortArr.sorted {$0 < $1 }
anotherAscSort

// 9. filter()
let filterArr = [1, 5, 2, 10, 6, 2, 7, 4, 10, 15]
let newFilterArr = filterArr.filter{$0<6}.sorted()
newFilterArr
let anotherFilter = filterArr.filter{$0<6 && $0>4}
anotherFilter

// 10. Reduce()
let reduceArr = [1, 5, 2, 10, 6, 2, 7, 4, 10, 15]
//reduce(initialResult, (currentResult, currentElement) -> Return finalResult)
let newReduceArr = reduceArr.reduce(0, {$0 + $1})
newReduceArr
let anotherReduceArr = reduceArr.reduce(0) { result, num in
  result + num
}
anotherReduceArr 
let reduceStringArr = ["1","2","3"]
let num = reduceStringArr.reduce(0, {$0 + (Int($1) ?? 0)})
num

typealias studentName = String
let name: studentName = "Kanishk"
name

func countLettersInString(myString str: String) {
  var a = 0
  var elements = ""
  for item in str {
    if !elements.contains(item) {
      elements.append(item)
      a += 1
    }
  }
  print("elements", elements.count, "a", a)
  for item in str {
    print(item)
  }
  print("The string \(str) has \(str.count) letters.")
}

countLettersInString(myString: "Hello")

// Extension
extension Double {
  var mm: Double { return self/1000.0 }
}
let oneInch: Double = 25.4.mm
print(oneInch)

// Generic View
import SwiftUI

struct GenericView<T: View>: View {
  let title: String
  let content: T
  var body: some View {
    HStack {
      Text(title)
      content
    }
  }
}

GenericView(title: "Hello World", content: Text("abc"))

// ViewBuilder

struct GenericViewBuilder<T: View>: View {
  let title: String
  let content: T
  init(title: String, @ViewBuilder content: ()->T) {
    self.title = title
    self.content = content()
  }
  var body: some View {
    HStack {
      Text(title)
      content
    }
  }
}
GenericViewBuilder(title: "Hello") {
  
}

// Closures
class EscapingClosureVM: ObservableObject {
  @Published var text = "Hello"
  
  func downloadData2(completionHandler: @escaping(_ data: String) -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now()+1) {
      completionHandler("New Data")
    }
  }
}
func downloadData2(completionHandler: @escaping(_ data: String) -> ()) {
  DispatchQueue.main.asyncAfter(deadline: .now()+1) {
    completionHandler("New Data")
  }
}
downloadData2 { data in
  
}

// Closure Example - pass a function inside another function without a name and also returns it
func calculator(n1: Int, n2: Int, operation: (Int, Int) -> (Int)) -> Int {
  return operation(n1, n2)
}
func add(no1: Int, no2: Int) -> Int {
  return no1 + no2
}
func multiply(no1: Int, no2: Int) -> Int {
  return no1 * no2
}

print(calculator(n1: 2, n2: 5, operation: add))
print(calculator(n1: 2, n2: 5, operation: multiply))
// Or,
calculator(n1: 2, n2: 5) { (no1: Int, no2: Int) -> Int in
  return no1 * no2
}
// Or,
calculator(n1: 2, n2: 5) { (no1, no2) -> Int in
  return no1 * no2
}
// Or,
calculator(n1: 2, n2: 5) { no1, no2 in
  no1 * no2
}
// Or,
calculator(n1: 2, n2: 5) { $0 * $1 }

func increaseByOne(a: [Int], operate: ([Int]) -> ([Int])) -> [Int] {
  return operate(a)
}

let array = [0,1,2,3,4,5,6,7,8,9]

let results = increaseByOne(a: array) { (a: [Int]) -> [Int] in
  return a.map { $0 + 1 }
}
print(results)

func addOne(n1: Int) -> Int {
  return n1 + 1
}
array.map(addOne)
// Or,
array.map {(n1: Int) -> Int in
  return n1 + 1
}
// Or,
array.map {n1 -> Int in
  return n1 + 1
}
// Or,
array.map {n1 in
  return n1 + 1
}
// Or,
array.map { $0 + 1 }
// Or,
array.map({$0 + 1})
// Or,
array.map {$0 + 1}
print("NewArray------>", array.map({$0 + 1}))
// Syntax of CLosure
//{ (parameter) -> (returnType) in
//  Statements
//}

extension Double {
  func round(to places: Int) -> Double {
    let precisionNumber = pow(10, Double(places))
    var n = self
    n = n * precisionNumber
    n.round()
    n = n / precisionNumber
    return n
  }
}
var pi = 3.14159.round(to: 2)

extension UIButton {
  func makeCircular() {
    self.clipsToBounds = true
    self.layer.cornerRadius = self.frame.size.width / 2
  }
}
let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
button.backgroundColor = .red
button.makeCircular()

protocol CanFly {
  func fly()
}
extension CanFly {
  func fly() {
    print("Fly")
  }
}

// Protocols used on Enums
enum Foo1: String, CaseIterable {
  case Bing = "bing"
  case Bang = "bang"
  case Boom = "boom"
}
// Create an empty array to store the string values
var stringValues: [String] = []
Foo1.allCases.forEach { caseValue in
  stringValues.append(caseValue.rawValue)
}

print(Foo1.Bing.rawValue)
// Print the array
print(stringValues)


enum Foo: String {
  case Bing = "bing"
  case Bang = "bang"
  case Boom = "boom"
}
print(Foo.Bing.rawValue)

enum Color: CaseIterable {
  case red, green, blue
}
for color in Color.allCases {
  print("My favorite color is \(color).")
}

// Associated values.
enum Car: CaseIterable {
  static var allCases: [Car] {
    return [.ford, .toyota, .jaguar, .bmw, .porsche(convertible: false), .porsche(convertible: true)]
  }
  
  case ford, toyota, jaguar, bmw
  case porsche(convertible: Bool)
}
for car in Car.allCases {
  print("My favorite Car is \(car).")
}

enum Direction: CaseIterable {
  static var allCases: [Direction] {
    return [.north, .south, .east, .west]
  }
  
  case north, south, east, west
  
  @available(*, unavailable)
  case all
}
for direction in Direction.allCases {
  print("My direction is \(direction).")
}


struct Person: Codable {
  
  let firstName: String
  let lastName: String
  let age: Int
}

enum CodingKeys: String, CodingKey {
  
  case firstName = "first_name"
  case lastName
  case age
}

/* ******************************************************************************************************** */
// Protocols - Normal
protocol HelloPrinter {
  func sayHello()
}

struct MyStruct: HelloPrinter {
  func sayHello() {
    print("Hello")
  }
}

let myStruct = MyStruct()
myStruct.sayHello()


// Protocols - Optional - this will work only with class, not with struct, enum or associated Value enum
@objc protocol HelloPrinterOptional {
  @objc optional func sayHello()
}

class MyStruct1: HelloPrinterOptional {}
let myStruct1 = MyStruct1()


// Protocols - in Protocol, default implementations can be done by extension
protocol HelloPrinter2 {
  func sayHello()
}
extension HelloPrinter2 {
  func sayHello() {
    print("Hello extension")
  }
}
struct MyStruct2: HelloPrinter2 {}

let myStruct2 = MyStruct2()
myStruct2.sayHello()
/* ******************************************************************************************************** */


/* ******************************************************************************************************** */
// Memory Management - Weak, Owned, Unowned
class Persons {
  var name: String
  var car: Cars?
  
  init(name: String) {
    self.name = name
    print("\(name) has been initialized")
  }
  
  deinit {
    print("\(name) has been deallocated")
  }
}

class Cars {
  var make: String
  unowned var owner: Persons
  
  init(make: String, owner: Persons) {
    self.make = make
    self.owner = owner
    print("\(make) has been initialized")
  }
  
  deinit {
    print("\(make) has been deallocated")
  }
}

var john: Persons? = Persons(name: "John")
var bmw: Cars? = Cars(make: "BMW", owner: john!)
john!.car = bmw
bmw = nil
john = nil

class Persons1 {
  var name: String
  weak var spouse: Persons1?
  
  init(name: String) {
    self.name = name
  }
  
  deinit {
    print("\(name) has been deallocated")
  }
}

var alice: Persons1? = Persons1(name: "Alice")
var bob: Persons1? = Persons1(name: "Bob")

alice?.spouse = bob
bob?.spouse = alice

alice = nil
bob = nil // Both Alice and Bob are deallocated here because their spouse reference is weak

class Persons2 {
  var name: String
  lazy var greeting: () -> String = { [weak self] in
    guard let self = self else { return "Hello, someone else" }
    return "Hello, my name is \(self.name)"
  }
  
  init(name: String) {
    self.name = name
  }
  
  deinit {
    print("\(name) has been deallocated")
  }
}

var person: Persons2? = Persons2(name: "Alice")
print(person!.greeting())

person = nil // This does not deallocate the Persons2 instance





// Thread Queue GCD Sync Async

//Global + Sync
DispatchQueue.global().sync {
  sleep(2)
  print("sync: Inside")
}
print("sync: Outside")

//Global + Async
DispatchQueue.global().async {
  sleep(2)
  print("async: Inside")
}
print("async: Outside")

// Main + AsyncAfter
DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
  print("First Delay of 5 seconds")
}
DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
  print("First Delay of 2 seconds")
}

let queue = DispatchQueue.global()
let group = DispatchGroup()

queue.async(group: group) {
  sleep(3)
  print("Task 1 is done")
}
queue.async(group: group) {
  sleep(1)
  print("Task 2 is done")
}
group.wait()
print("All Tasks done")
print("Continue Execution")

print("*****************************************************")

group.enter()
queue.async(group: group) {
  sleep(3)
  print("Task 1 is done")
  group.leave()
}

group.enter()
queue.async(group: group) {
  sleep(1)
  print("Task 2 is done")
  group.leave()
}

group.notify(queue: queue) {
  print("All Tasks done")
}
print("Continue Execution")

var developers = ["Manas Vijaywargiya", "Kanishk Vijaywargiya", "MengTo", "Swiftful Thinking"]
func serialized(array: [String]) -> String {
  print("Array Count------>", array.count)
  return array.count <= 2 ? array.joined(separator: " and ") : array.dropLast().joined(separator: ", ") + " and " + array.last!
}
print(serialized(array: developers))
