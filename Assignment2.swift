// Easy Tasks

var fruits = ["Apple", "Banana", "Cherry", "Mango", "Peach"]
print(fruits[2])

var favNum: Set<Int> = [3, 7, 9, 12, 15]
favNum.insert(66)
print(favNum)

var languages = ["Swift": 2014, "Python": 1991, "Java": 1995]
print(languages["Swift"]!)

var colors = ["Red", "Green", "Blue", "Yellow"]
colors[1] = "Purple"
print(colors)

// Medium Tasks

var set1: Set<Int> = [1, 2, 3, 4]
var set2: Set<Int> = [3, 4, 5, 6]
var set3 = set1.intersection(set2)
print(set3)

var students = ["Doszhan" : 90, "Eldar": 85, "Nurali": 95]
students["Eldar"] = 92
print(students)

var fruits1 = ["Apple", "Banana"]
var fruits2 = ["Cherry", "Date"]
var combo = fruits1 + fruits2
print(combo)

//Hard Tasks

var countries = ["Kazakhstan" : 20000000, "USA" : 339000000, "Japan" : 126000000]
countries["France"] = 67000000
print(countries)

var setA: Set<String> = ["cat", "dog"]
var setB: Set<String> = ["dog", "mouse"]
var setU = setA.union(setB)
var setS = setU.subtracting(setB)
print(setS)

var studentgrades: [String: [Int]] = [
    "Doszhan" : [85, 90, 78],
    "Aisha": [92, 88, 95]
]
print(studentgrades["Doszhan"]![1])