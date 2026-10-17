# tip-calculator

Tiny Swift command-line tool that splits a bill: tip, total and share per person. No dependencies.

## Run

```sh
swift run TipCalculator 84.50 18 3
```

```
Bill:       84.50
Tip (18.00%): 15.21
Total:      99.71
Per person: 33.24 x 3
```

Arguments: `<bill> [percent=15] [people=1]`. Built with Swift 6.2 (SwiftPM, tools version 5.9).
