func checkBoardBounds(n: Int, m: Int, steps: String) -> String {
    for startX in 1...n {
        for startY in 1...m {
            var x = startX, y = startY
            var isValid = true
            for step in steps {
                switch step {
                case "L": x -= 1
                case "R": x += 1
                case "D": y -= 1
                case "U": y += 1
                default: return "Ошибка в ходах"
                }
                if x < 1 || x > n || y < 1 || y > m {
                    isValid = false
                    break
                }
            }
            if isValid {
                return "(\(startX),\(startY))"
            }
        }
    }
    return "No"
}

let n = Int(readLine()!)!
let m = Int(readLine()!)!
let steps = readLine()!.trimmingCharacters(in: .whitespaces)
print(checkBoardBounds(n: n, m: m, steps: steps))