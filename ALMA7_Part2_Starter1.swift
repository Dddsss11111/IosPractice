// =============================================================
//  Station ALMA-7, Part II: The Teleporter Incident
//  iOS Mobile Development · Module 4 · Lab Assignment
//
//  How to use:
//   • Xcode: File → New → Playground → Blank, replace everything
//     with this file's contents.
//   • Terminal: swift ALMA7_Part2_Starter.swift
//
//  Rules:
//   • Do NOT modify the STARTER DATA section.
//   • `!` (force unwrap) is forbidden: −0.5 points each.
//   • No map / filter / reduce / compactMap.
//   • Default to struct. Use class only where the task says so.
// =============================================================


// MARK: - =================== STARTER DATA ===================
// MARK: - Do not modify anything in this section

/// Splits a line into fields.
/// fields("crate:101:120")            -> ["crate", "101", "120"]
/// fields("livestock:lab mice:12:2")  -> ["livestock", "lab mice", "12", "2"]
/// fields("junk")                     -> ["junk"]
func fields(_ line: String, separatedBy separator: Character = ":") -> [String] {
    var result: [String] = []
    var current = ""
    for character in line {
        if character == separator {
            result.append(current)
            current = ""
        } else {
            current.append(character)
        }
    }
    result.append(current)
    return result
}

/// Cargo manifest as recovered from the damaged recorder.
let rawManifest = [
    "crate:101:120",
    "container:KZ-ALM-7:340",
    "livestock:lab mice:12:2",
    "???-corrupted-line",
    "crate:102:75",
    "container:KZ-ALM-9:410",
    "livestock:ficus:3:5",
    "crate:103:260",
    "crate:104:abc",
    ""
]

/// Oxygen readings. One of these deck names is not a real deck.
let deckReadings: [(deck: String, oxygen: Int)] = [
    (deck: "bridge",     oxygen: 78),
    (deck: "lab",        oxygen: 64),
    (deck: "greenhouse", oxygen: 55),
    (deck: "cargo",      oxygen: 12),
    (deck: "medbay",     oxygen: 90),
    (deck: "engine",     oxygen: 41)
]

/// Crew records, straight from the personnel file.
let crewData: [(name: String, deck: String, oxygen: Int)] = [
    (name: "Timur",   deck: "engine", oxygen: 62),
    (name: "Dana",    deck: "lab",    oxygen: 48),
    (name: "Aigerim", deck: "bridge", oxygen: 91),
    (name: "Nurlan",  deck: "cargo",  oxygen: 17)
]

print("ALMA-7 recorder online: \(rawManifest.count) manifest lines, \(deckReadings.count) readings, \(crewData.count) crew records.")

// MARK: - ================= END OF STARTER DATA =================


// MARK: - =================== YOUR SOLUTION ===================
// Uncomment each declaration when you start working on it.


// MARK: Level 1 · The Deck Register

// 1.1
enum Deck: String, CaseIterable {
    case bridge
    case lab
    case cargo
    case medbay
    case engine

    var evacuationPriority: Int {
        switch self {
            case .bridge:
                return 1
            case .lab: 
                return 2
            case .cargo:
                return 3
            case .medbay:
                return 4
            case .engine:
                return 5
        }
    }
 }

// 1.2
enum AlarmLevel: Int {
    case green = 0
    case yellow
    case orange
    case red

    static func level(forTotalMass mass: Int) -> AlarmLevel {
        let calcValue = mass/500

        let targValue = min(calcValue, AlarmLevel.red.rawValue)

        return AlarmLevel(rawValue: targValue) ?? .green
    }
 }

print(AlarmLevel.level(forTotalMass: 0))
print(AlarmLevel.level(forTotalMass: 940))
print(AlarmLevel.level(forTotalMass: 4000))



// MARK: Level 2 · The Manifest

// 2.1
enum ManifestEntry {
    case crate(id: Int, massKg: Int)
    case container(code: String, massKg: Int)
    case livestock(species: String, count: Int, massPerUnitKg: Int)
    case unknown(raw: String)
}

// 2.2
func parseEntry(_ line: String) -> ManifestEntry {
    let parts = fields(line)
    
    guard !parts.isEmpty else {
        return .unknown(raw: line)
    }
    
    switch parts[0] {
    case "crate":
        if parts.count == 3,
           let id = Int(parts[1]),
           let massKg = Int(parts[2]) {
            return .crate(id: id, massKg: massKg)
        }
        
    case "container":
        if parts.count == 3,
           let massKg = Int(parts[2]) {
            let code = parts[1]
            return .container(code: code, massKg: massKg)
        }
        
    case "livestock":
        if parts.count == 4,
           let count = Int(parts[2]),
           let massPerUnitKg = Int(parts[3]) {
            let species = parts[1]
            return .livestock(species: species, count: count, massPerUnitKg: massPerUnitKg)
        }
        
    default:
        break
    }

    return .unknown(raw: line)
}

// 2.3
// 2.3 Функция вычисления массы записи
func mass(of entry: ManifestEntry) -> Int {
    switch entry {
    case .crate(_, let massKg):
        return massKg
    case .container(_, let massKg):
        return massKg
    case .livestock(_, let count, let massPerUnitKg):
        return count * massPerUnitKg
    case .unknown:
        return 0
    }
}

// Парсим весь rawManifest, суммируем массу и считаем .unknown строки
var totalMass = 0
var unknownCount = 0

for line in rawManifest {
    let entry = parseEntry(line)
    totalMass += mass(of: entry)
    
    if case .unknown = entry {
        unknownCount += 1
    }
}

let A = totalMass

print("Unknown lines count: \(unknownCount)")
print("Integrity Fragment A (Total Mass): \(A)")


// MARK: Level 3 · Crew Snapshots

// 3.1
struct CrewSnapshot {
    let name: String
    var deck: Deck
    var oxygen: Int

    mutating func breathe(_ amount: Int) {
        oxygen = max(0, oxygen - amount)
    }

    mutating func move(to deck: Deck) {
        self.deck = deck
    }

    mutating func reviveInMedbay() {
        self = CrewSnapshot(name: self.name, deck: .medbay, oxygen: 100)
    }

    static func rookie(named name: String) -> CrewSnapshot {
        return CrewSnapshot(name: name, deck: .bridge, oxygen: 100)
    }
}

// 3.2
var crewRoster: [CrewSnapshot] = []

for record in crewData {
    if let deck = Deck(rawValue: record.deck) {
        let snapshot = CrewSnapshot(name: record.name, deck: deck, oxygen: record.oxygen)
        crewRoster.append(snapshot)
    } else {
        print("Warning: Unknown deck '\(record.deck)' for crew member '\(record.name)'. Skipping.")
    }
}

print("Roster count:", crewRoster.count)
for member in crewRoster {
    print("Crew:", member.name, "| Deck:", member.deck.rawValue, "| O2:", member.oxygen)
}

// 3.3 · Value-semantics demonstration (copy / plain parameter / inout)

func modifyByCopy(_ snapshot: CrewSnapshot) {
    var copy = snapshot
    copy.breathe(50)
    copy.move(to: .cargo)
}

func modifyByInout(_ snapshot: inout CrewSnapshot) {
    snapshot.breathe(50)
    snapshot.move(to: .cargo)
}

var originalMember = CrewSnapshot(name: "Timur", deck: .engine, oxygen: 100)
var copyMember = originalMember

print("1a. Before modifying copy:")
print("    Original:", originalMember.name, "| Deck:", originalMember.deck.rawValue, "| O2:", originalMember.oxygen)
print("    Copy:    ", copyMember.name, "| Deck:", copyMember.deck.rawValue, "| O2:", copyMember.oxygen)

copyMember.breathe(30)
copyMember.move(to: .medbay)

print("1b. After modifying copy:")
print("    Original:", originalMember.name, "| Deck:", originalMember.deck.rawValue, "| O2:", originalMember.oxygen)
print("    Copy:    ", copyMember.name, "| Deck:", copyMember.deck.rawValue, "| O2:", copyMember.oxygen)

print("\n2a. Before non-inout function call:")
print("    Original:", originalMember.name, "| Deck:", originalMember.deck.rawValue, "| O2:", originalMember.oxygen)

modifyByCopy(originalMember)

print("2b. After non-inout function call:")
print("    Original:", originalMember.name, "| Deck:", originalMember.deck.rawValue, "| O2:", originalMember.oxygen)

print("\n3a. Before inout function call:")
print("    Original:", originalMember.name, "| Deck:", originalMember.deck.rawValue, "| O2:", originalMember.oxygen)

modifyByInout(&originalMember)

print("3b. After inout function call:")
print("    Original:", originalMember.name, "| Deck:", originalMember.deck.rawValue, "| O2:", originalMember.oxygen)

// MARK: Level 4 · The Teleport Pod

// 4.1
final class TeleportPod {
    let id: String
    var chargeLevel: Int
    var occupant: CrewSnapshot?

    init(id: String, chargeLevel: Int) {
        self.id = id
        self.chargeLevel = chargeLevel
        self.occupant = nil
    }

    func load(_ crew: CrewSnapshot) -> Bool {
        if occupant != nil || chargeLevel < 20 {
            return false
        }
        occupant = crew
        return true
    }

    func fire() -> CrewSnapshot? {
        guard let passenger = occupant else {
            return nil
        }
        
        chargeLevel -= 20
        occupant = nil
        return passenger
    }
}

// 4.2 · Charge ledger: load+fire three times, then fire an empty pod
let pod = TeleportPod(id: "P-1", chargeLevel: 100)

let timur = crewRoster[0]
let dana = crewRoster[1]
let nurlan = crewRoster[3]

print("\n--- LEVEL 4.2: The Charge Ledger ---")
print("Initial charge:", pod.chargeLevel)

_ = pod.load(timur)
_ = pod.fire()
print("1. After Timur fire() -> Charge:", pod.chargeLevel)

_ = pod.load(dana)
_ = pod.fire()
print("2. After Dana fire() -> Charge:", pod.chargeLevel)

_ = pod.load(nurlan)
_ = pod.fire()
print("3. After Nurlan fire() -> Charge:", pod.chargeLevel)

_ = pod.fire()
print("4. After empty pod fire() -> Charge:", pod.chargeLevel)

let C = pod.chargeLevel
print("Integrity Fragment C (Final Charge):", C)

// 4.3 · Reference-semantics demonstration
let originalPod = TeleportPod(id: "POD-X", chargeLevel: 100)
let podReference = originalPod

print("1a. Before modifying pod reference:")
print("    Original Pod Charge:", originalPod.chargeLevel)
print("    Pod Reference Charge:", podReference.chargeLevel)

podReference.chargeLevel = 50

print("1b. After modifying pod reference:")
print("    Original Pod Charge:", originalPod.chargeLevel)
print("    Pod Reference Charge:", podReference.chargeLevel)

var originalCrew = CrewSnapshot(name: "Dana", deck: .lab, oxygen: 100)
var crewCopy = originalCrew

print("\n2a. Before modifying crew copy:")
print("    Original Crew O2:", originalCrew.oxygen)
print("    Crew Copy O2:    ", crewCopy.oxygen)

crewCopy.oxygen = 30

print("2b. After modifying crew copy:")
print("    Original Crew O2:", originalCrew.oxygen)
print("    Crew Copy O2:    ", crewCopy.oxygen)

// Classes share a single mutable instance in memory when assigned to another variable (reference semantics), whereas structs create an entirely independent copy

// MARK: Level 5 · Station Systems

// 5.1
final class Station {
    let callSign: String

    var oxygenByDeck: [Deck: Int]

    var hullIntegrity: Int {
        willSet {
            print("Hull integrity transitioning from \(hullIntegrity) to \(newValue)")
        }
        didSet {
            if hullIntegrity < 0 {
                hullIntegrity = 0
            } else if hullIntegrity > 100 {
                hullIntegrity = 100
            }
        }
    }

    lazy var fullDiagnostics: String = {
        print("Running full scan...")
        var result = "Station \(callSign) Diagnostics:\n"
        for (deck, oxygen) in oxygenByDeck {
            result += "- \(deck.rawValue): \(oxygen)% O2\n"
        }
        return result
    }()

    var totalOxygen: Int {
        var sum = 0
        for (_, oxygen) in oxygenByDeck {
            sum += oxygen
        }
        return sum
    }

    var averageOxygen: Int {
        get {
            guard !oxygenByDeck.isEmpty else { return 0 }
            return totalOxygen / oxygenByDeck.count
        }
        set {
            for deck in oxygenByDeck.keys {
                oxygenByDeck[deck] = newValue
            }
        }
    }

    init(callSign: String, hullIntegrity: Int, readings: [(deck: String, oxygen: Int)]) {
        self.callSign = callSign
        self.hullIntegrity = min(max(0, hullIntegrity), 100)
        
        var dict: [Deck: Int] = [:]
        for reading in readings {
            if let deck = Deck(rawValue: reading.deck) {
                dict[deck] = reading.oxygen
            } else {
                print("Warning: Unknown deck '\(reading.deck)' in station readings. Skipping.")
            }
        }
        self.oxygenByDeck = dict
    }
}


let station = Station(callSign: "ALMA-7", hullIntegrity: 85, readings: deckReadings)

let B = station.averageOxygen
print("Integrity Fragment B (Initial Average Oxygen):", B)

print("\n-- Testing Property Observers --")
station.hullIntegrity = 110
print("Clamped Hull Integrity:", station.hullIntegrity)

station.hullIntegrity = -20
print("Clamped Hull Integrity:", station.hullIntegrity)

print("\n-- Testing Lazy Property --")
print("Lazy property not touched yet.")
print("Accessing fullDiagnostics for 1st time:")
print(station.fullDiagnostics)

print("Accessing fullDiagnostics for 2nd time:")
print(station.fullDiagnostics)

print("\n-- Testing Average Oxygen Setter --")
print("Average O2 before set:", station.averageOxygen)
station.averageOxygen = 75
print("Average O2 after setting to 75:", station.averageOxygen)
print("Updated deck values:", station.oxygenByDeck)

// 5.2 · The clamp trap: 130, then -40, then 55

station.hullIntegrity = 130
print("After setting to 130 -> hullIntegrity:", station.hullIntegrity)

station.hullIntegrity = -40
print("After setting to -40 -> hullIntegrity:", station.hullIntegrity)

station.hullIntegrity = 55
print("After setting to 55  -> hullIntegrity:", station.hullIntegrity)

// MARK: Level 6 · Incident Reports
// Three of these compile and are wrong. One does not compile.
// For each: expectation, actual behaviour, the language rule, the fix.

// Report 1
var roster = crewRoster
for i in 0..<roster.count {
    roster[i].oxygen -= 10
}
print("Report 1 Fixed O2:", roster[0].oxygen)

// Report 2
let podA = TeleportPod(id: "A", chargeLevel: 100)
let podB = TeleportPod(id: "B", chargeLevel: 100)
podB.chargeLevel = 0
print("Report 2 Fixed PodA Charge:", podA.chargeLevel)

// Report 3
struct Logbook {
    var entries: [String] = []
    
    mutating func add(_ entry: String) {
        entries.append(entry)
    }
}
var logbook = Logbook()
logbook.add("System initialized")
print("Report 3 Fixed Entries:", logbook.entries.count)

// Report 4
var snapshot = CrewSnapshot.rookie(named: "Dana")
snapshot.oxygen = 40

let podItem = TeleportPod(id: "B", chargeLevel: 50)
podItem.chargeLevel = 10
print("Report 4 Fixed Snapshot O2:", snapshot.oxygen, "| Pod Charge:", podItem.chargeLevel)

/* Report 1:
 - Expected: Decreasing oxygen for all crew members in the array.
 - Actual: Original array elements remain unchanged.
 - Language Rule: Structs are value types. A `for-in` loop creates a local copy of each element. Mutating the loop variable changes only the copy.

 Report 2:
 - Expected: `podA.chargeLevel` stays at 100 after modifying `podB`.
 - Actual: `podA.chargeLevel` changes to 0.
 - Language Rule: Classes are reference types. Assigning `let podB = podA` copies the reference pointer, so both variables reference the exact same object in memory.

 Report 3:
 - Expected: Appending a string to `entries` inside the method.
 - Actual: Does not compile (`self is immutable`).
 - Language Rule: Struct instance methods cannot mutate stored properties unless explicitly marked with the `mutating` keyword.

 Report 4:
 - Expected: Setting `snapshot.oxygen = 40` and `podItem.chargeLevel = 10`.
 - Actual: `snapshot.oxygen = 40` fails to compile; `podItem.chargeLevel = 10` succeeds.
 - Language Rule: Declaring a struct (value type) with `let` freezes the entire object, preventing modification of any property. Declaring a class (reference type) with `let` prevents reassigning the reference itself, but internal properties marked with `var` remain mutable.
*/ 
// MARK: Level 7 · Sealing the Black Box
final class FlightRecorder {
    private(set) var entries: [String] = []

    private(set) var isSealed = false
    
    public init() {}
    
    public func addEntry(_ entry: String) {
        guard !isSealed else {
            print("Warning: Cannot append entry. FlightRecorder is sealed")
            return
        }
        entries.append(entry)
    }
    
    public func seal() {
        isSealed = true
    }
}

fileprivate func formatAuditEntry(_ entry: String) -> String {
    return "• \(entry)"
}

func auditTranscript(of recorder: FlightRecorder) -> String {
    var result = "Audit Transcript (\(recorder.entries.count) entries):\n"
    for entry in recorder.entries {
        result += formatAuditEntry(entry) + "\n"
    }
    return result
}



// FAILED ATTEMPT TO BREAK ACCESS CONTROL:
/*
 let recorder = FlightRecorder()
 recorder.entries = []
 // Compiler error: Cannot assign to property: 'entries' setter is inaccessible
 
 recorder.isSealed = false
 // Compiler error: Cannot assign to property: 'isSealed' setter is inaccessible
*/


// MARK: Finale · Integrity Code

let D = AlarmLevel.level(forTotalMass: A).rawValue
let integrityCode = "\(A)-\(B)-\(C)-\(D)"
print("INTEGRITY CODE: \(integrityCode)")


// MARK: Bonus

// deinit in TeleportPod, a do-block lifetime experiment, and === identity


// MARK: - ================= DEFENSE QUESTIONS =================
/*
 1. Why did CrewSnapshot get an initializer for free and TeleportPod did not?

 2. What does `mutating` do to self, and why do classes never need it?

 3. In Report 4 both values are `let`. What exactly does `let` freeze for a
    struct, and what does it freeze for a class?

 4. Why must a lazy property be var? When does lazy change behaviour, not
    just performance?

 5. private vs fileprivate: where in your FlightRecorder would private be
    too strict?

 Bonus. On which line does deinit fire, and why can't === be used on
 CrewSnapshot?

*/
