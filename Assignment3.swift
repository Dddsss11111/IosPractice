import Foundation

// Task 1.1
func parseReading(raw: String) -> Reading? {
    guard let (sensor, valueStr) = splitOnce(by: ":", in: raw),
          !sensor.isEmpty,
          let value = Int(valueStr),
          sensor == "TEMP" || value >= 0 else {
        return nil
    }
    return (sensor: sensor, value: value)
}

// Task 1.2
func parseLog(lines: [String]) -> (valid: [Reading], invalidCount: Int) {
    var validReadings: [Reading] = []
    var invalidCount = 0
    for line in lines {
        if let reading = parseReading(raw: line) {
            validReadings.append(reading)
        } else {
            invalidCount += 1
        }
    }
    return (valid: validReadings, invalidCount: invalidCount)
}

let logResult = parseLog(lines: rawLog)
let codeFragmentA = logResult.invalidCount

// Task 2.1
func select(readings: [Reading], where isIncluded: (Reading) -> Bool) -> [Reading] {
    var result: [Reading] = []
    for reading in readings {
        if isIncluded(reading) {
            result.append(reading)
        }
    }
    return result
}

func values(of readings: [Reading]) -> [Int] {
    var result: [Int] = []
    for reading in readings {
        result.append(reading.value)
    }
    return result
}

// Task 2.2
func stats(of values: [Int]) -> (min: Int, max: Int, average: Double)? {
    guard !values.isEmpty else { return nil }
    var minVal = values[0]
    var maxVal = values[0]
    var sum = 0
    for val in values {
        if val < minVal { minVal = val }
        if val > maxVal { maxVal = val }
        sum += val
    }
    let avg = Double(sum) / Double(values.count)
    return (min: minVal, max: maxVal, average: avg)
}

func stats(_ values: Int...) -> (min: Int, max: Int, average: Double)? {
    stats(of: values)
}

let o2Readings = select(readings: logResult.valid) { $0.sensor == "O2" }
let o2Values = values(of: o2Readings)
let o2Stats = stats(of: o2Values)
let codeFragmentB = Int(o2Stats?.average ?? 0)

// Task 2.3
let sorted1 = logResult.valid.sorted(by: { (r1: Reading, r2: Reading) -> Bool in return r1.value > r2.value })
let sorted2 = logResult.valid.sorted(by: { r1, r2 in return r1.value > r2.value })
let sorted3 = logResult.valid.sorted(by: { r1, r2 in r1.value > r2.value })
let sorted4 = logResult.valid.sorted(by: { $0.value > $1.value })
let sorted5 = logResult.valid.sorted { $0.value > $1.value }

// Task 3.1
func heatUp(_ temp: Int) -> Int { temp + 5 }
func coolDown(_ temp: Int) -> Int { temp - 3 }
func hold(_ temp: Int) -> Int { temp }

func chooseProtocol(for temp: Int) -> (Int) -> Int {
    if temp < 18 {
        return heatUp
    } else if temp > 24 {
        return coolDown
    } else {
        return hold
    }
}

// Task 3.2
func runUntilStable(from start: Int, maxSteps: Int = 10) -> (finalTemp: Int, steps: Int, isStable: Bool) {
    var currentTemp = start
    var steps = 0
    while (currentTemp < 18 || currentTemp > 24) && steps < maxSteps {
        let proto = chooseProtocol(for: currentTemp)
        currentTemp = proto(currentTemp)
        steps += 1
    }
    let isStable = (currentTemp >= 18 && currentTemp <= 24)
    return (finalTemp: currentTemp, steps: steps, isStable: isStable)
}

let tempReadings = select(readings: logResult.valid) { $0.sensor == "TEMP" }
let tempValues = values(of: tempReadings)
let tempStats = stats(of: tempValues)
let lowestTemp = tempStats?.min ?? 18

let stabilityResult = runUntilStable(from: lowestTemp)
let codeFragmentC = stabilityResult.steps

// Task 4.1
func oxygenLevel(of member: CrewMember) -> Int? {
    member.module?.oxygenTank?.level
}

// Task 4.2
func status(of member: CrewMember) -> String {
    guard let module = member.module else {
        return "\(member.name): no data (open space)"
    }
    guard let level = oxygenLevel(of: member) else {
        return "\(member.name): no data (\(module.name))"
    }
    let statusText = level < 20 ? "CRITICAL" : "OK"
    return "\(member.name): \(level)% \(statusText)"
}

// Task 4.3
@discardableResult
func transferOxygen(from source: inout Int, to target: inout Int, amount: Int) -> Int {
    guard amount > 0 else { return 0 }
    let maxCanTake = source
    let maxCanReceive = 100 - target
    let actualTransferred = min(amount, maxCanTake, maxCanReceive)
    
    source -= actualTransferred
    target += actualTransferred
    return actualTransferred
}

if let labTank = lab.oxygenTank, let habTank = hab.oxygenTank {
    transferOxygen(from: &labTank.level, to: &habTank.level, amount: 30)
}

let codeFragmentD = hab.oxygenTank?.level ?? 0

// Task 4.4
func evacuationOrder(names: String..., roster: [String: CrewMember]) -> [String] {
    var foundMembers: [CrewMember] = []
    for name in names {
        guard let member = roster[name] else {
            print("Unknown crew member: \(name)")
            continue
        }
        foundMembers.append(member)
    }
    foundMembers.sort { $0.priority < $1.priority }
    
    var sortedNames: [String] = []
    for member in foundMembers {
        sortedNames.append(member.name)
    }
    return sortedNames
}

// Task 5.1
let encryptedEntries = [
    "   2026-03-01 |   O2_VALVE  | OK   ",
    "2026-03-02|TEMP_CTRL|WARING ",
    "   2026-03-03 | RAD_SHIELD | CRITICAL   ",
    "INVALID LINE",
    "2026-03-04| O2_VALVE |OK"
]

struct Entry {
    let date: String
    let system: String
    let status: String
}

// Task 5.2
let cleanedEntries = encryptedEntries
    .compactMap { line -> Entry? in
        let parts = line.split(separator: "|")
        guard parts.count == 3 else { return nil }
        
        let date = parts[0].trimmingCharacters(in: .whitespaces)
        let system = parts[1].trimmingCharacters(in: .whitespaces)
        let status = parts[2].trimmingCharacters(in: .whitespaces)
        
        return Entry(date: date, system: system, status: status)
    }
    .filter { $0.status != "OK" }
    .sorted { $0.date > $1.date }

let codeFragmentE = cleanedEntries.first?.system ?? "UNKNOWN"

// Launch Code
let launchCode = "\(codeFragmentA)-\(codeFragmentB)-\(codeFragmentC)-\(codeFragmentD)-\(codeFragmentE)"

print("Launch Code: \(launchCode)")