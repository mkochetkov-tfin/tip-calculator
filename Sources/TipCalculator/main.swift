import Foundation

struct Split {
    let bill: Double
    let percent: Double
    let people: Int

    var tip: Double { bill * percent / 100 }
    var total: Double { bill + tip }
    var perPerson: Double { total / Double(people) }
}

func usage() -> Never {
    print("Usage: tip-calculator <bill> [percent=15] [people=1]")
    print("Example: tip-calculator 84.50 18 3")
    exit(64)
}

func money(_ value: Double) -> String {
    String(format: "%.2f", value)
}

let args = Array(CommandLine.arguments.dropFirst())
if args.isEmpty || args.contains("-h") || args.contains("--help") { usage() }

guard let bill = Double(args[0]), bill >= 0 else { usage() }
let percent = args.count > 1 ? Double(args[1]) : 15
let people = args.count > 2 ? Int(args[2]) : 1

guard let pct = percent, pct >= 0, let count = people, count > 0 else { usage() }

let split = Split(bill: bill, percent: pct, people: count)
print("Bill:       \(money(split.bill))")
print("Tip (\(money(pct))%): \(money(split.tip))")
print("Total:      \(money(split.total))")
if count > 1 {
    print("Per person: \(money(split.perPerson)) x \(count)")
}
