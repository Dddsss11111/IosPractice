import Foundation

let name = "Doszhan"
var score = 0
score = 10

let a = 5
let b = 2.0
let c = Double(a) + b

let line = "Hello, \(name). You have \(score) points."
print(line)

var numbers = [1, 2, 3]
var copy = numbers
copy.append(4)
print("Original: \(numbers)")
print("Copy: \(copy)")

if score > 5 {
    print("Pass")
}

func move(from a: Int, to b: Int) {
    print("Moving from \(a) to \(b)")
}
move(from: 0, to: 5)